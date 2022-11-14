<!-- eslint-disable semi -->
<template>
  <div id="container">
    <div
      v-if="product && product != 'products'"
      :class="[familyId === '2' ? 'text-dark' : 'text-light']"
     >
      <div class="flex-fill">
        <input
          id="id-product"
          type="text"
          :value="article.id_prod"
          class="hidden"
        />
        <input id="id" type="text" :value="article.id" class="hidden" />
        <h1>{{ article.name }} {{ article.variety }}</h1>
      </div>
      <div class="d-flex flex-column">
        <div class="flex-fill d-flex">
            <div class="col1 fw-bold text-end">Agriculture</div>
            <div class="col2 ps-1">{{ article.agr }}</div>
        </div>
        <div class="flex-fill d-flex">
            <div class="col1 fw-bold text-end">Localisation</div>
            <div class="col2 ps-1">{{ article.loc }}</div>
        </div>
        <div class="flex-fill d-flex">
            <div class="col1 fw-bold text-end">Conditionnement</div>
            <div class="col2 ps-1">{{ article.cond }}</div>
        </div>
        <div class="flex-fill d-flex">
            <div class="col1 fw-bold text-end">
              Description<br/>
              <div v-if="getImage" class="departement-image">
                <img :src="getImage" :alt="caption" />
              </div>
              <div
                v-else
                class="departement-image"
                :class="`bg-${sass}--opacity`"
              >
                <span
                  class="departement-noimage text-light"
                  :class="`icon-${noImage}`"
                ></span>
              </div>
            </div>
            <div class="col2 ps-1 col-des scrollbar">{{ article.description }}</div>
        </div>
        <div class="mt-auto d-flex">
            <div class="col1 fw-bold text-end">Prix HT</div>
            <input
                  v-if="article.cond"
                  id="pu"
                  type="text"
                  class="col2 ps-1 input-inport"
                  :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                  :value="`${pu} €/${article.cond} - ${quantityArticle} ${article.mes}`"
                  disabled
                />
                <input
                  v-else
                  id="pu"
                  type="text"
                  class="col2 ps-1 input-inport"
                  :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                  :value="`${pu} €/${quantityArticle}${article.mes}`"
                  disabled
                />
        </div>
        <div class="flex-fill d-flex">
          <div class="col1 fw-bold d-flex">
            <div class="quantity">
            <div class="dropup">
              <button
              type="button"
              class="text-light dropdown-toggle"
              :class="[familyId === '2' ? 'text-dark' : 'text-light']"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              data-bs-offset="7, 0"
             >
              <span class="fw-bold">Quantité</span>
              <input
                id="quantity"
                type="text"
                class="text-end"
                :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                value="1"
                disabled
              />
              </button>
              <ul class="dropdown-menu text-end">
              <li
                v-for="index in 10"
                :key="index"
                class="text-end pe-2"
                @click="quantity(index)"
              >
                {{ index }}
              </li>
              </ul>
          </div>
          </div>
          <div class="">Total</div>
          </div>
          <div class="col2 ps-1">
            <input
