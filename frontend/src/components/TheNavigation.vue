<!-- eslint-disable vue/v-on-event-hyphenation -->
<template>
  <nav
    v-if="!orientation"
    class="navbar navbar-expand-lg navbar-light nav_bg nav-justified"
    @mouseleave="mouseleave"
  >
    <div class="container-fluid">
      <router-link
        to="/"
        class="navbar-brand notselectable"
        @click="closeMobileNav"
      >
        <img src="../assets/img/nav_pac.png" alt="Accueil" />
      </router-link>
      <button
        class="navbar-toggler"
        type="button"
        aria-label="Menu hamburger"
        @click="toggleMobileNav"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Menu desktop -->
      <transition v-if="!mobile">
        <div class="nav-d d-flex justify-content-between">
          <div
            id="articlesd"
            class="dropdown"
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
                >Articles <font-awesome-icon :icon="['fas', 'caret-down']" />
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
          <div id="search" class="">
            <TheSearch />
          </div>
          <div
            v-if="authenticated"
            class="div-right d-flex justify-content-end"
          >
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
                    v-if="!roleActive"
                    class="dropdown-item nav-color fw-bold cursor"
                    :class="{ actived: item.active }"
                    @click="changeRole(item.role)"
                  >
                    {{ item.role }}
                  </div>
                  <div
                    v-else
                    :class="{ actived: management === item.role }"
                    class="dropdown-item nav-color fw-bold cursor"
                    @click="changeRole(item.role)"
                  >
                    {{ item.role }}
                  </div>
                  <div v-if="item.active && !roleActive">
                    <router-link
                      :to="{
                        name: 'ProfileUser',
                        params: {
                          linkType: `${item.role}_profile__user`,
                        },
                      }"
                      class="dropdown-item nav-color fw-bold ps"
                    >
                      Mon compte
                    </router-link>
                  </div>
                </li>
                <li class="dropdown-item cursor" @click.prevent="logOut">
                  Déconnexion
                </li>
              </ul>
            </div>
            <div v-if="!roleActive" class="text-center">
              <TheNavCustomer :cart="cart.cart" />
            </div>
          </div>
          <div v-else class="d-flex">
            <router-link to="/signup" class="text-center fw-bold sign"
              >Inscription
            </router-link>
            <router-link to="/signin" class="text-center fw-bold sign"
              >Connexion
            </router-link>
          </div>
        </div>
      </transition>
      <!-- Menu mobile Portrait-->
      <transition v-else-if="mobileNav" name="mobile-nav">
        <ul class="navbar-nav">
          <li class="d-flex justify-content-between btn-group" role="group">
            <button
              type="button"
              class="flex-fill btn"
              :class="{ actived: sectionActive === 'products' }"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <span class=""
                ><font-awesome-icon :icon="['fas', 'cart-arrow-down']" />
              </span>
            </button>
            <ul class="dropdown-menu nav_bg" aria-labelledby="">
              <li class="d-flex">
                <div
                  v-for="dep in departements"
                  :key="dep.family_description"
                  class="flex-fill"
                >
                  <div
                    :class="{
                      familyborder: dep.family_id != 3,
                      ps2: dep.family_id != 1,
                    }"
                  >
                    <router-link
                      :to="{
                        name: 'TheProducts',
                        params: {
                          linkType: `${dep.family_id}__products`,
                        },
                      }"
                      class="dropdown-item fw-bold"
                      :class="{
                        actived:
                          dep.family_description === family ||
                          linkActive === `${dep.family_id}`,
                      }"
                      :aria-label="`${dep.family_description}`"
                      ><span
                        class=""
                        :class="{ ps2: dep.family_id === 1 }"
                        @click="toggleMobileNav"
                        >{{ dep.family_description }}</span
                      >
                    </router-link>
                    <div v-for="cat in dep.categories" :key="cat">
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
                          <span
                            class="ps-2 fw-bold"
                            :class="{ ps3: dep.family_id === 1 }"
                            @click="toggleMobileNav"
                            >{{ cat.category_description }}</span
                          >
                        </router-link>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
            <button
              type="button"
              class="flex-fill btn"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <span class=""
                ><font-awesome-icon :icon="['fas', 'magnifying-glass']"
              /></span>
            </button>
            <ul class="dropdown-menu nav_bg" aria-labelledby="">
              <li class="li-search">
                <TheSearch @closeSearch="toggleMobileNav" />
              </li>
            </ul>
            <button
              v-if="authenticated"
              type="button"
              class="flex-fill btn"
              :class="{ actived: subLinkActive === 'profile' }"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <span class=""
                ><font-awesome-icon :icon="['fas', 'user']"
              /></span>
            </button>
            <ul class="dropdown-menu nav_bg" aria-labelledby="Menu Utilisateur">
              <li class="dropdown-item">
                <div class="nav_bg text-end fw-bold pe-3">
                  {{ user }}
                </div>
              </li>
              <li class="dropdown-item">
                <div class="d-flex justify-content-between">
                  <div
                    v-for="item in roles.slice().reverse()"
                    :key="item"
                    class="flex-fill fw-bold"
                  >
                    <div v-if="!roleActive" class="ps-1 d-flex">
                      <div
                        :class="{ actived: item.active }"
                        @click="changeRole(item.role)"
                      >
                        <span class="ps-2 pe-2">{{ item.role }} </span>
                      </div>
                      <div
                        v-if="item.active && !roleActive"
                        :class="{
                          actived: subLinkActive === 'profile',
                        }"
                      >
                        <router-link
                          :to="{
                            name: 'ProfileUser',
                            params: {
                              linkType: `${item.role}_profile__user`,
                            },
                          }"
                          @click="toggleMobileNav"
                        >
                          <span class="ps-2 pe-2 fw-bold">Mon compte</span>
                        </router-link>
                      </div>
                    </div>
                    <div
                      v-else
                      class="ps-1 me-auto"
                      @click="changeRole(item.role)"
                    >
                      <span class="ps-2 pe-2">{{ item.role }}</span>
                    </div>
                  </div>
                  <div
                    class="flex-fill dropdown-item text-center"
                    @click.prevent="logOut"
                  >
                    <font-awesome-icon
                      :icon="['fas', 'right-from-bracket']"
                      aria-label="Déconnexion"
                      class=""
                    />
                  </div>
                </div>
              </li>
            </ul>
            <button
              v-if="authenticated && !roleActive"
              type="button"
              class="btn btn-cart"
              aria-expanded="false"
              @mouseleave="toggleMobileNav"
            >
              <component
                :is="switchComponent"
                :cart="cart.cart"
                @click="toggleMobileNav"
              />
            </button>
            <div v-if="!authenticated" class="flex-fill d-flex subdropdown">
              <router-link
                to="/signup"
                aria-label="Inscription"
                class="flex-fill text-center sign"
              >
                <span class="icon-inscription"></span>
              </router-link>

              <router-link
                to="/signin"
                aria-label="Connexion"
                class="flex-fill text-center"
              >
                <font-awesome-icon :icon="['fas', 'right-to-bracket']" />
              </router-link>
            </div>
          </li>
        </ul>
      </transition>
    </div>
  </nav>
  <!-- Mobile landscape -->
  <nav v-else class="navbar-expand-v nav_bg">
    <div class="z50" @mouseleave="mouseLeaveMd">
      <router-link to="/" class="navbar-brand" aria-label="Accueil">
        <img src="../assets/img/nav_pac.png" alt="Accueil" />
      </router-link>
      <div
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
      </div>
      <div id="lineSearch" class="d-flex" @mouseleave="mouseLeaveS">
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
      </div>
      <section v-if="authenticated">
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
          <ul class="dropdown-menu nav_bg">
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
                  v-if="!roleActive"
                  :class="{ actived: item.active }"
                  class="ps-1"
                  @click="changeRole(item.role)"
                >
                  <span class="ps-2 pe-2">{{ item.role }} </span>
                </div>
                <div
                  v-else
                  :class="{ actived: management === item.role }"
                  class="ps-1"
                  @click="changeRole(item.role)"
                >
                  <span class="ps-2 pe-2">{{ item.role }}</span>
                </div>
              </li>
              <div v-if="item.active && !roleActive">
                <li :class="{ actived: subLinkActive === 'profile' }">
                  <router-link
                    :to="{
                      name: 'ProfileUser',
                      params: {
                        linkType: `${item.role}_profile__user`,
                      },
                    }"
                  >
                    <span class="ps-2 fw-bold">Mon compte</span>
                  </router-link>
                </li>
              </div>
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
      </section>
      <section v-else>
        <router-link
          to="/signup"
          class="signup nav_bg"
          aria-label="Inscription"
        >
          <span class="icon-inscription icon"></span>
        </router-link>
        <router-link to="/signin" class="signin nav_bg" aria-label="Connexion">
          <font-awesome-icon :icon="['fas', 'right-to-bracket']" />
        </router-link>
      </section>
    </div>
  </nav>
