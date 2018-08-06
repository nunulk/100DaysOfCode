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

interface HelloWorld extends Vue {
  value: number
  loading: boolean
  current: number
  next: number
  set: (n: number) => void
  increment: () => void
  incrementAsync: () => void
}

export default {
  name: 'HelloWorld',
  props: {
    value: {
      type: Number,
      required: true,
    },
  },
  data () {
    return {
      loading: false,
    }
  },
  created (this: HelloWorld) {
    this.set(this.value)
  },
  computed: {
    ...mapState({current: 'count'}),
    ...mapGetters(['next']),
    half (this: HelloWorld) {
      return this.current / 2
    }
  },
  methods: {
    ...mapMutations(['set', 'increment']),
    ...mapActions(['incrementAsync']),
    handleClickAsync (this: HelloWorld) {
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
