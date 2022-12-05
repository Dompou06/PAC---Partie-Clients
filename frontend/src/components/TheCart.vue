<template>
  <section>
    <h2 class="title nav_bg text-center">Panier</h2>
    <div class="cart d-flex">
      <div class="products flex-fill">
        <div v-for="(article, index) in inStock" :key="index">
          <div :id="index" class="cart-item">
            <div class="d-flex justify-content-between">
              <input
                :id="`${index}-check`"
                type="checkbox"
                class="me-1"
                checked
              />
              <div class="flex-grow-1">
                <router-link
                  :to="{
                    name: 'TheProducts',
                    params: {
                      linkType: `${article.departement}_${article.id}`,
                    },
                  }"
                >
                  <h5>{{ article.name }} {{ article.variety }}</h5>
                </router-link>
              </div>
            </div>
            <div class="d-flex">
              <router-link
                :to="{
                  name: 'TheProducts',
                  params: {
                    linkType: `${article.departement}_${article.id}`,
                  },
                }"
              >
                <div v-if="getImage(article.image)" class="departement">
                  <img :src="getImage(article.image)" alt="" />
                </div>
                <div
                  v-else
                  :class="[
                    article.sass != 'fruit'
                      ? 'text-tools'
                      : 'text-tools--darken',
                    `bg-${article.sass}`,
                  ]"
                  class="departement text-center"
                >
                  <span
                    class="departement-noimage"
                    :class="`icon-${article.image[0]}_${article.image[2]}`"
                  ></span>
                </div>
              </router-link>
              <div class="me-landscape">
                <div class="d-flex infos">
                  <div class="quantity">
                    <div class="d-flex">
                      <button
                        :id="`decremt${article.id}`"
                        :disabled="article.quantity < 2"
                        class=""
                        @click="decrement(article.id)"
                      >
                        -
                      </button>
                      <input
                        :id="`quantity${article.id}`"
                        type="number"
                        class=""
                        :value="article.quantity"
                      />
                      <button class="" @click="increment(article.id)">+</button>
                      <button
                        class="share"
                        @click="deleteIt(`${article.id}, ${index}`)"
                      >
                        <font-awesome-icon
                          :icon="['fas', 'trash']"
                          aria-label="Supprimer l'article du panier"
                        />
                      </button>
                    </div>
                  </div>
                  <div
                    v-if="!mobile"
                    class="d-flex deed justify-content-between"
                  >
                    <div></div>
                    <div class="delete text-tools--verydarken"></div>
                  </div>
                  <div class="price flex-grow-1">
                    <div class="d-flex flex-wrap">
                      <input
                        :id="`pu${article.id}`"
                        type="number"
                        :value="article.ht"
                        class="hidden"
                      />
                      <input
                        :id="`price${article.id}`"
                        type="number"
                        :value="
                          (Number(article.pht) * article.quantity).toFixed(2)
                        "
                        class="price-input text-end fw-bold"
                        disabled
                      /><span class="fw-bold euro"> €</span>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="d-flex justify-content-between ms-3">
                    <router-link
                      :to="{
                        name: 'TheProducts',
                        params: {
                          linkType: `${article.departement}_${article.id}`,
                        },
                      }"
                      class="ms-landscape"
                      >Plus de détails
                    </router-link>
                    <div class="price-mes text-end">
                      {{ `${article.pht} €/${article.presentation}` }}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div v-if="soldOut != ''" class="">
          <div v-for="(article, index) in soldOut" :key="index">
            <div :id="index" class="cart-item">
              <div class="d-flex justify-content-between">
                <input
                  :id="`${index}-check`"
                  type="checkbox"
                  class="me-1"
                  checked
                />
                <div class="flex-grow-1">
                  <h5>{{ article.name }} {{ article.variety }}</h5>
                </div>
              </div>
              <div class="d-flex">
                <div v-if="getImage(article.image)" class="departement">
                  <img :src="getImage(article.image)" alt="" />
                </div>
                <div
                  v-else
                  :class="[
                    article.sass != 'fruit'
                      ? 'text-tools'
                      : 'text-tools--darken',
                    `bg-${article.sass}`,
                  ]"
                  class="departement text-center"
                >
                  <span
                    class="departement-noimage"
                    :class="`icon-${article.image[0]}_${article.image[2]}`"
                  ></span>
                </div>
                <div class="me-landscape">
                  <div class="d-flex infos">
                    <div class="unavailable">
                      <span class="fw-bold">Actuellement indisponible</span>
                      <button
                        class="share"
                        @click="deleteIt(`${article.id}, ${index}`)"
                      >
                        <font-awesome-icon
                          :icon="['fas', 'trash']"
                          aria-label="Supprimer l'article du panier"
                        />
                      </button>
                    </div>
                  </div>
                  <div class="ps-2 similar">
                    <router-link
                      :to="{
                        name: 'TheProducts',
                        params: {
                          linkType: `${article.departement}_products`,
                        },
                      }"
                    >
                      <button class="btn" type="button">
                        Articles similaires
                      </button>
                    </router-link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-if="!orientation" class="command flex-fill">
        <h6
          class="text-center fw-bold text-tools--ultradarken bg-tools--darken"
        >
          Sous-total
        </h6>
        <div class="total d-flex justify-content-end">
          <div class="ht">
            Total HT (<span id="count">{{ count }}</span
            >&nbsp;article<span id="articles"></span>) :
          </div>
          <div class="total-ht">
            <input
              id="totalHT"
              type="number"
              class="text-end fw-bold"
              :value="totalHt"
              disabled
            />
            <span class="fw-bold euro">€</span>
          </div>
        </div>
        <button class="bg-success fw-bold">Commander</button>
        <div class="hints">
          <h6
            class="text-center fw-bold text-tools--ultradarken bg-tools--darken"
          >
            A découvrir
          </h6>
          <div class="scroll">
            <div
              v-for="article in discover"
              :key="article.id"
              class="scroll-article"
            >
              <div class="d-flex justify-content-between w100">
                <div class="discover-article">
                  <span class="fw-bold"
                    >{{ article.name }} {{ article.variety }}</span
                  ><br />
                  {{ `${article.pht} €/${article.presentation}` }}
                </div>
                <router-link
                  :to="{
                    name: 'TheProducts',
                    params: {
                      linkType: `${article.departement}_${article.id}`,
                    },
                  }"
                >
                  <button>Plus de détails</button>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="orientation" class="command flex-fill">
      <div>
        <h6
          class="text-center fw-bold text-tools--ultradarken bg-tools--darken"
        >
          Sous-total
        </h6>
        <div class="total d-flex justify-content-end">
          <div class="ht">
            Total HT (<span id="count">{{ count }}</span
            >&nbsp;article<span id="articles"></span>) :
          </div>
          <div class="total-ht">
            <input
              id="totalHT"
              type="number"
              class="text-end fw-bold"
              :value="totalHt"
              disabled
            />
            <span class="fw-bold euro">€</span>
          </div>
        </div>
      </div>
      <router-link
        :to="{
          name: 'TheError',
          params: {
            linkType: 'InConstruction',
          },
        }"
      >
        <button class="mt-2 bg-success fw-bold">Commander</button>
      </router-link>
      <div class="hints">
        <h6
          class="text-center fw-bold text-tools--ultradarken bg-tools--darken"
        >
          A découvrir
        </h6>
        <div class="nav d-flex justify-content-between">
          <div
            id="arrow-left"
            class="align-self-center bg-tools--verydarken text-light disabled"
            @click="move('left')"
          >
            <font-awesome-icon
              :icon="['fas', 'caret-left']"
              aria-label="Article précédent"
            />
          </div>
          <div id="hint-articles">
            <div id="wlength" class="">
              <div
                v-for="article in discover"
                :key="article.id"
                class="hint-article"
              >
                <div class="d-flex flex-column hint-article--flex">
                  <div class="mb-auto">
                    <span class="fw-bold"
                      >{{ article.name }} {{ article.variety }}</span
                    ><br />
                    {{ article.presentation }}
                  </div>
                  <router-link
                    :to="{
                      name: 'TheProducts',
                      params: {
                        linkType: `${article.departement}_${article.id}`,
                      },
                    }"
                  >
                    <button class="">Plus de détails</button>
                  </router-link>
                </div>
              </div>
            </div>
          </div>
          <div
            id="arrow-right"
            class="align-self-center bg-tools--verydarken text-light"
            @click="move('right')"
          >
            <font-awesome-icon
              :icon="['fas', 'caret-right']"
              aria-label="Article suivant"
            />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import StockService from '@/services/stock-service.js'
