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
  mutations: {
    STOCK_COUNT(state, amount) {
      state.cart = Number(amount)
    },
    CREASE_COUNT(state, amount) {
      state.cart += Number(amount)
    },
  },
  actions: {
    showCount({ commit }, amount) {
      commit('STOCK_COUNT', amount)
    },
    updateCount({ commit }, amount) {
      commit('CREASE_COUNT', amount)
    },
  }
}