id="price-pu" type="text" class="hidden"
            :value="pu">
            <input
            id="price"
            type="text"
            class="input-inport"
            :class="[familyId === '2' ? 'text-dark' : 'text-light']"
            :value="`${pu} €`"
            disabled
          /></div>
        </div>
      </div>

      <!--<table class="flex-fill">
        <tbody>
          <tr>
            <td class="col1 fw-bold text-end">Agriculture</td>
            <td class="col2 ps-1">{{ article.agr }}</td>
          </tr>
          <tr>
            <td class="col1 fw-bold text-end">Localisation</td>
            <td class="ps-1">{{ article.loc }}</td>
          </tr>
          <tr>
            <td class="col1 fw-bold text-end">Conditionnement</td>
            <td class="ps-1">{{ article.cond }}</td>
          </tr>
          <tr>
            <td valign="top" class="col1 fw-bold text-end">
              <div class="d-flex flex-column">
                <div>Description</div>
                <div v-if="getImage" class="departement-image">
                  <img :src="getImage" :alt="caption" />
                </div>
                <div
                  v-else
                  class="departement-image"
                  :class="`bg-${sass}--opacity`"
                >
                  <span
                    class="departement-noimage text-light"
                    :class="`icon-${noImage}`"
                  ></span>
                </div>
              </div>
            </td>
            <td valign="top" class="col-des scrollbar ps-1">
              {{ article.description }}
            </td>
          </tr>
          <tr class="fw-bold">
            <td colspan="2">
              <div class="d-flex justify-content-between mt-2">
                <div>Prix HT</div>
                <input
                  v-if="article.cond"
                  id="pu"
                  type="text"
                  class="input-inport input-measure text-end pe-0"
                  :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                  :value="`${pu} €/${article.cond} - ${quantityArticle}${article.mes}`"
                  disabled
                />
                <input
                  v-else
                  id="pu"
                  type="text"
                  class="input-inport input-measure text-end pe-0 red"
                  :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                  :value="`${pu} €/${quantityArticle}${article.mes}`"
                  disabled
                />
              </div>
              
            </td>
          </tr>
          <tr>
            <td>
              <div class="d-flex">
                <div class="flex-fill text-end">
                  <div class="dropup">
                    <button
                      type="button"
                      class="text-light dropdown-toggle"
                      :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                      data-bs-offset="7, 0"
                    >
                      Quantité
                      <input
                        id="quantity"
                        type="text"
                        class="text-end"
                        :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                        value="1"
                        disabled
                      />
                    </button>
                    <ul class="dropdown-menu text-end">
                      <li
                        v-for="index in 10"
                        :key="index"
                        class="text-end pe-2"
                        @click="quantity(index)"
                      >
                        {{ index }}
                      </li>
                    </ul>
                  </div>
                </div>
                <div>
                  <input
                    id="price"
                    type="text"
                    class="input-inport text-end"
                    :class="[familyId === '2' ? 'text-dark' : 'text-light']"
                    :value="pu"
                    disabled
                  />
                  €
                </div>
              </div>
            </td>
          </tr>
        </tbody>
      </table>-->
      <div
        v-if="showCart"
        class="panier flex-fill text-center text-light fw-bold cursor"
        :class="`bg-${sass}--darken`"
        @click="showInCart"
      >
        Voir le panier
      </div>
      <div
        v-else
        class="panier flex-fill text-center text-light fw-bold cursor"
        :class="`bg-${sass}--darken`"
        @click="saveInCart"
      >
        Ajouter au panier
      </div>
    </div>
    <div v-else>
      <div class="image d-flex">
        <img :src="getImage" :alt="caption" />
      </div>
      <div class="description ps-3 pe-3">
        {{ description }}
      </div>
    </div>
  </div>
</template>

<script>
import StockService from '@/services/stock-service.js'
import { mapActions, mapGetters, mapState } from 'vuex'
import store from '../store'