import AuthService from '@/services/auth-service.js'
import { mapGetters } from 'vuex'

export default {
  name: 'TheCart',
  data: function () {
    return {
      inStock: [],
      soldOut: [],
      discover: [],
      discoverLength: 0,
      left: 0,
      imageOut: '',
      newQuantity: '',
      totalHt: 0,
      tva: 0,
      ttc: 0,
      counter: '',
      count: '',
      orientation: false,
      mobile: false,
    }
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      management: 'auth/management',
    }),
  },
  watch: {
    counter(newValue) {
      // console.log('newValue', newValue)
      const split = newValue.split(',')
      const localStorageCart = JSON.parse(localStorage.getItem('cart'))
      // console.log('split[2]', split[2])
      if (split[3] != 0) {
        // console.log('localStorageCart', localStorageCart)
        const oldQuantity = document.getElementById(`quantity${split[0]}`).value
        const newQuantity = Number(oldQuantity) + Number(split[2])
        //console.log('oldQuantity', split[2])
        document.getElementById(`quantity${split[0]}`).value =
          Number(oldQuantity) + Number(split[2])
        if (Number(oldQuantity) + Number(split[2]) > 1) {
          document.getElementById(`decremt${split[0]}`).disabled = false
        } else {
          document.getElementById(`decremt${split[0]}`).disabled = true
        }
        for (let i in localStorageCart) {
          if (localStorageCart[i].id === split[0]) {
            localStorageCart[i].quantity = (
              Number(oldQuantity) + Number(split[2])
            ).toString()
          }
        }
        localStorage.setItem('cart', JSON.stringify(localStorageCart))
        //console.log('localStorageCart', localStorageCart)
        document.getElementById(`price${split[0]}`).value =
          Number(split[1]) * (Number(oldQuantity) + Number(split[2]))
        const totalHT = document.getElementById('totalHT').value
        document.getElementById('totalHT').value = (
          Number(totalHT) +
          Number(split[1]) * Number(split[2])
        ).toFixed(2)
        const allQuantities = document.getElementById('count').innerHTML
        // console.log('allQuantities', allQuantities)
        document.getElementById('count').innerHTML =
          Number(allQuantities) + Number(split[2])
        if (Number(allQuantities) + Number(split[2]) > 1) {
          document.getElementById('articles').innerHTML = 's'
        } else {
          document.getElementById('articles').innerHTML = ''
        }
      } else {
        //console.log('newValue', newValue)
        const oldPrice = document.getElementById(`price${split[0]}`).value
        const oldQuantity = document.getElementById(`quantity${split[0]}`).value
        const totalHT = document.getElementById('totalHT').value
        document.getElementById('totalHT').value = (
          Number(totalHT) - Number(oldPrice)
        ).toFixed(2)
        document.getElementById(split[1]).remove()
        const allQuantities = document.getElementById('count').innerHTML
        // console.log('allQuantities', allQuantities)
        document.getElementById('count').innerHTML =
          Number(allQuantities) - Number(oldQuantity)
        if (Number(allQuantities) - Number(oldQuantity) > 1) {
          document.getElementById('articles').innerHTML = 's'
        } else {
          document.getElementById('articles').innerHTML = ''
        }
        localStorageCart.splice(
          localStorageCart.findIndex((v) => v.id === split[0]),
          1
        )
        localStorage.setItem('cart', JSON.stringify(localStorageCart))
      }
    },
    management(newManagement, oldManagent) {
      if (newManagement != 'Customer') {
        this.$router.replace({
          name: 'home',
        })
      }
    },
  },
  created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
  },
  mounted() {
    if (localStorage.cart) {
      const productsInCart = JSON.parse(localStorage.getItem('cart'))
      this.find(productsInCart)
    }
  },
  methods: {
    find(value) {
      const ref = []
      for (let i in value) {
        ref.push(value[i].ref)
      }
      StockService.findCart(ref).then((response) => {
        response.inStock.forEach((stock) => {
          let cart = value.find((item) => item.ref == stock.id_prod)
          if (cart) {
            let pht = (
              Number(stock.pf) +
              (Number(stock.pf) * Number(stock.marge)) / 100
            ).toFixed(2)
            let presentation = ''
            if (stock.cond) {
              presentation = `${stock.cond} - ${Number(stock.quantity).toFixed(
                0
              )} ${stock.mes}`
            } else {
              if (Number(stock.quantity) != 1) {
                presentation = `${Number(stock.quantity).toFixed(0)} ${
                  stock.mes
                }`
              } else {
                presentation = stock.mes
              }
            }
            this.inStock.push({
              ...stock,
              departement: stock.departement,
              image: cart.image,
              pht: pht,
              presentation: presentation,
              quantity: cart.quantity,
              sass: cart.sass,
            })
            this.count = Number(this.count) + Number(cart.quantity)
          }
        })
        if (this.count > 1) {
          document.getElementById('articles').innerHTML = 's'
        } else {
          document.getElementById('articles').innerHTML = ''
        }
        let res = 0
        for (let i in this.inStock) {
          res += this.inStock[i].pht * this.inStock[i].quantity
        }
        this.totalHt = Number(res).toFixed(2)
        this.tva = ((Number(this.totalHt) * 20) / 100).toFixed(2)
        this.ttc = (Number(this.totalHt) + Number(this.tva)).toFixed(2)
        response.discover.forEach((stock) => {
          let pht = (
            Number(stock.pf) +
            (Number(stock.pf) * Number(stock.marge)) / 100
          ).toFixed(2)
          let presentation = ''
          if (stock.cond) {
            if (stock.cond != 'vrac') {
              presentation = `${stock.cond} - ${Number(stock.quantity).toFixed(
                0
              )} ${stock.mes}`
            } else {
              if (Number(stock.quantity) != 1) {
                presentation = `${Number(stock.quantity).toFixed(0)} ${
                  stock.mes
                }`
              } else {
                presentation = stock.mes
              }
            }
          } else {
            if (Number(stock.quantity) != 1) {
              presentation = `${Number(stock.quantity).toFixed(0)} ${stock.mes}`
            } else {
              presentation = stock.mes
            }
          }
          let split = stock.id_prod.split('_')
          let image = ''
          if (stock.variety) {
            image = `${split[0]}_${split[1]}_${split[2]}_${split[3]}`
          } else {
            image = `${split[0]}_${split[1]}_${split[2]}`
          }
          this.discover.push({
            id: stock.id,
            departement: stock.departement,
            name: stock.name,
            variety: stock.variety,
            pht: pht,
            presentation: presentation,
            image: image,
          })
        })
        if (this.orientation === true) {
          this.discoverLength = this.discover.length
          const wLength = document.getElementById('wlength')
          this.left = 0
          let newWidth =
            Number(this.discoverLength) * 36 +
            (Number(this.discoverLength) - 1) * 3
          wLength.style.width = newWidth.toString() + '%'
        }
        if (response.soldOut) {
          response.soldOut.forEach((stock) => {
            let cart = value.find((item) => item.ref == stock.id_prod)
            if (cart) {
              this.soldOut.push({
                id: stock.id,
                departement: stock.departement,
                name: stock.name,
                variety: stock.variety,
                image: cart.image,
                quantity: cart.quantity,
                description: stock.description,
                sass: cart.sass,
              })
            }
          })
        }
      })
    },
    getImage(file) {
      let image = ''
      try {
        image = require.context('../assets/img/products/', false, /\.jpg$/)
        return image('./' + file + '.jpg')
      } catch (error) {
        return (image = '')
      }
    },
    checkScreen() {
      this.windowWidth = window.innerWidth
      if (this.windowWidth <= 768) {
        this.mobile = true
        let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
        if (screenOrientation === 'portrait-primary') {
          //console.log('portrait-primary')
          this.orientation = true
          return
        } else {
          //console.log('portrait-landscape')
          this.orientation = false
          return
        }
      } else {
        this.orientation = false
        this.mobile = false
        return
      }
    },
    increment(value) {
      const pu = document.getElementById(`pu${value}`).value
      const quantity = document.getElementById(`quantity${value}`).value
      this.counter = `${value},${pu},${Number(1)},${quantity}`
    },
    decrement(value) {
      const pu = document.getElementById(`pu${value}`).value
      const quantity = document.getElementById(`quantity${value}`).value
      this.counter = `${value},${pu},${Number(-1)},${quantity}`
    },
    deleteIt(value) {
      const split = value.split(', ')
      this.counter = `${split[0]},${split[1]},${Number(0)},${Number(
        0
      )},${Number(0)}`
      this.$store.dispatch('cart/updateCount', Number(-1))
    },
    move(value) {
      const wLength = document.getElementById('wlength')
      let widthWLength = Number(wLength.style.width.replace('%', ''))
      this.left = Number(wLength.style.left.replace('%', ''))
      if (value === 'right') {
        if (this.left >= -(widthWLength - 75)) {
          wLength.style.left = `${this.left - 39}%`
          this.left = `${this.left - 39}`
        }
      }
      if (value === 'left') {
        if (this.left != 0) {
          wLength.style.left = `${this.left + 39}%`
          this.left = `${this.left + 39}`
        }
      }
      if (this.left != 0) {
        document.getElementById('arrow-left').classList.remove('disabled')
      } else {
        document.getElementById('arrow-left').classList.add('disabled')
      }
      if (this.left != -(widthWLength - 75)) {
        document.getElementById('arrow-right').classList.remove('disabled')
      } else {
        document.getElementById('arrow-right').classList.add('disabled')
      }
    },
  },
}
</script>

