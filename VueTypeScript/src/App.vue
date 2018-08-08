<template>
  <div id="app">
    <el-container>
      <el-header>{{ siteTitle }}</el-header>
      <el-container>
        <el-aside>
          <Menu></Menu>
        </el-aside>
        <el-main>
          <router-view/>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script lang="ts">
import Menu from '@/components/Menu.vue'

export default {
  name: 'App',
  components: {
    Menu,
  },
  data () {
    return {
      siteTitle: 'Vue.js in TypeScript'
    }
  }
}
</script>

<style>
</style>
