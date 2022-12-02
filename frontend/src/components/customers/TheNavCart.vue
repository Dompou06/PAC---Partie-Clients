<template>
  <div class="">
    <router-link v-if="cart > 0" to="/cart" class="root">
      <div class="cart-shopping">
        <div class="cart-shopping--over">
          <font-awesome-icon
            :icon="['fas', 'cart-shopping']"
            aria-label="Voir le panier"
          />
        </div>
        <div class="cart-shopping--overlay">
          <span v-if="cart">{{ cart }}</span
          ><span v-else>0</span>
        </div>
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
</template>

<script>
export default {
  props: {
    cart: {
      type: Number,
      default: 0,
    },
  },
}
</script>

<style scoped lang="scss">
@import "../../assets/sass/libs/variables.scss";
@import "../../assets/sass/style.scss";

//Pour desktop
@media #{$desktop-up} {
  .root {
    display: block;
    height: 6.3vh;
    width: 7vw;
    .cart-shopping {
      display: grid;
      .cart-shopping--over {
        font-size: 1.3rem;
        line-height: 6.3vh;
        color: darken($tools, 65%);
      }
      .cart-shopping--overlay {
        line-height: 4.1vh;
        color: white;
        font-weight: 800;
      }
      .cart-shopping--over,
      .cart-shopping--overlay {
        grid-area: 1 / 1;
      }
    }
  }
  .router-link-active {
    background-color: darken($moyen, 10%) !important;
    .cart-shopping--over {
      color: white !important;
    }
    .cart-shopping--overlay {
      color: darken($tools, 65%) !important;
    }
  }
}
@media #{$mobile-up} {
  .root {
    display: block;
    .cart-shopping {
      height: 4.5vh;
      width: 25vw;
      padding-top: 0.1vh;
      display: grid;
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
  .router-link-active {
    display: block;
    background-color: darken($moyen, 10%) !important;
    .cart-shopping--over {
      color: white !important;
    }
    .cart-shopping--overlay {
      color: darken($tools, 65%) !important;
    }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  .root {
    position: absolute;
    height: 7vh;
    min-width: 5vw;
    left: 0;
    .cart-shopping {
      height: 100%;
      margin-left: -0.7vw;
      display: grid;
      .cart-shopping--over {
        font-size: 3vw;
        color: darken($tools, 65%);
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
  }
  .router-link-active {
    background-color: darken($moyen, 10%) !important;
    .cart-shopping--over {
      color: white !important;
    }
    .cart-shopping--overlay {
      color: darken($tools, 65%) !important;
    }
  }
}
</style>