<style lang="scss" scoped>
@import "../assets/sass/libs/variables.scss";
@import "../assets/sass/style.scss";
@import url("../assets/icomoon/categories/style.css");

section {
  button:disabled {
    opacity: 0.5;
    cursor: none;
  }
  input {
    border: none;
    text-align: right;
    background-color: transparent;
  }
  input:focus {
    border: none;
    outline: none;
  }
  input[type="checkbox"] {
    border-radius: 0;
  }
  button {
    background-color: darken($tools, 50%);
    color: white;
  }
  a {
    color: inherit;
  }
}
//Pour desktop
@media #{$desktop-up} {
  section {
    height: 75%;
    justify-content: center;
    .title {
      display: none;
    }
    h3 {
      font-size: 1rem;
      font-weight: 600;
      text-align: center;
      margin: 0;
    }
    h4 {
      font-size: 1rem;
      font-weight: 600;
      margin: 0;
    }
    h5 {
      font-size: 0.9rem;
      font-weight: 600;
      margin: 0;
    }
    .products {
      width: 100%;
      height: 83.2vh;
      padding: 0 2vw;
      overflow-x: auto;
    }
    .departement {
      width: 10vw;
      height: 10vw !important;
      font-size: 10vw;
      text-align: center;
      line-height: 0;
      overflow: hidden;
      img {
        width: 100%;
      }
    }
    .me-landscape {
      width: 100%;
      .infos {
        width: 100%;
        .price {
          width: 30%;
          input {
            width: 90%;
          }
          .price-mes {
            width: 60%;
            text-align: left !important;
            padding-left: 1vw;
          }
        }
        .quantity,
        .unavailable {
          width: 75%;
          padding-left: 5vw;
          button {
            width: 2.5vw !important;
            font-weight: 700;
            text-align: center;
          }
          input {
            width: 40%;
          }
        }
        .share {
          margin: 0 0 0 2vw;
          height: 2.55vw;
        }
      }
      .ms-landscape {
        margin-left: 15.5%;
      }
    }
    .command {
      height: 83.2vh;
      width: 40%;
      .total {
        height: 5%;
        .ht {
          width: 60%;
          padding-left: 1vw;
        }
        .total-ht {
          width: 40%;
          input {
            width: 70%;
          }
        }
      }
      button {
        width: 100%;
      }
      .hints {
        width: 100%;
        .scroll {
          height: 62vh;
          padding-left: 1vw;
          overflow-y: auto;
          .scroll-article {
            margin-bottom: 1vh;
            width: 100%;
            .w100 {
              width: 100%;
              .discover-article {
                width: 90% !important;
              }
              a button {
                width: 100% !important;
                padding: 0 !important;
              }
            }
          }
        }
      }
    }
    .delete {
      z-index: 99;
      input {
        width: 15vw;
        text-align: start;
        padding: 1vh 1vw 0 0.5vw;
      }
    }
    .similar {
      margin-left: 5vw;
      .btn {
        border-radius: 0;
      }
      .btn:hover {
        color: white;
      }
    }
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  section {
    height: 100%;
    .title {
      display: block;
      top: 0 !important;
      font-size: 4vh;
      font-weight: 600;
      color: darken($tools, 65%);
      line-height: 4.5vh;
    }
    h3 {
      font-size: 1rem;
      font-weight: 600;
      text-align: center;
      margin: 0;
    }
    h4 {
      font-size: 1rem;
      font-weight: 600;
      margin: 0;
    }
    h5 {
      font-size: 0.7rem;
      font-weight: 600;
      margin: 0;
    }
    h6 {
      font-size: 0.7rem;
      font-weight: 600;
      margin: 0;
    }
    .products {
      height: 55vh;
      padding: 0 2vw;
      overflow-y: auto;
      input[type="checkbox"] {
        width: 5vw;
        height: 5vw;
      }
      .cart-item {
        height: 15vh;
        margin-bottom: 2vh;
      }
    }
    .command {
      position: relative;
      width: 100vw;
      .total {
        width: 100%;
        padding-right: 1vw;
        .ht {
          width: 65%;
          text-align: end;
        }
        .total-ht {
          width: 33%;
          input {
            width: 20vw !important;
            margin-right: 0.1rem;
            padding-left: 2vw;
          }
        }
      }
      button {
        width: 100%;
      }
    }
    .departement {
      position: relative;
      width: 25vw;
      height: 25vw;
      font-size: 25vw;
      line-height: 0;
      img {
        width: 100%;
      }
    }
    .me-landscape {
      height: 25vw;
      width: 75vw;
      .infos {
        width: 100%;
        .quantity,
        .unavailable {
          width: 80%;
          margin-left: 3vw;
        }
        button {
          width: 3vh;
          height: 3vh;
          font-weight: 700;
          text-align: center;
          line-height: 0;
        }
        input {
          width: 30%;
          height: 3vh;
          margin: 0 1vw;
        }
        .share {
          width: 3vh;
          height: 3vh;
          padding: 0;
          margin: 0 0 0 2vw;
          line-height: 0;
          text-align: center;
          font-size: 0.6rem;
        }
      }
      .price {
        width: 40%;
        input {
          width: 80%;
          text-align: right;
        }
        .price-mes {
          width: 100%;
        }
      }
      .unavailable {
        span {
          font-size: 0.7rem;
        }
      }
      .similar {
        font-size: 0.7rem;
        .btn {
          border-radius: 0;
          font-size: 0.7rem;
        }
        .btn:focus {
          color: white;
        }
      }
    }
    .hints {
      width: 100%;
      .nav {
        width: 100%;
        #hint-articles {
          height: 12vh;
          width: 85%;
          overflow-x: hidden;
          #wlength {
            position: relative;
            display: flex;
            left: 0%;
            width: 0%;
            flex-direction: row;
            align-content: space-between;
            .hint-article {
              width: 36%;
              font-size: 0.6rem;
              line-height: 0.6rem;
              margin-right: 3%;
              .hint-article--flex {
                margin-top: 1vh;
                height: 9vh;
                button {
                  padding: 1vh 0;
                }
              }
            }
          }
        }
        #arrow-left,
        #arrow-right {
          height: 14vh;
          font-size: 5vh;
          line-height: 12vh;
          z-index: 99;
        }
        .disabled {
          opacity: 0.5;
          pointer-events: none;
        }
      }
    }
    .euro {
      padding-top: 0.05rem;
    }
    #totalHT {
      width: 10vw;
    }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  section {
    position: relative;
    left: 5vw;
    height: 100%;
    width: 95%;
    .title {
      font-size: 6vh;
      font-weight: 600;
      color: darken($tools, 65%);
      line-height: 6.5vh;
    }
    h3 {
      font-size: 0.9rem;
      font-weight: 600;
      text-align: center;
      margin: 0;
    }
    h4 {
      font-size: 0.8rem;
      font-weight: 600;
      margin: 0;
    }
    h5 {
      font-size: 0.7rem;
      font-weight: 600;
      margin: 0;
    }
    h6 {
      font-size: 0.7rem;
      font-weight: 600;
      margin: 0;
    }
    .cart {
      width: 100%;
    }
    .products {
      width: 55%;
      height: 82.5vh;
      padding: 0 2vw;
      overflow-y: auto;
      input[type="checkbox"] {
        width: 2.5vw;
        height: 2.5vw;
      }
      .cart-item {
        height: 30vh;
      }
    }
    .command {
      position: relative;
      top: -2.8vh;
      width: 25%;
      height: 85.3vh;
      .total {
        width: 100%;
        padding-right: 1vw;
        .ht {
          width: 65%;
          text-align: end;
        }
        .total-ht {
          width: 33%;
          input {
            width: 9vw !important;
            margin-right: 0.1rem;
            padding-left: 2vw;
          }
        }
      }
      button {
        width: 100%;
      }
    }
    .departement {
      position: relative;
      width: 13.3vw;
      height: 13.3vw;
      font-size: 12.8vw;
      line-height: 0;
      z-index: 90;
      img {
        width: 100%;
      }
    }
    .me-landscape {
      width: 77%;
      .infos {
        width: 100%;
        .quantity,
        .unavailable {
          width: 80%;
          margin-left: 3vw;
          button {
            width: 3vw;
            height: 3vw;
            font-weight: 700;
            text-align: center;
            line-height: 0;
          }
          input {
            width: 30%;
            height: 3vw;
            margin: 0 1vw;
          }
          .share {
            width: 3vw;
            height: 3vw;
            padding: 0;
            margin: 0 0 0 2vw;
            line-height: 0;
            text-align: center;
            font-size: 0.6rem;
          }
        }
        .price {
          width: 40%;
          input {
            width: 90%;
            text-align: right;
          }
          .price-mes {
            width: 100%;
          }
        }
      }
    }
    .hints {
      .scroll {
        margin-top: 1vh;
        height: 49vh;
        overflow-y: auto;
        .w100 {
          width: 100%;
        }
        a {
          margin-right: 2vw;
          width: 30%;
          button {
            font-size: 0.6rem;
            line-height: 0.6rem;
            padding: 0 !important;
            margin-bottom: 0.4rem;
          }
        }
      }
    }
    .euro {
      padding-top: 0.05rem;
    }
    #totalHT {
      width: 10vw;
    }
    .similar {
      button {
        border-radius: 0;
        font-size: 0.7rem;
        font-weight: 600;
        color: white;
      }
    }
  }
}
</style>
