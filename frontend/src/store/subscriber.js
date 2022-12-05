import store from '@/store'
import axios from 'axios'

store.subscribe((mutation) => {
  switch(mutation.type) {
  //Ecoute les mutations du token
  case 'auth/SET_TOKEN':
    //Intégration dans le localStorage
    if(mutation.payload) {
      axios.defaults.headers.common['x-access-token'] = `${mutation.payload}`
      localStorage.setItem('user', mutation.payload)
    } else {
      //Suppression dans le localStorage
      axios.defaults.headers.common['x-access-token'] = null
      localStorage.removeItem('user')
    }
    break
    //Ecoute les mutations du management
  case 'auth/SET_MANAGEMENT':
    if(mutation.payload) {
      return mutation.payload
      //console.log('mutation.payload', mutation.payload)
    }
    break
  }
})