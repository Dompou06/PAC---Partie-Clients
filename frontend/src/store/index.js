//Supprimer createLogger en production (affiche les mutations dans la console)
import {
  createLogger, createStore
} from 'vuex'
import auth from './auth-module'
import cart from './cart-module'

const store = createStore({
  state: {
  },
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    auth,
    cart,
  },
  plugins: [createLogger()]
})

export default store
