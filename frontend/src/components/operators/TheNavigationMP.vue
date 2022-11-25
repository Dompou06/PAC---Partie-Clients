<template>
  <nav class="navbar-expand-v nav_bg">
    <div class="z50" @mouseleave="mouseLeaveMd">
      <router-link to="/" class="navbar-brand" aria-label="Accueil">
        <img src="../../assets/img/nav_pac.png" alt="Accueil" />
      </router-link>
      <!-- Menu desktop -->
      <div v-if="!mobile">
        <div class="nav-d d-flex justify-content-between align-items-center">
          <div
            id="articlesd"
            class="flex-fill dropdown"
            :class="{
              buttonactive: sectionActive === 'products',
            }"
          >
            <button
              class="btn fw-bold"
              type="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              aria-label="Articles"
            >
              <span class="text-tools--ultradarken"
                >Stock <font-awesome-icon :icon="['fas', 'caret-down']" />
              </span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="Listes des rayons">
              <li>
                <div v-for="dep in departements" :key="dep.family_description">
                  <router-link
                    :to="{
                      name: 'TheProducts',
                      params: {
                        linkType: `${dep.family_id}__products`,
                      },
                    }"
                    class="dropdown-item nav-color fw-bold"
                    :class="{
                      actived:
                        dep.family_description === family ||
                        linkActive === `${dep.family_id}`,
                    }"
                    :aria-label="`${dep.family_description}`"
                    ><span>{{ dep.family_description }}</span>
                  </router-link>
                  <div v-for="cat in dep.categories" :key="cat" class="col-12">
                    <div
                      v-if="
                        cat.family_abbreviation === dep.family_id &&
                        cat.category_products === 'true'
                      "
                    >
                      <router-link
                        :to="{
                          name: 'TheProducts',
                          params: {
                            linkType: `${dep.family_id}_${cat.category_id}_products`,
                          },
                        }"
                        class="dropdown-item nav-color subcategory"
                        :class="{
                          actived:
                            cat.category_abbreviation === category ||
                            subLinkActive === `${cat.category_id}`,
                        }"
                        :aria-label="`${dep.family_description} ${cat.category_description}`"
                      >
                        <span @click="toggleMobileNav">{{
                          cat.category_description
                        }}</span>
                      </router-link>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          <div
