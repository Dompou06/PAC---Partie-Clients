import api from '@/services/api'

const getDefaultState = () => {
  return {
    token: null,
    user: null,
    role: [],
    management: null,
    authenticated: false,
  }
}

export default {
  namespaced: true,
  state: getDefaultState(),
  getters: {
    token(state) {
      return state.token
    },
    authenticated(state) {
      return state.authenticated
    },
    user(state) {
      return state.user
    },
    role(state) {
      return state.role
    },
    management(state) {
      return state.management
    },
  },
  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_AUTHENTIFICADED: (state, authenticated) => {
      state.authenticated = authenticated
    },
    SET_USER: (state, user) => {
      state.user = user
    },
    SET_ROLE: (state, role) => {
      state.role = role
    },
    SET_MANAGEMENT: (state, management) => {
      state.management = management
    },
  },
  actions: {
    signauth: ({
      dispatch
    }, credential) => {
      return dispatch('attempt', credential)
    },
    async attempt({
      commit, state
    }, credential) {
      const token = credential.token
      if (token) {
        commit('SET_TOKEN', token)
        commit('SET_AUTHENTIFICADED', true)
      }
      if(!state.token) {
        return
      }
      try {
        let response = await api
          .get('auth/me', {
            headers: {
              'x-access-token': token
            }
          })
        const newtoken = response.data.token
        if(token != newtoken) {
          commit('SET_TOKEN', newtoken)
          commit('SET_AUTHENTIFICADED', true)
        }
        let user = `${response.data.firstname} ${response.data.lastname}`
        commit('SET_USER', user)
        let role = response.data.roles.slice()
        commit('SET_ROLE', role)
        commit('SET_MANAGEMENT', null)
      } catch(err) {
        commit('SET_TOKEN', null)
        commit('SET_AUTHENTIFICADED', false)
        commit('SET_USER', null)
        commit('SET_ROLE', [])      
        commit('SET_MANAGEMENT', null)
      }
    },
    refreshToken: ({
      commit
    }, credential) => {
      commit('SET_TOKEN', credential)
      commit('SET_AUTHENTIFICADED', true)
    },
    updateUser: ({
      commit
    }, credential) => {
      commit('SET_USER', credential)
    },
    changeManagement: ({
      commit
    }, credential) => {
      if(credential === 'Client') {
        commit('SET_MANAGEMENT', 'Customer')
      } else {
        commit('SET_MANAGEMENT', credential)
      }
    },
    logout: ({ commit }) => {
      commit('SET_TOKEN', null)
      commit('SET_AUTHENTIFICADED', false)
      commit('SET_USER', null)
      commit('SET_ROLE', [])  
      commit('SET_MANAGEMENT', null)
    }
  }
}