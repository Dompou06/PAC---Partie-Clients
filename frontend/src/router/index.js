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
      // Si l'utilisateur n'est pas authentifié
      if (!store.getters['auth/authenticated']) {
        return next({
          name: 'signIn'
        })
      }
      next()
    } 
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/error',
    name: 'TheError',
    component: TheError
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