export default {
  name: 'TheArticle',
  props: {
    product: {
      type: String,
      default: '',
    },
    family: {
      type: String,
      default: '',
    },
    category: {
      type: String,
      default: '',
    },
    sass: {
      type: String,
      default: '',
    },
  },
  data() {
    return {
      description: '',
      imageIn: '',
      caption: '',
      info: {},
      article: {},
      pu: 0,
      quantityArticle: '',
      noImage: '',
      familyId: '',
      showCart: false,
    }
  },
  computed: {
    ...mapState(['cart']),
    //...mapGetters(['cart/formattedCart']),
    getImage() {
      let imgSrc = ''
      try {
        imgSrc = require(`../assets/img/products/${this.imageIn}.jpg`)
        //console.log('Image', this.imageIn)
      } catch (error) {
        /* this.noImage = true
        console.log('noImage', noImage)*/
        // console.error(`Image '../assets/img/products/${this.imageIn}.jpg' not found!`)
        imgSrc = ''
      }
      return imgSrc
    },
  },
  watch: {
    family(val, oldval) {
      /* console.log('val', val)
      console.log('oldval', oldval)  
      console.log('this.family', this.family)  */
      let find = {}
      find.type = 'family'
      find.value = val
      this.find(find)
    },
    category(val, oldval) {
      // console.log('val', val)
      // console.log('this.family', this.family)
      /* 
      console.log('oldval', oldval)  
      console.log('this.category', this.category)  */
      let find = {}
      find.type = 'category'
      find.value = val
      this.find(find)
    },
    product(val, oldval) {
      //console.log('val', val)
      // console.log('this.family', this.family)
      /* 
      console.log('oldval', oldval)  
      console.log('this.category', this.category)  */
      let find = {}
      find.type = 'product'
      find.value = val
      this.find(find)
    },
    saveInCart() {
      const newProduct = {}
      newProduct.id = document.getElementById('id').value
      newProduct.ref = document.getElementById('id-product').value
      newProduct.quantity = document.getElementById('quantity').value
      newProduct.price = document.getElementById('pu').value
      //console.log('newProduct', newProduct)
      let oldCart = JSON.parse(localStorage.getItem('cart')) || []
      // console.log('oldCart', oldCart)
      let check = oldCart.find((element) => element.ref === newProduct.ref)
      // console.log('check', check)
      if (check === undefined) {
        oldCart.push(newProduct)
      }
      //console.log('oldCart', oldCart)
      localStorage.setItem('cart', JSON.stringify(oldCart))
      // localStorage.cart = JSON.stringify(newProduct)
      this.showCart = true
    },
  },
  created() {
    let find = {}
    if (this.product && this.product != 'products') {
      //console.log('product', this.product)
      find.type = 'product'
      find.value = this.product
      this.find(find)
    } else {
      if (this.category) {
        //console.log('category', this.category)
        find.type = 'category'
        find.value = this.category
        this.find(find)
      } else if (this.family) {
        //console.log('family', this.family)
        find.type = 'family'
        find.value = this.family
        this.find(find)
      }
    }
  },
  methods: {
    find(value) {
      // console.log('value', value)
      StockService.find(value).then((response) => {
        // console.log('response', response.response)
        this.showCart = false
        const infos = response.response
        //console.log('infos.category_text', infos.category_text)
        if (value.type === 'category' && value.value != '') {
          this.description = infos.category_text
          const image = infos.family_abbreviation
          this.imageIn = image.toString()
          this.caption = infos.category_description
          // console.log('imageIn', this.imageIn)
        } else if (value.type === 'family') {
          // console.log('infos.family_text', infos.family_text)
          this.description = infos.family_text
          const image = infos.id
          this.imageIn = image.toString()
          this.caption = infos.family_description
        } else if (value.type === 'product' && value.value != 'products') {
          document.getElementById('container').scrollTop = 0
          this.article = infos
          this.familyId = infos.departement[0]
          let marge = 0
          if (infos.marge === '') {
            marge = 33
          } else {
            marge = Number(infos.marge)
          }
          const articleQuantity = Math.round(Number(infos.quantity))
          if (infos.cond != '') {
            this.quantityArticle = articleQuantity + ' '
          } else if (articleQuantity != 1) {
            this.quantityArticle = articleQuantity + ' '
          }
          this.pu = (
            (Number(infos.pf) * marge) / 100 +
            Number(infos.pf)
          ).toFixed(2)
          let image = infos.id_prod
          const split = image.split('_')
          //  console.log('image', image)
          image = `${split[0]}_${split[1]}_${split[2]}_${split[3]}`
          // console.log('image', image)
          // image = image.substring(0, 7)
          if (image.slice(-1) != '_') {
            this.imageIn = image.toString()
          } else {
            this.imageIn = image.substring(0, image.length - 1)
          }
          // console.log('this.imageIn', this.imageIn)
          this.noImage = `${split[0]}_${split[1]}`
          // console.log('this.noImage', this.noImage)
        }
      })
    },
    quantity(value) {
      //console.log('quantity', value)
      document.getElementById('quantity').value = value
      const price = Number(document.getElementById('price-pu').value)
      const total = (value * price).toFixed(2) + ' €'
      document.getElementById('price').value = total
    },
    saveInCart() {
      const newProduct = {}
      // console.log('sass', this.sass)
      newProduct.id = document.getElementById('id').value
      newProduct.ref = document.getElementById('id-product').value
      newProduct.quantity = document.getElementById('quantity').value
      newProduct.price = document.getElementById('pu').value
      newProduct.image = this.imageIn
      newProduct.sass = this.sass
      //console.log('newProduct', newProduct.price)
      const oldCart = JSON.parse(localStorage.getItem('cart')) || []
      //console.log('oldCart', oldCart)
      let check = oldCart.find((element) => element.ref === newProduct.ref)
      // console.log('check', check)
      if (check === undefined) {
        oldCart.push(newProduct)
      }
      // console.log('newProduct', newProduct)
      localStorage.setItem('cart', JSON.stringify(oldCart))
      //localStorage.cart = JSON.stringify(newProduct)
      this.showCart = true
      this.$store.dispatch('cart/updateCount', 1)
      //const lastCtart = store.getters['cart/changecart']
      /* this.cart(Number(lastCart) + 1).then(() => {
      })
        .catch(() => {
          this.$router.replace({
            name: 'error', params: {
              error: 'Un problème serveur est survenu'
            }
          })
        })*/
    },
    showInCart() {
      this.$router.replace({
        name: 'TheCart',
      })
    },
  },
}
</script>

<style lang="scss" scoped>
@import "../assets/sass/libs/variables.scss";
@import "../assets/sass/style.scss";
@import url("../assets/icomoon/categories/style.css");

