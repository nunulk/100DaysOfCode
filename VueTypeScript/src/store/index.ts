import Vue from 'vue'
import Vuex, { StoreOptions, GetterTree, MutationTree, ActionTree, ActionContext } from 'vuex'

Vue.use(Vuex)

export interface Counter {
  value: number
}

interface CounterState {
  counter: Counter
}

interface CounterGetters extends GetterTree<CounterState, CounterState> {
  current: (state: CounterState) => number
  next: (state: CounterState) => number
}

interface CounterMutations extends MutationTree<CounterState> {
  set: (state: CounterState, counter: Counter) => void
  increment: (state: CounterState) => void
}

interface CounterActions extends ActionTree<CounterState, CounterState> {
  incrementAsync: (context: ActionContext<CounterState, CounterState>) => void
}

const state: CounterState = {
  counter: { value: 5 },
}

const getters: CounterGetters = {
  current (state: CounterState): number {
    return state.counter.value
 },
 next (state: CounterState): number {
    return state.counter.value + 1
  }
}

const mutations: CounterMutations = {
  set (state: CounterState, counter: Counter) {
    state.counter = counter
  },
  increment (state: CounterState) {
    state.counter.value++
  }
}

const actions: CounterActions = {
  incrementAsync (context: ActionContext<CounterState, CounterState>) {
    setTimeout(() => {
      context.commit('increment')
    }, 1000)
  }
}

const store: StoreOptions<CounterState> = {
  state,
  getters,
  mutations,
  actions,
}

export default new Vuex.Store<CounterState>(store)