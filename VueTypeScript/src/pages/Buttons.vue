<template>
  <div class="content">
    <el-card>
      <div slot="header">Buttons</div>
      <div>
        <el-button v-loading="loading" class="button" @click="handleButtonClick">{{ buttonLabel }}</el-button>
      </div>
    </el-card>
  </div>
</template>

<script lang="ts">
import Vue, { ComponentOptions } from 'vue'
interface ButtonsPage extends Vue {
  buttonLabel: String
  loading: boolean
}
export default {
  data () {
    return {
      loading: false,
    }
  },
  computed: {
    buttonLabel () {
      return (this.loading) ? '...' : 'Click'
    },
  },
  methods: {
    handleButtonClick () {
      this.loading = true
      setTimeout(() => {
        this.loading = false
      }, 2000)
    }
  }
} as ComponentOptions<ButtonsPage>
</script>
<style lang="scss" scoped>
.button {
  min-width: 80px;
}
</style>
