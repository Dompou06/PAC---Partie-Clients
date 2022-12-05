<template>
  <div v-if="desktop" class="d-flex">
    <div
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
        aria-label="Stock"
      >
        <span class="text-tools--ultradarken"
          >Stock <font-awesome-icon :icon="['fas', 'caret-down']" />
        </span>
      </button>
      <ul class="dropdown-menu" aria-labelledby="Listes des rayons">
        <li class="dropdown-item">
          <router-link
            :to="{
              name: 'TheStock',
            }"
            class="dropdown-item nav-color fw-bold"
          >
            Stock en cours
          </router-link>
        </li>
        <li class="dropdown-item">Nouveau stock</li>
        <li class="dropdown-item d-flex">
          <input id="week" type="week" name="week" class="nav_bg fw-bold" />
          <font-awesome-icon
            :icon="['fas', 'circle-check']"
            aria-label="Rechercher semaine"
          />
        </li>
      </ul>
    </div>
    <div
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
        aria-label="Caisses"
      >
        <span class="text-tools--ultradarken"
          >Caisses <font-awesome-icon :icon="['fas', 'caret-down']" />
        </span>
      </button>
      <ul class="dropdown-menu" aria-labelledby="Listes des rayons">
        <li class="dropdown-item">Caisse 1</li>
        <li class="dropdown-item">Caisse 2</li>
        <li class="dropdown-item">Caisse 3</li>
        <li class="dropdown-item">Commandes</li>
      </ul>
    </div>
    <div
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
        aria-label="Conatcts"
      >
        <span class="text-tools--ultradarken"
          >Contacts <font-awesome-icon :icon="['fas', 'caret-down']" />
        </span>
      </button>
      <ul class="dropdown-menu" aria-labelledby="Listes des rayons">
        <li class="dropdown-item">Clients</li>
        <li class="dropdown-item">Fournisseurs</li>
        <li class="dropdown-item">Entreprise</li>
      </ul>
    </div>
  </div>
  <div
    v-else
    id="nav-manager"
    class="d-flex flex-column justify-content-between"
  >
    <div id="stock" class="d-flex" @mouseleave="mouseLeaveStock">
      <button
        id="stock-button"
        type="button"
        class="btn nav-color"
        :class="{
          actived: sectionActive === 'stock',
        }"
        aria-label="Stock"
        @click="showStock()"
      >
        <span class="text-tools--ultradarken"
          ><font-awesome-icon :icon="['fas', 'boxes-stacked']" />
        </span>
      </button>
      <div id="stock-list" class="flex-fill d-flex nav_bg novisible">
        <router-link
          :to="{
            name: 'TheStock',
            params: {
              linkType: `stock_`,
            },
          }"
          class="flex-fill ps-2 pe-3 lh-7 text-center"
          aria-label="Stock en cours"
        >
          <font-awesome-icon :icon="['fas', 'calendar-check']" />
        </router-link>
        <div
          class="flex-fill text-center ps-3 pe-2 lh-7"
          aria-label="Nouveau stock"
        >
          <font-awesome-icon :icon="['fas', 'calendar-plus']" />
        </div>
        <form class="flex-fill pe-2 d-flex justify-content-between">
          <div class="responsabilities-input">
            <input id="week" type="week" name="week" class="nav_bg fw-bold" />
          </div>
          <div class="nav_bg lh-7" type="submit">
            <font-awesome-icon
              :icon="['fas', 'circle-check']"
              aria-label="Valider semaine"
            />
          </div>
        </form>
      </div>
    </div>
    <div id="cash-register" class="d-flex" @mouseleave="mouseLeaveCR">
      <button
        id="cash-button"
        type="button"
        class="btn nav-color"
        :class="{
          actived: sectionActive === 'cash',
        }"
        aria-label="Caisses"
        @click="showCR()"
      >
        <span class="text-tools--ultradarken"
          ><font-awesome-icon :icon="['fas', 'cash-register']" />
        </span>
      </button>
      <div
        id="cash-register--list"
        class="flex-fill d-flex align-items-center ps-2 nav_bg novisible"
      >
        <div
          class="flex-fill align-self-center text-center lh-7"
          aria-label="Caisse 1"
        >
          <font-awesome-icon :icon="['fas', 'cash-register']" /><span
            class="fw-bold lh-7"
          >
            1</span
          >
        </div>
        <div class="flex-fill text-center" aria-label="Caisse 2">
          <font-awesome-icon :icon="['fas', 'cash-register']" /><span
            class="fw-bold"
          >
            2</span
          >
        </div>
        <div class="flex-fill text-center" aria-label="Caisse 3">
          <font-awesome-icon :icon="['fas', 'cash-register']" /><span
            class="fw-bold"
          >
            3</span
          >
        </div>
        <div class="flex-fill text-center" aria-label="Commandes">
          <font-awesome-icon :icon="['fas', 'folder-plus']" />
        </div>
      </div>
    </div>
    <div id="contact" class="d-flex" @mouseleave="mouseLeaveContact">
      <button
        id="contact-button"
        type="button"
        class="btn nav-color"
        :class="{
          actived: sectionActive === 'contact',
        }"
        aria-label="Contacts"
        @click="showContact()"
      >
        <span class="text-tools--ultradarken"
          ><font-awesome-icon :icon="['fas', 'address-book']" />
        </span>
      </button>
      <div id="contact--list" class="flex-fill d-flex ps-2 nav_bg novisible">
        <div class="flex-fill text-center lh-7" aria-label="Clients">
          <font-awesome-icon :icon="['fas', 'user']" />
        </div>
        <div class="flex-fill text-center lh-7" aria-label="Fournisseurs">
          <font-awesome-icon :icon="['fas', 'truck']" />
        </div>
        <div class="flex-fill text-center lh-7" aria-label="Entreprise">
          <font-awesome-icon :icon="['fas', 'building']" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    desktop: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      sectionActive: '',
    }
  },
  watch: {
    $route: function (newRoute) {
      if (newRoute.params.linkType) {
        const params = newRoute.params.linkType.split('_')
        this.sectionActive = params[0]
      } else {
        this.sectionActive = ''
      }
    },
  },
  methods: {
    showStock() {
      document.getElementById('stock-list').classList.toggle('novisible')
      document.getElementById('stock').classList.toggle('buttonActive')
    },
    mouseLeaveStock() {
      document.getElementById('stock-list').classList.add('novisible')
      document.getElementById('stock').classList.remove('buttonActive')
    },
    showCR() {
      document
        .getElementById('cash-register--list')
        .classList.toggle('novisible')
      document.getElementById('cash-register').classList.toggle('buttonActive')
    },
    mouseLeaveCR() {
      document.getElementById('cash-register--list').classList.add('novisible')
      document.getElementById('cash-register').classList.remove('buttonActive')
    },
    showContact() {
      document.getElementById('contact--list').classList.toggle('novisible')
      document.getElementById('contact').classList.toggle('buttonActive')
    },
    mouseLeaveContact() {
      document.getElementById('contact--list').classList.add('novisible')
      document.getElementById('contact').classList.remove('buttonActive')
    },
  },
}
</script>

