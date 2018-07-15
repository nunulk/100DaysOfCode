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
  mutations: {
    increament (state) {
      state.count++
    }
  }
}

export default new Vuex.Store<RootState>(store)