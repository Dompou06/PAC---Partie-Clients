<template>
  <div class="bg-tools--ultradarken text-light pb-2 notselectable">
    <div class="landscape" @mouseleave="mouseLeaveIn('close')">
      <div v-if="caption" class="caption d-flex">
        <div class="menu bg-tools align-self-end fw-bold ps-1">
          <div class="cursor" @click="dropdownItem('stock')">Stock</div>
          <div class="cursor" @click="dropdownItem('menus')">Menus</div>
          <div class="cursor" @click="dropdownItem('actions')">Actions</div>
          <div class="cursor" @click="dropdownItem('navigation')">
            Navigation
          </div>
        </div>
        <div
          v-if="
            dropdown === 'stock' ||
            dropdown === 'menus' ||
            dropdown === 'actions' ||
            dropdown === 'navigation'
          "
          class="submenu bg-tools align-self-end"
        >
          <table v-if="dropdown === 'stock'">
            <tbody>
              <tr v-for="dep in departements" :key="dep.family_description">
                <td colspan="2">
                  <div class="d-flex">
                    <span
                      class="col1"
                      :class="`icon-${dep.family_description
                        .replace(/\s|_|\(|\)/g, '-')
                        .normalize('NFD')
                        .replace(/\p{Diacritic}/gu, '')
                        .toLowerCase()} icon text-${dep.family_sass}--darken`"
                    >
                    </span>
                    <span class="col10 fw-bold">
                      {{ dep.family_description }}
                    </span>
                  </div>
                  <div
                    v-for="cat in dep.categories"
                    :key="cat.category_id"
                    class="d-flex"
                  >
                    <span
                      class="col1"
                      :class="`icon-${cat.family_abbreviation}_${cat.category_id} icon text-${dep.family_sass}--darken`"
                      :aria-label="cat.category_description"
                    ></span>
                    <span class="col10">
                      {{ dep.family_description }}
                      {{ cat.category_description }}</span
                    >
                  </div>
                </td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'box']"
                    aria-label="Conditionnement"
                  />
                </td>
                <td>Conditionnement</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'tractor']"
                    aria-label="Culture"
                  />
                </td>
                <td>Culture</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'truck']"
                    aria-label="Fournisseur"
                  />
                </td>
                <td>Fournisseur</td>
              </tr>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'location-dot']"
                    aria-label="Localisation"
                  />
                </td>
                <td>Localisation</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'scale-balanced']"
                    aria-label="Mesure"
                  />
                </td>
                <td>Mesure</td>
              </tr>
            </tbody>
          </table>
          <table v-if="dropdown === 'menus'">
            <tbody>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'address-card']"
                    aria-label="Carte de fid??lit??"
                  />
                </td>
                <td>Carte de fid??lit??</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'box']"
                    aria-label="Conditionnement"
                  />
                </td>
                <td>Conditionnement</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'tractor']"
                    aria-label="Culture"
                  />
                </td>
                <td>Culture</td>
              </tr>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fab', 'facebook']"
                    aria-label="Page Facebook"
                  />
                </td>
                <td>Page Facebook</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'truck']"
                    aria-label="Fournisseur"
                  />
                </td>
                <td>Fournisseur</td>
              </tr>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'location-dot']"
                    aria-label="Localisation"
                  />
                </td>
                <td>Localisation</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'scale-balanced']"
                    aria-label="Mesure"
                  />
                </td>
                <td>Mesure</td>
              </tr>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'tag']"
                    aria-label="Promotions"
                  />
                </td>
                <td>Promotions</td>
              </tr>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fab', 'twitter']"
                    aria-label="Page Twitter"
                  />
                </td>
                <td>Page Twitter</td>
              </tr>
            </tbody>
          </table>
          <table v-else-if="dropdown === 'actions'">
            <tbody>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'circle-check']"
                    aria-label="Valider"
                  />
                </td>
                <td>Valider</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'plus']"
                    aria-label="Ajouter"
                  />
                </td>
                <td>Ajouter</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'search']"
                    aria-label="Rechercher"
                  />
                </td>
                <td>Rechercher</td>
              </tr>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'trash']"
                    aria-label="Supprimer"
                  />
                </td>
                <td>Supprimer</td>
              </tr>
            </tbody>
          </table>
          <table v-else-if="dropdown === 'navigation'">
            <tbody>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'cart-arrow-down']"
                    aria-label="Article"
                  />
                </td>
                <td colspan="2">Articles</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'magnifying-glass']"
                    aria-label="Rechercher"
                  />
                </td>
                <td colspan="2">Rechercher</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <span class="icon-inscription"></span>
                </td>
                <td colspan="2">Inscription</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'right-to-bracket']"
                    aria-label="Connexion"
                  />
                </td>
                <td colspan="2">Connexion</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'right-from-bracket']"
                    aria-label="D??connexion"
                  />
                </td>
                <td colspan="2">D??connexion</td>
              </tr>
              <tr v-if="mobile">
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'user']"
                    aria-label="Utilisateur"
                  />
                </td>
                <td colspan="2">Utilisateur</td>
              </tr>
              <tr>
                <td class="text-tools--ultradarken">
                  <font-awesome-icon
                    :icon="['fas', 'cart-shopping']"
                    aria-label="Panier"
                  />
                </td>
                <td colspan="2">Panier</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="footer-rotate"></div>
    <div class="footer">
      <div class="row">
        <div
          class="col-lg-3 col-sm-1 col-1 text-center cursor"
          @click="captionClick"
        >
          <div v-if="!mobile">L??gendes</div>
          <div v-else aria-label="L??gendes" class="f-size">
            <font-awesome-icon :icon="['fas', 'comment']" />
          </div>
        </div>
        <div class="col-lg-2 col-sm-1 col-1 text-center">
          <router-link
            :to="{
              name: 'TheError',
              params: {
                linkType: 'InConstruction',
              },
            }"
          >
            <div v-if="!mobile">Aide</div>
            <div v-else aria-label="Aide" class="f-size">
              <font-awesome-icon :icon="['fas', 'circle-question']" />
            </div>
          </router-link>
        </div>
        <div class="col-lg-2 col-sm-1 col-1">
          <router-link
            :to="{
              name: 'TheError',
              params: {
                linkType: 'InConstruction',
              },
            }"
          >
            <div v-if="!mobile">A propos de nous</div>
            <div v-else aria-label="A propos de nous" class="f-size">
              <font-awesome-icon :icon="['fas', 'circle-info']" />
            </div>
          </router-link>
        </div>
        <div class="col-lg-2 col-sm-1 col-1">
          <router-link
            :to="{
              name: 'TheError',
              params: {
                linkType: 'InConstruction',
              },
            }"
          >
            <div v-if="!mobile">Nous contacter</div>
            <div v-else aria-label="Nous contacter" class="f-size">
              <font-awesome-icon
                :icon="['fas', 'comment-dots']"
                aria-label="Contactez-nous"
              />
            </div>
          </router-link>
        </div>
        <div class="col-lg-3 col-sm-1 col-1">
          <router-link
            :to="{
              name: 'TheError',
              params: {
                linkType: 'InConstruction',
              },
            }"
          >
            <div v-if="!mobile">Mentions l??gales</div>
            <div v-else aria-label="Mentions l??gales" class="f-size">
              <font-awesome-icon
                :icon="['fas', 'book']"
                aria-label="Mentions l??gales"
              />
            </div>
          </router-link>
        </div>
        <div class="col-lg-12 col-sm-7 col-7 copyright">?? 2021, DPStudio</div>
      </div>
    </div>
  </div>
</template>

<script>
import StockService from '@/services/stock-service.js'
import { ref } from 'vue'

export default {
  setup() {
    const departements = ref([])
    StockService.listDepartements().then(
      (response) => (departements.value = response)
    )
    return { departements }
  },
  data() {
    return {
      mobile: false,
      mobileNav: false,
      windowWidth: null,
      orientation: false,
      caption: false,
      dropdown: '',
      countClick: 0,
    }
  },
  created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
  },
  methods: {
    toggleMobileNav() {
      this.mobileNav = !this.mobileNav
    },
    checkScreen() {
      this.windowWidth = window.innerWidth
      if (this.windowWidth <= 768) {
        let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
        if (screenOrientation === 'portrait-primary') {
          this.mobile = true
          this.orientation = true
          return
        } else {
          this.mobile = true
          this.orientation = false
          return
        }
      }
      this.orientation = false
      this.mobile = false
      this.mobileNav = false
      return
    },
    captionClick() {
      if (this.countClick === 0) {
        this.caption = !this.caption
        this.countClick = 1
      } else {
        this.caption = false
        this.countClick = 0
      }
    },
    mouseLeaveIn(value) {
      if (value === 'close') {
        this.caption = false
        this.dropdown = ''
      }
    },
    dropdownItem(value) {
      this.dropdown = value
    },
  },
}
</script>

<style scoped lang="scss">
@import "../../assets/sass/libs/variables.scss";
@import "../../assets/sass/style.scss";
.copyright {
  font-size: 12px;
}
.caption {
  position: fixed;
  left: 0;
  color: black;
  z-index: 99;
  .menu {
    width: 20vw;
    padding-left: 1%;
  }
  .submenu,
  table {
    max-height: 92.5vh;
    padding: 1vh 1vw;
    overflow-y: auto;
    overflow-x: hidden;
    .col1 {
      width: 15%;
    }
    .col10 {
      width: 85%;
    }
  }
}
a {
  color: inherit;
}
@media #{$desktop-up} {
  .footer {
    height: 10vh;
    padding-top: 1vh;
    .copyright {
      text-align: center;
    }
  }
  .caption {
    bottom: 10.5vh !important;
    .submenu,
    table {
      .col1 {
        width: 25%;
      }
      .col10 {
        width: 85%;
      }
    }
  }
}
@media #{$mobile-up} {
  .footer {
    display: none;
    height: 6vh;
    overflow: hidden;
    padding: 1vw 4vw 0 4vw;
    .f-size {
      font-size: 0.8rem;
    }
    .copyright {
      line-height: 30px;
      font-size: 10px;
      text-align: right;
    }
  }
  .caption {
    bottom: 6vh !important;
    .menu {
      width: 30vw;
      padding-right: 2vw;
    }
    .submenu,
    table {
      width: 100%;
      left: 30vw;
    }
  }
}
@media #{$mobile-down} {
  .footer {
    height: 7vh;
    width: 100vw;
    overflow: hidden;
    .f-size {
      font-size: 0.8rem;
    }
    .copyright {
      padding-right: 1rem;
      line-height: 1.3rem;
      text-align: right;
    }
  }
  .f-size {
    font-size: 0.6rem;
  }
  .caption {
    bottom: 7vh !important;
  }
}
</style>