<style scoped lang="scss">
@import "../../../assets/sass/libs/variables.scss";
@import "../../../assets/sass/style.scss";

#nav-manager {
  position: relative;
  .buttonActive {
    button {
      background-color: darken($moyen, 10%) !important;
      width: 5vw !important;
      span {
        color: white !important;
      }
    }
  }
}
//Pour desktop
@media #{$desktop-up} {
  button {
    font-size: 0.8rem;
    color: darken($tools, 65%);
  }
  .dropdown-menu {
    margin-top: 0.2vh !important;
    color: darken($tools, 65%);
    background-color: $moyen;
    .dropdown-item {
      font-size: 0.7rem;
      font-weight: 600;
      line-height: 1.4rem;
      padding: 0 0 0 1.4rem;
      color: darken($tools, 65%);
    }
    .dropdown-item:hover {
      background-color: darken($moyen, 10%);
      color: white;
    }
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
}
//Pour mobile landscape
@media #{$mobile-down} {
  #nav-manager {
    margin-top: 2vh;
    height: 30vh;

    .lh-7 {
      line-height: 7.5vh;
    }
    //background-color: red;
    #stock,
    #cash-register,
    #contact {
      height: 7vh;
      width: 52.5vw;
      //  margin-bottom: 3vh;
      button {
        height: 100%;
        width: 5vw;
        border-radius: 0;
        padding: 0;
        //background-color: red;
      }
      a {
        color: darken($tools, 65%);
      }
      .router-link-active {
        background-color: darken($moyen, 10%) !important;
        color: white !important;
        max-height: 7vh !important;
      }
      .actived {
        background-color: darken($moyen, 10%) !important;
        color: white !important;
        span {
          color: white !important;
        }
      }
      input {
        border: 0;
      }
      input:focus {
        outline: 0;
      }
    }
  }
}
</style>
