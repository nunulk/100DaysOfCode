<template>
  <div class="hello">
    <h1>{{ count }}</h1>
  </div>
</template>

<script lang="ts">
import Vue, { ComponentOptions } from 'vue'

interface HelloWorld extends Vue {
  count: () => number
}

export default {
  name: 'HelloWorld',
  computed: {
    count (this: HelloWorld): number {
      return this.$store.state.count
    }
  }
} as ComponentOptions<Vue>
</script>

<style scoped>
</style>