v-if="management === 'Manager'"
          class="flex-fill">
            <TheNavManager />
          </div>
          <div v-else-if="management === 'Administrator'" class="flex-fill">
             <TheNavAdministrator />
          </div>
          <div id="search" class="flex-fill">
            <TheSearch />
          </div>
          <div
            class="flex-fill div-right d-flex justify-content-end align-items-center"
           >
           <div class="text-right fw-bold">{{ timestamp }}</div>
           <div
              class="dropdown"
              :class="{
                buttonactive:
                  sectionActive === 'user' || subLinkActive === 'profile',
              }"
            >
              <button
                class="btn fw-bold"
                type="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                aria-label="Utilisateur"
              >
                <span class="text-tools--ultradarken"
                  >{{ user }}
                  <font-awesome-icon :icon="['fas', 'caret-down']" />
                </span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="Options utilisateur">
                <li v-for="item in roles.slice().reverse()" :key="item">
                  <div
                    :class="{ actived: management === item.role }"
                    class="dropdown-item nav-color fw-bold cursor"
                    @click="changeRole(item.role)"
                  >
                    {{ item.role }}
                  </div>
                </li>
                <li class="dropdown-item cursor" @click.prevent="logOut">
                  Déconnexion
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
     <!--Mobile--> 
      <div v-else>
        <!--<div
        class="dropend mt-2 align-self-start"
        :class="{ buttonactive: sectionActive === 'products' }"
        >
        <button
          type="button"
          class="btn nav-color"
          data-bs-toggle="dropdown"
          data-bs-display="static"
          aria-expanded="false"
          aria-label="Articles en stock"
          @click="closeDropdownUser"
        >
          <span class="text-tools--ultradarken"
            ><font-awesome-icon :icon="['fas', 'cart-arrow-down']" />
          </span>
        </button>
        <ul class="dropdown-menu nav_bg">
          <li class="nav-color d-flex flex-row pt-0">
            <div
              v-for="dep in departements"
              :key="dep.family_description"
              class="flex-fill p-0"
            >
              <div :class="{ familyborder: dep.family_id != 3 }">
                <router-link
                  :to="{
                    name: 'TheProducts',
                    params: {
                      linkType: `${dep.family_id}__products`,
                    },
                  }"
                  class="dropdown-item fw-bold lh1"
                  :class="{
                    actived:
                      dep.family_description === family ||
                      linkActive === `${dep.family_id}`,
                  }"
                  :aria-label="`${dep.family_description}`"
                  ><span @click="toggleMobileNav">{{
                    dep.family_description
                  }}</span>
                </router-link>
                <div v-for="cat in dep.categories" :key="cat" class="rd">
                  <div
                    v-if="
                      cat.family_abbreviation === dep.family_id &&
                      cat.category_products === 'true'
                    "
                  >
                    <router-link
                      :to="{
                        name: 'TheProducts',
                        params: {
                          linkType: `${dep.family_id}_${cat.category_id}_products`,
                        },
                      }"
                      class="dropdown-item nav-color subcategory"
                      :class="{
                        actived:
                          cat.category_abbreviation === category ||
                          subLinkActive === `${cat.category_id}`,
                      }"
                      :aria-label="`${dep.family_description} ${cat.category_description}`"
                    >
                      <span class="ps-1" @click="toggleMobileNav">{{
                        cat.category_description
                      }}</span>
                    </router-link>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>-->
      <!--<div id="lineSearch" class="d-flex" @mouseleave="mouseLeaveS">
        <div
          id="buttonSearch"
          type="button"
          class="btn nav-color"
          aria-label="Rechercher"
          @click="eventSearch"
        >
          <span class="text-tools--ultradarken"
            ><font-awesome-icon :icon="['fas', 'magnifying-glass']" />
          </span>
        </div>
        <div id="menuSearch" class="hidden">
          <TheSearch @closeSearch="nofocusSearch" />
        </div>
      </div>-->
      <section>
        <div
          class="dropend mt-2 align-self-start"
          :class="{
            buttonactive:
              sectionActive === 'user' || subLinkActive === 'profile',
          }"
        >
          <button
            type="button"
            class="btn nav-color ps-1"
            data-bs-toggle="dropdown"
            data-bs-display="static"
            aria-expanded="false"
            aria-label="Utilisateur"
            @click="toggleDropdownUser"
          >
            <span class="text-tools--ultradarken"
              ><font-awesome-icon :icon="['fas', 'user']" />
            </span>
          </button>
          <ul class="dropdown-menu nav_bg dropdown-user">
            <li
              class="ps-1 fw-bold user lh1"
              :class="{ actived: sectionActive === 'user' }"
            >
              {{ user }}
            </li>
            <div
              v-for="item in roles.slice().reverse()"
              :key="item"
              class="flex-fill p-0"
            >
              <li class="nav-color fw-bold pt-0">
                <div
                  :class="{ actived: management === item.role }"
                  class="ps-1"
                  @click="changeRole(item.role)"
                >
                  <span class="ps-2 pe-2">{{ item.role }}</span>
                </div>
              </li>
            </div>
            <div @click.prevent="logOut">
              <font-awesome-icon
                :icon="['fas', 'right-from-bracket']"
                aria-label="Déconnexion"
                class="ps-2"
              />
            </div>
          </ul>
        </div>
        <div class="text-center notselectable pt-2 nav-color">
          <component
            :is="switchComponent"
            :cart="cart.cart"
            @click="closeDropdownUser"
          />
        </div>
        <div id="lineClock" class="d-flex" @mouseleave="mouseLeaveS">
          <div
            id="buttonClock"
            type="button"
            class="btn nav-color"
            aria-label="Horodatage"
            @click="eventClock"
          >
            <span class="text-tools--ultradarken"
              ><font-awesome-icon :icon="['fas', 'clock']" />
            </span>
          </div>
          <div id="menuClock" class="hidden fw-bold nav_bg">
            {{ timestamp }}
          </div>
        </div>
        <div
v-if="management === 'Manager'"
          class="">
            <TheNavManager />
          </div>
          <div v-else-if="management === 'Administrator'" class="">
             <TheNavAdministrator />
          </div>
      
      </section>
      </div>
    </div>
  </nav>
</template>

