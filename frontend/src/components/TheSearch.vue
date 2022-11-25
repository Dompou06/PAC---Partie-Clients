<template>
  <div v-if="mobile && orientation" class="nav_bg">
    <input
      v-model="searchTerm"
      class="nav_bg"
      autocomplete="off"
      type="text"
      placeholder="Rechercher"
      @input="filterProducts(searchTerm)"
    />
    <div v-for="product in filteredProducts" :key="product.id" class="bg-light">
      <router-link
        :to="{
          name: 'TheProducts',
          params: {
            linkType: `${product.ref[0]}_${product.ref[2]}_${product.id}`,
          },
        }"
        :aria-label="`${product.name} ${product.variety}`"
        @click="close"
      >
        <span class="fw-bold ps-1"
          >{{ product.name }} {{ product.variety }}
        </span>
      </router-link>
    </div>
  </div>
  <div v-else class="dropdown">
    <button class="nav_bg">
      <input
        v-model="searchTerm"
        autocomplete="off"
        class="nav_bg"
        type="search"
        placeholder="Rechercher"
        aria-label="Rechercher"
        @input="filterProducts(searchTerm)"
      />
    </button>
    <ul class="" aria-labelledby="dropdownMenuButton1">
      <li v-for="product in filteredProducts" :key="product.id">
        <router-link
          :to="{
            name: 'TheProducts',
            params: {
              linkType: `${product.ref[0]}_${product.ref[2]}_${product.id}`,
            },
          }"
          :aria-label="`${product.name} ${product.variety}`"
          @click="close"
        >
          <span class="ps-1">{{ product.name }} {{ product.variety }} </span>
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import StockService from '@/services/stock-service.js'

export default {
  name: 'TheSearch',
  data() {
    return {
      searchTerm: '',
      filteredProducts: [],
      windowWidth: null,
      orientation: false,
    }
  },
  created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
  },
  methods: {
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
      }
      this.orientation = false
      this.mobile = false
      return
    },
    filterProducts(value) {
      //  console.log('value', value)
      if (value != '') {
        StockService.searchWeekArticles(value).then((response) => {
          //console.log('response', response)
          this.filteredProducts = response.result
          // console.log('this.filteredProducts', this.filteredProducts)
        })
      } else {
        this.filteredProducts = ''
      }
    },
    close() {
      this.searchTerm = ''
      this.filteredProducts = ''
      // eslint-disable-next-line vue/require-explicit-emits
      this.$emit('closeSearch')
    },
  },
}
</script>

<style scoped lang="scss">
@import "../assets/sass/libs/variables.scss";
@import "../assets/sass/style.scss";

div {
  width: 100%;
  button {
    width: 100%;
    border-radius: 0 !important;
    padding: 0 !important;
    margin: 0;
    input {
      width: 98%;
      height: 2vh;
      margin-left: -1vw !important;
      border: 0 !important;
      border-radius: 0 !important;
      font-size: 0.8rem;
    }
    input:focus {
      border: 0;
    }
  }
  ul {
    width: 100%;
    list-style: none !important;
    //margin-left: -4vw !important;
    background-color: white;
    li a {
      font-weight: 700;
      color: black;
    }
  }
}
//Pour desktop
@media #{$desktop-up} {
  .dropdown {
    button {
      padding: 0;
      margin: 0;
      input {
        height: 6.3vh;
      }
      input:focus {
        outline: 0;
      }
    }
    ul {
      padding-left: 0 !important;
      li {
        //margin-left: -9vw !important;
        font-size: 0.8rem;
      }
    }
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  div {
    position: relative;
    //top: -0.5vh;
    //left: -35vw;
    width: 70vw;
    button {
      position: relative;
      //left: 25vw !important;
      input {
        height: 4.5vh;
      }
      input:focus {
        outline: none;
      }
    }
    ul {
      margin-left: 0 !important;
      font-size: .7rem;
    }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  div {
    height: 7.7vh;
    padding-left: 1vw;
    input {
      // margin-top: 1.5vh;
      border: none;
      height: 7.7vh;
      line-height: 3vh;
    }
    input:focus {
      outline: none;
    }
    .bg-light {
      margin-left: -0.8vw;
      width: 50vw;
      padding-top: 0.5vh;
      a {
        color: black;
      }
    }
    ul {
      margin-left: 0 !important;
      li a {
        margin-left: -5vw !important;
      }
    }
  }
}
</style>
;
