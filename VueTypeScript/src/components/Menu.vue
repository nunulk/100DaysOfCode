<template>
  <ul>
    <li><router-link to="/">Home</router-link></li>
    <li><router-link to="/buttons">Button</router-link></li>
  </ul>
</template>
<script lang="ts">
import Vue, { ComponentOptions } from 'vue'

interface MenuComponent extends Vue {
}

export default {
  name: 'Menu'
} as ComponentOptions<MenuComponent>
</script>