<script>
import AuthService from '@/services/auth-service.js'
import StockService from '@/services/stock-service.js'
import { ref } from 'vue'
import { mapActions, mapGetters, mapState } from 'vuex'
import TheSearch from '../../components/TheSearch.vue'
import TheNavManager from './managers/TheNav.vue'
import TheNavAdministrator from './administrator/TheNav.vue'

export default {
  name: 'TheNavigation',
  components: {
    TheSearch,
    TheNavManager,
    TheNavAdministrator,
  },
  props: {
    currentDate: {
      type: String,
      default: '',
    },
    currentWeek: {
      type: String,
      default: '',
    },
  },
  setup() {
    const departements = ref([])
    StockService.listCurrentDepartements().then((response) => {
      departements.value = response
    })
    return { departements }
  },
  data() {
    return {
      mobile: false,
      mobileNav: false,
      dropdownUser: false,
      windowWidth: null,
      orientation: false,
      roles: [],
      sectionActive: '',
      linkActive: '',
      subLinkActive: '',
      searchActive: false,
      responsibility: '',
      roleActive: false,
      timestamp: '',
      userActive: '',
      jobActive: '',
      partActive: '',
      searchTerm: this.value,
    }
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      role: 'auth/role',
      management: 'auth/management',
    }),
    ...mapState(['cart']),
  },
  watch: {
    cart(newValue, oldValue) {
      //console.log(`Updating from ${oldValue} to ${newValue}`)
    },
    role: 'filterRoles',
    $route: function (newRoute) {
      if (newRoute.params.linkType) {
        const params = newRoute.params.linkType.split('_')
        this.sectionActive = params[2]
        this.linkActive = params[0]
        this.subLinkActive = params[1]
      } else {
        this.sectionActive = ''
        this.linkActive = ''
        this.subLinkActive = ''
      }
    },
    searchTerm(currentValue) {
      this.varietySearched = []
      for (let i = 0; i < this.allVarieties.response.length; i++) {
        if (
          this.allVarieties.response[i].variete.startsWith(currentValue) ===
          true
        ) {
          let variety = {
            id: this.allVarieties.response[i].id,
            name: this.allVarieties.response[i].variete,
          }
          this.varietySearched.push(variety)
        }
      }
      for (let i = 0; i < this.varietySearched.length; i++) {
        if (this.varietySearched[i].name === currentValue) {
          this.varietySearched = []
        }
      }
    },
  },
  mounted() {
    this.filterRoles(this.role)
    StockService.listCurrentDepartements()
    if (localStorage.getItem('cart')) {
      this.$store.dispatch(
        'cart/showCount',
        JSON.parse(localStorage.getItem('cart')).length
      )
    }
    this.checkScreen()
  },
  created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
    setInterval(this.getNow, 1000)
  },
  methods: {
    ...mapActions({
      changeManagement: 'auth/changeManagement',
      logoutAction: 'auth/logout',
    }),
    eventSearch() {
      const menu = document.getElementById('menuSearch')
      menu.classList.toggle('hidden')
      const button = document.getElementById('buttonSearch')
      button.classList.toggle('buttonSearchActive')
    },
    eventClock() {
      const menu = document.getElementById('menuClock')
      menu.classList.toggle('hidden')
      const button = document.getElementById('buttonClock')
      button.classList.toggle('buttonClockActive')
    },
    nofocusSearchMP() {
      document.getElementById('buttonMS').classList.toggle('btn-search')
    },
    nofocusSearch() {
      const menu = document.getElementById('menuSearch')
      menu.classList.toggle('hidden')
      const button = document.getElementById('buttonSearch')
      button.classList.toggle('buttonSearchActive')
    },
    filterRoles(value) {
      // console.log('value', this.role)
      if (value.includes('Administrator') || value.includes('Manager')) {
        for (let i = 0; i < value.length; i++) {
          if (value[i] === 'Client') {
            let rolesUser = {
              role: value[i],
              active: true,
            }
            this.roles.push(rolesUser)
          } else {
            let rolesUser = {
              role: value[i],
              active: false,
            }
            this.roles.push(rolesUser)
          }
        }
      } else if (value.includes('Client')) {
        let rolesUser = {
          role: 'Client',
          active: false,
        }
        this.roles.push(rolesUser)
      }
    },
    changeRole(value) {
      //console.log(value)
      this.sectionActive = 'user'
      this.linkActive = value
      this.changeManagement(value)
      this.mobileNav = false
      if (value != 'Client') {
        this.roleActive = true
      } else {
        this.roleActive = false
      }
      //  console.log(this.$store.getters['auth/management'])
      this.switchComponent = `TheNav${this.$store.getters['auth/management']}`
    },
    toggleMobileNav() {
      this.searchActive = !this.searchActive
      this.mobileNav = !this.mobileNav
    },
    closeMobileNav() {
      this.mobileNav = false
    },
    mouseleave() {
      this.mobileNav = false
    },
    mouseLeaveMd() {
      this.dropdownUser = false
    },
    mouseLeaveS() {
      const menu = document.getElementById('menuSearch')
      menu.classList.add('hidden')
      const button = document.getElementById('buttonSearch')
      button.classList.remove('buttonSearchActive')
    },
    searchEvent() {
      this.searchActive = !this.searchActive
    },
    toggleDropdownUser() {
      this.dropdownUser = !this.dropdownUser
    },
    closeDropdownUser() {
      this.dropdownUser = false
    },
    checkScreen() {
      this.windowWidth = window.innerWidth
      if (this.windowWidth <= 768) {
        let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
        if (screenOrientation === 'landscape-primary') {
          this.orientation = true
          this.mobile = true
          return
        } else {
          this.orientation = false
          this.mobile = true
          return
        }
      } else {
        this.orientation = false
        this.mobile = false
        this.mobileNav = false
        return
      }
    },
    logOut() {
      AuthService.logout()
      this.logoutAction()
      this.$router.replace({
        name: 'home',
      })
    },
    getNow() {
      const today = new Date()
      const hour = ('0' + today.getHours()).slice(-2)
      const minutes = ('0' + today.getMinutes()).slice(-2)
      const seconds = ('0' + today.getSeconds()).slice(-2)
      const time = hour + ':' + minutes + ':' + seconds
      this.timestamp = this.currentDate + ' ' + time
    },
  },
}
</script>

