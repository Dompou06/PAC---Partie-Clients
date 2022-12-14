import store from '@/store'
import { createRouter, createWebHistory } from 'vue-router'
import EmailPassword from '../components/EmailPassword.vue'
import NewPassword from '../components/NewPassword.vue'
import ProfileUser from '../components/ProfileUser.vue'
import SignIn from '../components/SignIn.vue'
import SignUp from '../components/SignUp.vue'
import TheCart from '../components/TheCart.vue'
import TheError from '../components/TheError.vue'
import TheProducts from '../components/TheProducts.vue'
import HomeView from '../views/HomeView.vue'

import TheStock from '../components/operators/managers/TheStock.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/signup',
    name: 'SignUp',
    component: SignUp
  },
  {
    path: '/signin',
    name: 'SignIn',
    component: SignIn
  },
  {
    path: '/products',
    name: 'TheProducts',
    component: TheProducts
  },
  {
    path: '/cart',
    name: 'TheCart',
    component: TheCart
  },
  {
    path: '/password',
    name: 'EmailPassword',
    component: EmailPassword
  },
  {
    path: '/compte/password',
    name: 'NewPassword',
    component: NewPassword
  },
  {
    path: '/profile',
    name: 'ProfileUser',
    component: ProfileUser,
    beforeEnter: (to, from, next) => {
      // Si l'utilisateur n'est pas authentifi√©
      if (!store.getters['auth/authenticated']) {
        return next({
          name: 'signIn'
        })
      }
      next()
    } 
  },
  {
    path: '/stock',
    name: 'TheStock',
    component: TheStock,
    beforeEnter: (to, from, next) => {
      if(!store.getters['auth/role'].includes('Manager')) {
        return next({
          name: 'home'
        })
      }
      next()
    }
  },
  {
    path: '/error',
    name: 'TheError',
    component: TheError
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
