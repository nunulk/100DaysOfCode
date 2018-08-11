<template>
  <div class="content">
    <counter :value="1"></counter>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import Counter from '@/components/Counter.vue'

export default Vue.extend({
  name: 'Home',
  components: {
    Counter,
  },
})
</script>