</template>

<script>
import AuthService from '@/services/auth-service.js'
import StockService from '@/services/stock-service.js'
import { ref } from 'vue'
import { mapActions, mapGetters, mapState } from 'vuex'
import TheSearch from './TheSearch.vue'
import TheNavCustomer from './customers/TheNavCart.vue'

export default {
  name: 'TheNavigation',
  components: {
    TheSearch,
    TheNavCustomer,
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
      switchComponent: 'TheNavCustomer',
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
      this.sectionActive = 'user'
      this.linkActive = value
      this.changeManagement(value)
      this.mobileNav = false
      if (value != 'Client') {
        this.roleActive = true
      } else {
        this.roleActive = false
      }
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
@import "../assets/sass/libs/variables.scss";
@import "../assets/sass/style.scss";

nav {
  position: absolute;
  top: 0;
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
}
.icon-inscription {
  font-size: 1.2rem;
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
    img {
      height: 6.3vh;
    }
    .nav-d {
      width: 94vw;
      height: 6.3vh;
    }
    #articlesd {
      margin-right: 20%;
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
        margin-top: 0;
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
    .sign {
      height: 6.3vh;
      font-size: 0.8rem;
      line-height: 6.3vh;
      color: darken($tools, 65%);
      padding: 0 3vw;
    }
    .sign:hover {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
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
    height: 6.5vh;
    padding: 0;
    .container-fluid {
      width: 100vw;
    }
    img {
      height: 6.5vh;
    }
    .navbar-toggler-icon {
      height: 5vh;
    }
    .navbar-nav {
      position: fixed;
      top: 6.4vh;
      left: 0;
      height: 4.5vh;
      width: 100vw;
      background-color: $theme;
      .btn {
        // width: 100%;
        height: 4.5vh;
        padding: 0;
      }
      .btn-cart {
        width: 5%;
      }
      .actived {
        background-color: darken($moyen, 10%) !important;
        color: white !important;
      }
      .dropdown-menu {
        position: absolute !important;
        margin-top: -0.3vh !important;
        width: 100vw;
        padding: 0;
        ul {
          margin: 0;
          padding: 0;
          li {
            margin: 0;
            padding: 0;
            width: 100vw;
          }
        }
        .ps2 {
          padding-left: 1vw;
        }
        .dropdown-item {
          margin: 0;
          padding: 0;
          font-size: 0.7rem !important;
          color: darken($tools, 65%);
          a {
            color: darken($tools, 65%);
          }
        }
        .li-search {
          margin: 0 25vw !important;
        }
        .router-link-active {
          margin: 0 !important;
          background-color: darken($moyen, 10%) !important;
          color: white !important;
        }
        .actived {
          //display: block;
          background-color: darken($moyen, 10%) !important;
          color: white !important;
        }
      }
      .subdropdown {
        top: -1vh;
        width: 25vw;
        height: 4.5vh;
        a {
          display: block;
          height: 4.5vh;
          color: darken($tools, 65%);
          margin: 0 !important;
          padding-top: 0.5vh;
          .icon-inscription {
            font-size: 2.2vh !important;
          }
        }
      }
    }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  nav {
    padding: 0;
    height: 100vh;
    transition: 0.5s ease all;
  }
  .navbar-expand-v {
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
    margin-left: -0.6vw !important;
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
      button[type="submit"] {
        width: 12% !important;
        font-size: 0.9rem;
      }
    }
  }
  section {
    position: absolute;
    margin-top: 7vh;
    a {
      display: block;
      min-width: 5vw;
      text-align: center;
      border-radius: 0;
      color: darken($tools, 65%);
    }
    .signup {
      min-height: 8vh;
      margin-left: -0.5vw;
      line-height: 8vh;
      .icon {
        font-size: 100%;
      }
    }
    .signin {
      min-height: 8vh;
      margin-left: -0.5vw;
      line-height: 8vh;
      span {
        font-size: 100%;
      }
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
  #lineSearch {
    position: absolute;
    min-height: 7vh;
    margin-top: 1vh;
    z-index: 99;
    #buttonSearch {
      width: 5vw;
      line-height: 7vh;
      padding: 0;
      border-radius: 0;
      text-align: center;
      font-size: 100%;
    }
    #menuSearch {
      min-width: 50vw;
    }
  }
}
</style>
