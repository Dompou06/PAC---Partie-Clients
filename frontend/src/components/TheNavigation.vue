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
      <!--<div
        v-show="mobile"
        v-if="role.indexOf(1) > -1"
        class="nav-item col-sm-1"
       >
        <router-link to="/cart" class="nav-link">
          <div class="text-start notselectable ps-2_5 nav-color">
            <font-awesome-icon
              :icon="['fas', 'cart-shopping']"
              aria-label="Voir le panier"
            />
          </div>
        </router-link>
      </div>-->
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
              buttonactive: sectionActive === 'products' || linkActive,
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
          <div v-if="authenticated" class="d-flex">
            <div class="dropdown">
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
                    class="dropdown-item nav-color fw-bold cursor"
                    :class="{ actived: item.active }"
                    @click="changeRole(item.role)"
                  >
                    {{ item.role }}
                  </div>
                  <div v-if="item.role === 'Client'">
                    <router-link
                      to="/profile"
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
              <router-link to="/cart" class="nav-link root">
                <div class="notselectable cart-shopping">
                  <div class="cart-shopping--over">
                    <font-awesome-icon
                      :icon="['fas', 'cart-shopping']"
                      aria-label="Voir le panier"
                    />
                  </div>
                  <div class="cart-shopping--overlay">
                    <span v-if="cart.cart">{{ cart.cart }}</span><span v-else>0</span>
                  </div>
                </div>
              </router-link>
            </div>
          </div>
          <div v-else class="d-flex">
            <router-link
                    to="/signup"
                    class="text-center fw-bold sign"
                    >Inscription
                  </router-link>
                  <router-link
                    to="/signin"
                    class="text-center fw-bold sign"
                    >Connexion
                  </router-link>
          </div>
        </div>
      </transition>
      <!-- Menu mobile Portrait-->
      <transition v-else-if="mobileNav" name="mobile-nav">
        <ul class="dropdown-nav navbar-nav">
          <li>
            <div class="d-flex justify-content-between">
              <div
                class="flex-fill nav-item dropdown subdropdown pt-1"
                :class="{
                  buttonactive: sectionActive === 'products' || linkActive,
                }"
              >
                <button
                  class="btn navdropdownButton notselectable h100"
                  type="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  aria-label="Article"
                >
                  <span class="text-tools--ultradarken ps-3"
                    ><font-awesome-icon :icon="['fas', 'cart-arrow-down']" />
                  </span>
                </button>
                <ul
                  class="dropdown-menu nav_bg mt-0"
                  aria-labelledby="Menu Articles"
                >
                  <li class="">
                    <div class="row ps-0 pe-0 subdropdown-menu nav_bg">
                      <div
                        v-for="dep in departements"
                        :key="dep.family_description"
                        class="col-4 ps-0 pe-0"
                      >
                        <div :class="{ familyborder: dep.family_id != 3 }">
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
                              class="ps-1"
                              :class="{ ps2: dep.family_id === 1 }"
                              @click="toggleMobileNav"
                              >{{ dep.family_description }}</span
                            >
                          </router-link>
                          <div
                            v-for="cat in dep.categories"
                            :key="cat"
                            class="col-12"
                          >
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
                                  class="ps-2"
                                  :class="{ ps3: dep.family_id === 1 }"
                                  @click="toggleMobileNav"
                                  >{{ cat.category_description }}</span
                                >
                              </router-link>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
              <div
                class="flex-fill dropdown subdropdown pt-1"
                @mouseleave="mouseLeaveMS"
              >
                <button
                  id="buttonMS"
                  class="btn navdropdownButton notselectable h100 text-center"
                  type="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  aria-label="Rechercher"
                  @click="mouseMS"
                >
                  <span class=""
                    ><font-awesome-icon :icon="['fas', 'magnifying-glass']"
                  /></span>
                </button>
                <ul
                  class="dropdown-menu subdropdown-menu nav_bg"
                  aria-labelledby="Menu Recherche"
                >
                  <li class="dropdown-item">
                    <div class="subdropdown-search">
                      <TheSearch @closeSearch="nofocusSearchMP" />
                    </div>
                  </li>
                </ul>
              </div>
              <div v-if="authenticated" class="flex-fill subdropdown">
                <div class="d-flex">
                  <div
                    class="nav-item dropdown"
                    :class="{ buttonactive: sectionActive === 'user' }"
                  >
                    <button
                      class="btn navdropdownButton notselectable h100"
                      type="button"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                      aria-label="Utilisateur"
                    >
                      <span class="text-tools--ultradarken ps-3"
                        ><font-awesome-icon :icon="['fas', 'user']" />
                      </span>
                    </button>
                    <ul
                      class="dropdown-menu nav_bg"
                      aria-labelledby="Menu Utilisateur"
                    >
                      <li class="dropdown-item subdropdown-menu">
                        <div class="subdropdown-item nav_bg text-end">
                          {{ user }}
                        </div>
                      </li>
                      <li class="dropdown-item subdropdown-menu">
                        <div
                          class="
                            d-flex
                            justify-content-between
                            subdropdown-item
                            nav_bg
                          "
                        >
                          <div
                            v-for="item in roles.slice().reverse()"
                            :key="item"
                            class="p-0 subdropdown-role"
                          >
                            <div class="ps-1" @click="changeRole(item.role)">
                              <div
                                class="dropdown-item nav-color pt-0 text-center"
                                :class="{ actived: linkActive === item.role }"
                              >
                                <div class="d-flex justify-content-start">
                                  <div @click="toggleMobileNav">
                                    <span
                                      class="ps-2 pe-2"
                                      :class="{
                                        actived: item.role === 'Client',
                                      }"
                                      >{{ item.role }}</span
                                    >
                                  </div>
                                  <div
                                    v-if="item.role === 'Client'"
                                    class="subdropdown-profile"
                                  >
                                    <div
                                      :class="{
                                        actived: subLinkActive === 'profile',
                                      }"
                                      class="dropdown-item"
                                    >
                                      <router-link
                                        :to="{
                                          name: 'ProfileUser',
                                          params: {
                                            linkType: `${item.role}_profile__user`,
                                          },
                                        }"
                                      >
                                        <span
                                          class="ps-2"
                                          @click="toggleMobileNav"
                                          >Mon compte</span
                                        >
                                      </router-link>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div
                            class="dropdown-item subdropdown-logout text-center"
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
                  </div>
                </div>
              </div>
              <div v-else class="flex-fill d-flex subdropdown">
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
              <div v-if="authenticated && !roleActive" class="nav-item">
                <router-link to="/cart" class="">
                  <div class="cart-shopping">
                    <div class="cart-shopping--over">
                      <font-awesome-icon
                        :icon="['fas', 'cart-shopping']"
                        aria-label="Voir le panier"
                        @click="closeDropdownUser"
                      />
                    </div>
                    <div class="cart-shopping--overlay">
                      <span v-if="cart.cart">{{ cart.cart }}</span><span v-else>0</span>
                    </div>
                  </div>
                </router-link>
              </div>
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
        :class="{ buttonactive: sectionActive === 'products' || linkActive }"
      >
        <button
          type="button"
          class="btn nav-color"
          data-bs-toggle="dropdown"
          data-bs-display="static"
          aria-expanded="false"
          aria-label="Articles"
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
          :class="{ buttonactive: sectionActive === 'user' }"
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
              <li
                class="nav-color fw-bold pt-0"
                :class="{ actived: linkActive === item.role }"
              >
                <div class="ps-1" @click="changeRole(item.role)">
                  <span
                    class="ps-2 pe-2"
                    :class="{
                      actived: item.role === 'Client',
                    }"
                    >{{ item.role }}</span
                  >
                </div>
              </li>
              <div v-if="item.role === 'Client'">
                <li :class="{ actived: subLinkActive === 'profile' }">
                  <router-link
                    :to="{
                      name: 'ProfileUser',
                      params: {
                        linkType: `${item.role}_profile__user`,
                      },
                    }"
                  >
                    <span class="ps-2">Mon compte</span>
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
        <div
          v-if="!roleActive"
          class="text-center notselectable pt-2 nav-color"
        >
          <router-link v-if="cart.cart> 0" to="/cart" class="root">
            <div class="cart-shopping">
              <div class="cart-shopping--over">
                <font-awesome-icon
                  :icon="['fas', 'cart-shopping']"
                  aria-label="Voir le panier"
                  @click="closeDropdownUser"
                />
              </div>
              <div class="cart-shopping--overlay"><span v-if="cart.cart">{{ cart.cart }}</span><span v-else>0</span></div>
            </div>
          </router-link>
          <div v-else class="root">
          <div class="cart-shopping">
              <div class="cart-shopping--over">
                <font-awesome-icon
                  :icon="['fas', 'cart-shopping']"
                  aria-label="Etat du panier"
                />
              </div>
              <div class="cart-shopping--overlay">0</div>
            </div>
          </div>
        </div>
      </section>
      <section v-else class="">
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

