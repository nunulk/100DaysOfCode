<template>
  <div>
    <h1>{{ msg }}</h1>
    <hello-world :value="1"></hello-world>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import HelloWorld from '@/components/HelloWorld.vue'

export default Vue.extend({
  name: 'Home',
  components: {
    HelloWorld
  },
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
})
</script>