<style scoped lang="scss">
@import "../../assets/sass/libs/variables.scss";
@import "../../assets/sass/style.scss";

nav {
  position: absolute;
  top: 0;
  height: 100vh;
  width: 100vw;
  padding: 0;
  z-index: 99;
  transition: 0.5s ease all;
  img {
    position: fixed;
    top: 0;
  }
  .navbar-toggler {
    padding: 0;
    .navbar-toggler-icon {
      padding: 0 !important;
      margin: 0 !important;
    }
  }
  .navbar-toggler:focus,
  .navbar-toggler:active,
  .navbar-toggler-icon:focus {
    outline: none;
    box-shadow: none;
  }
  .nav-color {
    color: darken($tools, 65%);
  }
  .nav-link,
  .navdropdownButton {
    font-size: 0.8rem;
    font-weight: 600;
    color: darken($tools, 65%);
    //text-align: left;
    width: 100%;
    border: 0;
  }
  ul {
    list-style: none;
  }
  .icon {
    .nav-burger {
      font-size: 1.5rem;
      transition: 0.8s ease all;
    }
  }
  .dropdown {
    padding: 0vh;
    button {
      border-radius: 0 !important;
    }
    .dropdown-menu {
      background: $moyen;
      border: none !important;
      border-radius: 0;
      .dropdown-item {
        font-size: 0.7rem;
        font-weight: 600;
        line-height: 1.4rem;
        padding: 0 0 0 1.4rem;
        color: darken($tools, 65%);
      }
     
      .subcategory {
        padding: 0 0 0 2rem;
      }
    }
    .col-dropdown-menu {
      min-width: 18vw !important;
    }
  }
  .buttonactive {
    button {
      background-color: darken($moyen, 10%) !important;
      span {
        color: white !important;
      }
    }
  }
  .dropdown-item:hover {
    background-color: darken($moyen, 10%);
    color: white !important;
  }
  input {
    border: 0 !important;
    border-radius: 0;
    font-size: 0.8rem;
    color: darken($tools, 65%) !important;
    background-color: white !important;
  }
  .timestamp {
    font-size: 0.7rem;
    font-weight: 600;
    line-height: 2.3rem;
    color: darken($tools, 65%);
  }
}
.familyborder {
  border-right: darken($moyen, 10%) solid 1px;
}
.ps2 {
  padding-left: 2.5vw !important;
}
.ps3 {
  padding-left: 4.5vw !important;
}
.user {
  background-color: darken($moyen, 10%);
  color: white;
}
//Pour desktop
@media #{$desktop-up} {
  nav {
    margin: 0;
    padding: 0;
    height: 6.3vh;
    font-size: 0.8rem;
    .z50 {
      display: flex;
    }
    a {
       margin-right: 5vw;
   img {
      height: 6.3vh;
    }
  }
    .nav-d {
      width: 94vw;
      height: 6.3vh;
    }
    #search {
      height: 6.3vh;

    }
    .div-right {
      width: 30%;
    }
    .dropdown {
      button {
        height: 6.3vh;
        font-size: 0.8rem;
        color: darken($tools, 65%);
      }
      .dropdown-menu {
        margin-top: -.2vh !important;
        color: darken($tools, 65%);
        .actived {
          display: block;
          background-color: darken($moyen, 10%) !important;
          color: white !important;
          span {
            color: white !important;
          }
        }
      }
    }
    .router-link-active {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
    }
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  nav {
    padding: 0;
    height: 100vh;
    transition: 0.5s ease all;
  }
  .navbar-expand-v {
    position: absolute;
    -webkit-transform: rotate(90deg) !important;
    -moz-transform: rotate(90deg) !important;
    -o-transform: rotate(90deg) !important;
    -ms-transform: rotate(90deg) !important;
    transform: rotate(90deg) !important;
    transform-origin: 100% 100%;
    top: -51.2vh;
    left: -9vw;
    height: 100vw;
    width: 5vh;
    z-index: 99;
    .z50 {
      position: fixed;
      top: 0;
      width: 5vh;
    }
    .navbar-brand {
      img {
        width: 5vh;
      }
    }
    button[type="button"] {
      min-width: 3vh;
      font-size: 3vh;
      height: 7.5vw;
      padding: 0 1.4vh 0 0.6vh;
      border-radius: 0;
    }
    .buttonactive {
      button {
        background-color: darken($moyen, 10%) !important;
        // width: 3vh !important;
        span {
          color: white !important;
        }
      }
    }
    .buttonsearchfocus {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
    }
    .textwhite {
      color: white !important;
    }
    button[type="button"]:focus {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
      span {
        color: white !important;
      }
    }
  }
  .dropdown-menu {
    min-width: 50vh;
    margin-left: -0.6vh !important;
    padding: 0;
    font-size: 0.7rem;
    border: 0;
    li a {
      font-size: 0.7rem;
      text-align: start;
    }
    .dropdown-item {
      padding: 0 0.5rem;
      margin: 0;
    }
    .lh1 {
      line-height: 7.5vw;
    }
    .actived {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
    }
    form {
      .form-control {
        width: 80%;
      }
      button[type="submit"] {
        width: 12% !important;
        font-size: 0.9rem;
      }
    }
    .responsabilities {
      width: 100%;
      form {
        width: 15vh;
        .responsabilities-input {
          width: 98%;
          input[type="week"] {
            width: 100%;
            height: 6vw;
            padding: 0;
            border: 0;
            font-size: inherit;
          }
          input[type="week"]:focus {
            outline: none;
          }
        }
        button[type="submit"] {
          height: 6vw;
          margin-left: 1vh;
          font-size: 0.7rem;
          line-height: 0.4rem;
        }
      }
    }
  }
  .dropdown-user--parent {
    height: 7vw;
    button {
      height: 7vw;
    }
    .dropdown-user {
      min-width: 55.1vh;
      margin: 0;
      padding: 0;
      li {
        height: 7vw;
        margin: 0;
        padding: 0 0.5vh;
        line-height: 7vw;
        list-style-type: none;
      }
      div {
        margin: 0;
        padding: 0;
        .actived {
          background-color: darken($moyen, 10%) !important;
          color: white;
        }
        .dropdown-item {
          a {
            text-align: start;
            font-size: 0.7rem;
          }
        }
      }
    }
  }
  section {
    position: absolute;
    margin-top: 7vh;
    a {
      display: block;
      min-width: 5vh;
      text-align: center;
      border-radius: 0;
      color: darken($tools, 65%);
    }
    .router-link-active {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
      max-height: 7vw !important;
    }
    button[type="button"]:focus {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
      span {
        color: white !important;
      }
    }
  }
  #lineSearch, #lineClock {
    position: absolute;
    min-height: 5vw;
    margin-top: 1vh;
    z-index: 99;
    #buttonSearch, #buttonClock {
      width: 5vh;
      line-height: 5vh;
      padding: 0;
      border-radius: 0;
      text-align: center;
      font-size: 100%;
    }
    .buttonSearchActive, .buttonClockActive {
      background-color: darken($moyen, 10%) !important;
      span {
        color: white !important;
      }
    }
    #menuSearch {
      min-width: 50vw;
    }
    #menuClock {
      min-width: 50vh;
      padding-left: 2vh;
      line-height: 2rem;
    }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  nav {
    padding: 0;
    height: 100%;
    transition: 0.5s ease all;
  }
  .navbar-expand-v {
    height: 100%;    
    width: 5vw;
    z-index: 99;
    .z50 {
      position: fixed;
      top: 0;
    }
    .navbar-brand {
      img {
        width: 5vw;
      }
    }
    button[type="button"] {
      min-width: 3vw;
      font-size: 3vw;
      height: 7.5vh;
      padding: 0 1.4vw 0 0.6vw;
      border-radius: 0;
    }
    .buttonactive {
      button {
        background-color: darken($moyen, 10%) !important;
        width: 5vw !important;
        span {
          color: white !important;
        }
      }
    }
    .buttonsearchfocus {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
    }
    .textwhite {
      color: white !important;
    }
    button[type="button"]:focus {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
      span {
        color: white !important;
      }
    }
  }
  .dropdown-menu {
    min-width: 50vw;
    margin-left: -3.2vw !important;
    padding: 0;
    font-size: 0.7rem;
    border: 0;
    li a {
      font-size: 0.7rem;
      text-align: start;
    }
    .dropdown-item {
      padding: 0 0.5rem;
      margin: 0;
    }
    .lh1 {
      line-height: 7.5vh;
    }
    .actived {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
    }
    form {
      .form-control {
        width: 80%;
      }
      button[type="submit"] {
        width: 12% !important;
        font-size: 0.9rem;
      }
    }
    .responsabilities {
      width: 100%;
      form {
        width: 15vw;
        .responsabilities-input {
          width: 98%;
          input[type="week"] {
            width: 100%;
            height: 6vh;
            padding: 0;
            border: 0;
            font-size: inherit;
          }
          input[type="week"]:focus {
            outline: none;
          }
        }
        button[type="submit"] {
          height: 6vh;
          margin-left: 1vw;
          font-size: 0.7rem;
          line-height: 0.4rem;
        }
      }
    }
  }
  .dropdown-user {
    margin-left: 0.2vw !important;
  }
  .dropdown-user--parent {
    height: 7vh;
    button {
      height: 7vh;
    }
    .dropdown-user {
      min-width: 55.1vw;
      margin: 0;
      padding: 0;
      li {
        height: 7vh;
        margin: 0;
        padding: 0 0.5vw;
        line-height: 7vh;
        list-style-type: none;
      }
      div {
        margin: 0;
        padding: 0;
        .actived {
          background-color: darken($moyen, 10%) !important;
          color: white;
        }
        .dropdown-item {
          a {
            text-align: start;
            font-size: 0.7rem;
          }
        }
      }
    }
  }
  section {
    position: absolute;
   // margin-top: 7vh;
    a {
      display: block;
      min-width: 5vw;
      text-align: center;
      border-radius: 0;
      color: darken($tools, 65%);
    }
    .router-link-active {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
      max-height: 7vh !important;
    }
    button[type="button"]:focus {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
      span {
        color: white !important;
      }
    }
  }
  #lineSearch, #lineClock {
    //position: absolute;
    min-height: 7vh;
    margin-top: 1vh;
    z-index: 99;
    #buttonSearch, #buttonClock {
      width: 5vw;
      line-height: 7vh;
      padding: 0;
      border-radius: 0;
      text-align: center;
      font-size: 100%;
    }
    .buttonSearchActive, .buttonClockActive {
      background-color: darken($moyen, 10%) !important;
      span {
        color: white !important;
      }
    }
    #menuSearch, #menuClock {
      min-width: 50vw;
      padding-left: 2vw;
      line-height: 1.2rem;
    }
  }
}
</style>
