import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/pages/Home'
import Buttons from '@/pages/Buttons'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/buttons',
      name: 'Buttons',
      component: Buttons
    }
  ]
})