export default {
  name: 'TheNavigation',
  components: {
    TheSearch,
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
    }),
    ...mapState(['cart'])
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
    if(localStorage.getItem('cart')) {
      this.$store.dispatch('cart/updateCount', JSON.parse(localStorage.getItem('cart')).length)
    }
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
      // console.log('cart', this.cart)
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
    mouseLeaveMS() {
      document.getElementById('buttonMS').classList.remove('btn-search')
    },
    mouseMS() {
      document.getElementById('buttonMS').classList.add('btn-search')
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
  }
  .navdropdownButton {
    text-align: left;
    color: darken($tools, 65%) !important;
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
      .col-dropdown-item {
        font-size: 0.7rem;
        font-weight: 600;
        line-height: 1.4rem;
        padding: 0 0 0 0;
        margin: 0;
        color: darken($tools, 65%);
      }
      .col-dropdown-item:hover {
        background-color: darken($moyen, 10%);
        color: white;
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
    .root{
    height: 6.3vh;
    .cart-shopping {
    display: grid;
    .cart-shopping--over {
      font-size: 1.3rem;
      line-height: 0;
      color: darken($tools, 65%);
    }
    .cart-shopping--overlay {
      margin-top: -0.5vh;
      color: white;
      font-weight: 800;
    }
    .cart-shopping--over,
    .cart-shopping--overlay {
      grid-area: 1 / 1;
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
    .cart-shopping--over {
      color: white !important;
    }    .cart-shopping--overlay {
      color: darken($tools, 65%) !important;
    }
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
    .buttonactive {
      width: 25vw;
    }
  }
  .dropdown-nav {
    display: flex;
    flex-direction: column;
    position: fixed;
    top: 6.4vh;
    left: 0;
    height: 4.5vh;
    width: 100%;
    background-color: $theme;
    .ps-2_5 {
      padding-left: 0.7rem;
    }
  }
  .dropdown-item {
    padding: 0 !important;
    a {
      color: darken($tools, 65%);
    }
  }
  .dropdown-menu {
    padding: 0 !important;
    margin: 0 !important;
  }
  #articles-button--mu,
  #role-button--mu,
  #profile-button--mu {
    margin: 0;
    font-size: 0.8rem;
    background-color: $theme;
    color: transparent !important;
  }
  .subdropdown {
    top: -1vh;
    width: 25vw;
    height: 5.5vh;
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
    .router-link-active {
      margin: 0 !important;
      background-color: darken($moyen, 10%) !important;
      color: white !important;
    }
    .btn-search {
      background-color: darken($moyen, 10%) !important;
      color: white !important;
    }
    .subdropdown-menu {
      width: 100vw;
      margin: -0.5vh 0 0 0;
      padding: 0 2vw;
      .subdropdown-item {
        width: 100vw;
        margin-left: -50vw;
        padding: 0 2vw;
        .subdropdown-role {
          width: 80vw;
          .subdropdown-profile {
            width: 35vw;
            text-align: center;
          }

          .subdropdown-logout {
            width: 20vw;
          }
        }
      }
    }
    #buttonMS {
      padding-left: 0 !important;
    }
    .h100 {
      height: 4.7vh;
    }
    .w25 {
      width: 25vw;
    }
    color: white !important;
  }
  .nav-item .router-link-active,
  .actived {
    display: block;
    background-color: darken($moyen, 10%) !important;
    color: white !important;
    .cart-shopping--over {
      color: white;
    }
    .cart-shopping--overlay {
      color: darken($tools, 65%);
    }
  }
  .dropdown-item .router-link-active {
    display: block;
    background-color: darken($moyen, 10%) !important;
    color: white !important;
  }
  .role .actived {
    background-color: darken($moyen, 10%) !important;
    color: white !important;
  }
  .border-bottom {
    border-bottom-color: $theme !important;
  }
  .ps {
    padding-left: 6vw;
  }
  .btn {
    margin: 0 !important;
    padding: 0 0 0 4vw !important;
  }
  .cart-shopping {
    margin-top: -0.7vh;
    height: 4.7vh;
    width: 25vw;
    display: grid;
    padding: 0 3vw 0 0;
    .cart-shopping--over {
      color: darken($tools, 65%);
      font-size: 1rem;
    }
    .cart-shopping--overlay {
      color: white;
      font-weight: 800;
    }
    .cart-shopping--over,
    .cart-shopping--overlay {
      grid-area: 1 / 1;
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
  .root {
    height: 7vh;
  min-width: 5vw;
  .cart-shopping {
    height: 100%;
    margin-left: -0.7vw;
    display: grid;
    .cart-shopping--over {
      font-size: 3vw;
    }
    .cart-shopping--overlay {
      font-size: 2vw;
      color: white;
      font-weight: 700;
    }
    .cart-shopping--over,
    .cart-shopping--overlay {
      grid-area: 1 / 1;
    }
  }
    .nav-color {
      .router-link-active {
        background-color: darken($moyen, 10%) !important;
        color: white !important;
        max-height: 7vh !important;
      }
    }
  }
  section {
    position: absolute;
    margin-top: 7vh;
    a {
      display: block;
      min-width: 5.5vw;
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
      .cart-shopping {
        .cart-shopping--over {
          color: white !important;
        }
        .cart-shopping--overlay {
          color: darken($tools, 65%) !important;
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
  #lineSearch {
    position: absolute;
    min-height: 7vh;
    z-index: 99;
    #buttonSearch {
      width: 5vw;
      line-height: 7vh;
      padding: 0;
      border-radius: 0;
      text-align: center;
      font-size: 100%;
    }
    .buttonSearchActive {
      background-color: darken($moyen, 10%) !important;
      span {
        color: white !important;
      }
    }
    #menuSearch {
      min-width: 50vw;
    }
  }
}
</style>