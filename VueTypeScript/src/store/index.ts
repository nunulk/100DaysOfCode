import Vue from 'vue'
import Vuex, { StoreOptions } from 'vuex'

Vue.use(Vuex)

export interface RootState {
  count: number
}

const store: StoreOptions<RootState> = {
  state: {
    count: 10
  },
  getters: {
    next (state): number {
      return state.count + 1
    },
  },
  mutations: {
    set (state, num) {
      state.count = num
    },
    increment (state) {
      state.count++
    }
  },
  actions: {
    incrementAsync ({ commit }) {
      setTimeout(() => {
        commit('increment')
      }, 1000)
    }
  }
}

export default new Vuex.Store<RootState>(store)