#container {
  position: relative;
  width: 100%;
  h1 {
    font-size: 6vh;
    font-weight: 600;
    text-align: center;
    line-height: 7vh;
  }
  .col1 {
    img {
      width: 100%;
    }
  }
  .col2 {
    text-align: justify;
    padding-left: 0.7vw;
  }
  .col-des {
    display: block;
    overflow-y: auto;
  }
  button {
    background-color: transparent !important;
    input {
      border: none;
      width: 3vw;
    }
  }
  input:disabled {
    background-color: transparent !important;
    opacity: 1;
  }
  .dropdown-menu {
    margin: 0;
    padding: 0;
    min-width: 3.8vw !important;
    border: 0;
    li:hover {
      color: white;
      background-color: darken($tools, 70%);
    }
  }
  .mt {
    margin-top: 2vh;
  }
  .input-inport {
    background-color: transparent;
    border: none;
  }
}
@media #{$desktop-up} {
  #container {
    height: 83vh;
    padding: 0 2vw;
    font-size: 0.9rem;
    h1 {
      font-size: 4vh;
    }
    .flex-column {
      height: 68vh;
    }
    .image {
      // margin-top: 2vh;
      width: 100%;
      img {
        width: 100%;
      }
    }
    ::-webkit-scrollbar {
      width: 10px;
    }
    ::-webkit-scrollbar-track {
      background: transparent;
    }
    ::-webkit-scrollbar-thumb {
      background-color: transparent;
      border-top: 5vh solid darken($tools, 70%);
    }
    .col1 {
      width: 13vw;
      .quantity {
        width: 12vw;
      }
    }
    .col2 {
      width: 13vw;
      input {
        padding: 0;
      }
      .input-inport {
        padding-bottom: 3rem;
      }
    }
    .col-des {
      width: 13vw;
      height: 45vh;
      padding-left: 5vw;
      //background-color: red;
    }
    button {
      width: 5vw;
    }
    .dropdown-menu {
      min-width: 5.8vw !important;
    }
    .departement-image {
      width: 100%;
      height: 23vh;
      text-align: center;
      overflow: hidden;
      .departement-noimage {
        font-size: 23vh;
        //line-height: 32vh;
      }
    }
    .panier {
      position: absolute;
      left: 0;
      bottom: -0.5vh;
      width: 100%;
      padding: 1vh 0;
      text-align: center;
    }
  }
}
@media #{$mobile-up} {
  #container {
    height: 31.7vh;
    width: 100vw;
    padding: 0 2vw;
    overflow-y: scroll;
    .image {
      margin-left: 5%;
      width: 90%;
      overflow: hidden;
      img {
        width: 100%;
      }
    }
    h1 {
      font-size: 4vh;
      line-height: 4vh;
      margin: 0;
    }
    /*.flex-column {
      height: 30vh;
    }*/
    .col1 {
      width: 40%;
      img {
        width: 100%;
      }
    }
    .col-des {
      display: block;
      width: 60vw;
      height: 25vh;
      overflow-y: auto;
    }
    input {
      //width: 12vw;
      height: 4vh;
    }
    .dropdown-menu {
      height: 20vh;
      min-width: 11vw !important;
      font-size: 0.8rem;
      overflow-y: scroll;
    }
    .mt {
      padding-right: 5vw;
    }
    .departement-image {
      width: 100%;
      height: 20vh;
      text-align: center;
      overflow: hidden;
      .departement-noimage {
        font-size: 20vh;
        line-height: 20vh;
      }
    }
    .panier {
      position: relative;
      left: -5vw;
      bottom: -0.5vh;
      width: 110%;
      padding: 1vh 0;
      text-align: center;
    }
    .description {
      margin-bottom: 3vh;
    }
  }
}
@media #{$mobile-down} {
  #container {
    height: 93vh;
    //overflow-y: auto;
    .image {
      // margin-top: 3vh;
      width: 90%;
      overflow: hidden;
    }
    .description {
      width: 90%;
      height: 60%;
      font-size: 2.5vw;
      overflow-y: auto;
    }
    .col1 {
      width: 24vw;
      font-size: 2.5vw;
      padding-left: 1.5vw;
    }
    .col2 {
       width: 15vw;
       input {
         padding: .15rem 0 0 0;
       }
       .input-inport {
         padding-bottom: 3rem;
       }
     }
    .col-des {
      width: 15vw;
      height: 37.5vh;
    }
   /*input {
      width: 6vw;
      height: 6vh;
      font-size: 2.5vw;
    }*/
    .dropdown-menu {
      min-width: 2.8vw !important;
      font-size: 2.5vw;
    }
    .mt {
      margin-top: 2vh;
      padding-left: 1.5vw;
      font-size: 2.5vw;
    }
    .input-measure {
      width: 30vw;
    }
    .departement-image {
      width: 100%;
      height: 31vh;
      text-align: center;
      overflow: hidden;
      .departement-noimage {
        font-size: 30vh;
        line-height: 32vh;
      }
    }
    .panier {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      padding: 1vh 0;
      text-align: center;
    }
  }
}
</style>
