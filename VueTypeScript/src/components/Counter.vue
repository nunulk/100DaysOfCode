<template>
  <div class="hello">
    <el-card
      v-loading.fullscreen.lock="loading"
      element-loading-background="rgba(0, 0, 0, 0.8)">
      <div slot="header">
        Counter
      </div>
      <div>
        <ul>
          <li>current: {{ current }}</li>
          <li>next: {{ next }}</li>
          <li>half: {{ half }}</li>
        </ul>
        <div>
          <el-button type="primary" @click="increment">Count up now</el-button>
          <el-button type="primary" @click="handleClickAsync">Count up in 1 sec.</el-button>
        </div>
      </div>      
    </el-card>
  </div>
</template>

<script lang="ts">
import Vue, { ComponentOptions } from 'vue'
import { mapState, mapMutations, mapGetters, mapActions } from 'vuex'
import { Counter } from '@/store'

interface CounterComponent extends Vue {
  value: number
  counter: Counter
  loading: boolean
  current: number
  next: number
  set: (c: Counter) => void
  increment: () => void
  incrementAsync: () => void
}

export default {
  name: 'counter',
  props: {
    value: {
      type: Number,
      required: true,
    },
  },
  data () {
    return {
      counter: { value: 0 },
      loading: false,
    }
  },
  created (this: CounterComponent) {
    this.counter.value = this.value
    this.set(this.counter)
  },
  computed: {
    ...mapState({counterState: 'counter'}),
    ...mapGetters(['current', 'next']),
    half (this: CounterComponent): number {
      return this.current / 2
    }
  },
  methods: {
    ...mapMutations(['set', 'increment']),
    ...mapActions(['incrementAsync']),
    handleClickAsync (this: CounterComponent): void {
      this.loading = true
      this.incrementAsync()
      setTimeout(() => {
        this.loading = false;
      }, 2000)
    },
  },
} as ComponentOptions<Vue>
</script>

<style scoped>
</style>
