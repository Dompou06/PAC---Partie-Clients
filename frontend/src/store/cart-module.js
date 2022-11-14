export default {
  namespaced: true,
  state: {
    cart: 0
  },
  getters: {
    cart(state) {
      return state.cart
    },
  },
  //https://dev.to/viniciuskneves/watch-for-vuex-state-changes-2mgj
  mutations: {
    CREASE_COUNT(state, amount) {
      state.cart += Number(amount)
    },
  },
  actions: {
    updateCount({ commit }, amount) {
      commit('CREASE_COUNT', amount)
    }
  }
}