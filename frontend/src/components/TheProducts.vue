/* eslint-disable vue/attribute-hyphenation */
<template>
  <section>
    <div id="header">
      <nav class="row text-light" :class="`bg-${familySass}--darken`">
        <div class="col-6 btn-group pe-0">
          <button
            type="button"
            class="btn text-end text-light pe-0"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <h2 class="fw-bold">&#x25C0; {{ family }}</h2>
          </button>
          <ul
            class="dropdown-menu dropdown-menu--left"
            :class="`dropdown-${familySass}`"
          >
            <li
              v-for="dep in departements"
              :key="dep.family_description"
              :class="`hover-${familySass} mt-1`"
            >
              <router-link
                v-if="dep.family_description != family"
                :to="{
                  name: 'TheProducts',
                  params: {
                    linkType: `${dep.family_id}__products`,
                  },
                }"
                class="fw-bold text-light"
                :aria-label="`${dep.family_description}`"
              >
                <h3 class="fw-bold">
                  {{ dep.family_description }}
                </h3>
              </router-link>
            </li>
          </ul>
        </div>
        <div class="col-6 btn-group ps-0">
          <button
            type="button"
            class="btn text-start text-light h2-landscape ps-1"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <h2 class="fw-bold">{{ category }} &#x25BA;</h2>
          </button>
          <ul
            class="dropdown-menu dropdown-menu--right"
            :class="`dropdown-${familySass}`"
          >
            <li v-for="dep in departements" :key="dep.family_description">
              <div v-if="dep.family_description === family" class="pt-1">
                <div
                  v-for="cat in dep.categories"
                  :key="cat.category_id"
                  class=""
                >
                  <router-link
                    v-if="
                      cat.category_description != category &&
                      cat.category_products === 'true'
                    "
                    :to="{
                      name: 'TheProducts',
                      params: {
                        linkType: `${dep.family_id}_${cat.category_id}_products`,
                      },
                    }"
                    class="fw-bold text-light"
                    :aria-label="`${cat.category_description}`"
                  >
                    <h3 :class="`hover-${familySass} ps-1 mb-2`">
                      {{ cat.category_description }}
                    </h3>
                  </router-link>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      <div class="articles">
        <div class="row">
          <div v-if="catOneItems && catOne">
            <div class="row">
              <h3
                class="col-12 text-light fw-bolder ps-3"
                :class="`bg-${familySass}`"
              >
                {{ catOne.family_category }}
              </h3>
            </div>
            <div v-for="(item, index) in catOne.products" :key="index">
              <div v-if="index >= firstItem && index < lastItem">
                <div class="d-flex">
                  <div :id="`${item.idStock}`" class="fw-bold ps-1 li-item">
                    <span
                      v-if="item.varieties === ''"
                      class="cursor"
                      @click="toArticle(item.idStock)"
                      >{{ item.name }}</span
                    >
                    <span v-else>{{ item.name }}</span>
                  </div>
                  <div v-if="item.varieties" class="d-flex flex-row">
                    <div v-for="(variety, v) in item.varieties" :key="v">
                      <div
                        :id="`${variety.idStock}`"
                        class="ps-3 cursor"
                        @click="toArticle(variety.idStock)"
                      >
                        {{ variety.variety }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div v-if="catTwooItems && catTwoo" class="mb-1">
            <div class="row">
              <h3
                class="col-12 text-light fw-bolder ps-3"
                :class="`bg-${familySass}`"
              >
                {{ catTwoo.family_category }}
              </h3>
            </div>
            <div v-for="(item, index) in catTwoo.products" :key="index">
              <div v-if="index >= firstItemTwoo && index < lastItem">
                <div class="d-flex">
                  <div :id="`${item.idStock}`" class="fw-bold ps-1 li-item">
                    <span
                      v-if="item.varieties === ''"
                      class="cursor"
                      @click="toArticle(item.idStock)"
                      >{{ item.name }}</span
                    >
                    <span v-else>{{ item.name }}</span>
                  </div>
                  <div v-if="item.varieties" class="d-flex flex-row">
                    <div v-for="(variety, v) in item.varieties" :key="v">
                      <div
                        :id="`${variety.idStock}`"
                        class="ps-3 cursor"
                        @click="toArticle(variety.idStock)"
                      >
                        {{ variety.variety }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div v-if="catThreeItems && catThree">
            <div class="row">
              <h3
                class="col-12 text-light fw-bolder ps-3"
                :class="`bg-${familySass}`"
              >
                {{ catThree.family_category }}
              </h3>
            </div>
            <div v-for="(item, index) in catThree.products" :key="index">
              <div v-if="index >= firstItemThree">
                <div class="d-flex">
                  <div :id="`${item.idStock}`" class="fw-bold ps-1 li-item">
                    <span
                      v-if="item.varieties === ''"
                      class="cursor"
                      @click="toArticle(item.idStock)"
                      >{{ item.name }}</span
                    >
                    <span v-else>{{ item.name }}</span>
                  </div>
                  <div v-if="item.varieties" class="d-flex flex-row">
                    <div v-for="(variety, v) in item.varieties" :key="v">
                      <div
                        :id="`${variety.idStock}`"
                        class="ps-3 cursor"
                        @click="toArticle(variety.idStock)"
                      >
                        {{ variety.variety }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div>
        <div id="pagination">
          <Pagination
            v-if="totalrecords > visibleItemsPerPageCount"
            :totalrecords="totalrecords"
            :current-page="currentPage"
            :page-count="pageCount"
            :visible-items="visibleItemsPerPageCount"
            @next-page="pageChangeHandle('next')"
            @previous-page="pageChangeHandle('previous')"
            @load-page="pageChangeHandle"
          />
        </div>
      </div>
    </div>
    <div id="infos" :class="`bg-${familySass}`">
      <div class="icon">
        <span
          class="text-center"
          :class="`icon-${family
            .replace(/\s|_|\(|\)/g, '-')
            .normalize('NFD')
            .replace(/\p{Diacritic}/gu, '')
            .toLowerCase()} text-${familySass}--darken`"
        ></span>
      </div>
      <div class="text-light text-infos">
        <div class="product">
          <Product
            :product="idProduct"
            :family="idFamily"
            :category="idCategory"
            :sass="familySass"
          />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import StockService from '@/services/stock-service.js'
import Product from './TheArticle.vue'
import Pagination from './ThePagination.vue'
import { mapGetters } from 'vuex'

export default {
  name: 'TheProducts',
  components: {
    Pagination,
    Product,
  },
  data() {
    return {
      departements: [],
      departementssave: [],
      families: [],
      family: '',
      familySass: '',
      categories: [],
      category: '',
      cat_prod: '',
      catOne: '',
      catTwoo: '',
      catThree: '',
      items: [],
      allItems: [],
      itemsOne: [],
      itemsTwoo: [],
      itemsThree: [],
      pageCount: 0,
      currentPage: 1,
      totalrecords: 0,
      visibleItemsPerPageCount: 0,
      firstItem: 0,
      lastItem: 0,
      firstItemOne: '',
      firstItemTwoo: '',
      lastItemTwoo: 0,
      firstItemThree: '',
      lastItemThree: 0,
      catOneItems: true,
      catTwooItems: false,
      catTnreeItems: false,
      slices: [],
      mobile: false,
      mobileNav: false,
      windowWidth: null,
      orientation: false,
      idFamily: '',
      idCategory: '',
      idProduct: '',
    }
  },
  computed: {
    ...mapGetters({
      management: 'auth/management',
    }),
  },
  watch: {
    //Si on est sur la page et on change de famille ou catégorie
    $route(to) {
      if (to.params.linkType) {
      //  console.log('to.params.linkType', to.params.linkType)
        this.totalrecords = 0
        // this.pageCount = 1
        this.currentPage = 1
        this.firstItem = 0
        //this.lastItem = 0

        //  this.cat_prod = ''
        this.catOne = []
        this.catTwoo = []
        this.catThree = []
        const productType = to.params.linkType
        // console.log('productType', productType)
        //Changement de famille ou de catégorie
        const splitProductType = productType.split('_')
        const familyId = Number(splitProductType[0])
        // const splitProductTypeLength = splitProductType.length
        // console.log('this.departements', this.departements)
        this.idFamily = splitProductType[0]
        this.idCategory = splitProductType[1]
        this.idProduct = splitProductType[2]
        // console.log('this.idFamily', this.idFamily)
        //console.log('this.idCategory', this.idCategory)

        for (let i = 0; i < this.departements.length; i++) {
          //  console.log('desc', this.departements[i].family_id)
          if (this.departements[i].family_id === familyId) {
            this.family = this.departements[i].family_description
            this.familySass = this.departements[i].family_sass
            this.categories = this.departements[i].categories
            // if (splitProductTypeLength > 2) {
            if (splitProductType[1]) {
              // console.log('this.departements[i].family_id', this.departements[i].family_id, 'splitProductType', Number(splitProductType[1]))
              this.showArticles(
                `${this.departements[i].family_id}_${Number(
                  splitProductType[1]
                )}`
              )
              if (splitProductType[2] != 'products') {
                // console.log('splitProductType[2]', splitProductType[2])
                this.idProduct = splitProductType[2]
              }
            } else {
              this.showArticles(this.departements[i].family_id)
              this.category = ''
              // console.log('this.category', this.category)
            }
          }
        }
      }
    },
    management(newManagement, oldManagent) {
      //console.log(newManagement)
      if (newManagement != 'Customer') {
        this.$router.replace({
          name: 'home',
        })
      }
    },
  },
  mounted() {
    StockService.listCurrentDepartements().then((response) => {
      // console.log(response)
      this.departements = response
      // console.log('departements', this.departements)
      if (this.$route.params.linkType) {
        const productType = this.$route.params.linkType
        //console.log('productType', productType)
        const splitProductType = productType.split('_')
        const familyId = Number(splitProductType[0])
        const splitProductTypeLength = splitProductType.length
        //console.log('ProductTypeLength', splitProductTypeLength)
        for (let i = 0; i < this.departements.length; i++) {
          //  console.log('desc', this.departements[i].family_id)
          if (this.departements[i].family_id === familyId) {
            this.family = this.departements[i].family_description
            this.familySass = this.departements[i].family_sass
            this.categories = this.departements[i].categories
            // if (splitProductTypeLength > 2) {
            if (splitProductType[1]) {
              // console.log('this.departements[i].family_id', this.departements[i].family_id, 'splitProductType', Number(splitProductType[1]))
              this.showArticles(
                `${this.departements[i].family_id}_${Number(
                  splitProductType[1]
                )}`
              )
              if (splitProductType[2] != 'products') {
                // console.log('splitProductType[2]', splitProductType[2])
                this.idProduct = splitProductType[2]
              }
            } else {
              this.showArticles(this.departements[i].family_id)
            }
          }
        }
      }
    })
  },
  created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
    if (this.$route.params.linkType) {
      const productType = this.$route.params.linkType
      //  console.log('productType', productType)
      const split = productType.split('_')
      this.idFamily = split[0]
      this.idCategory = split[1]
      this.idProduct = split[2]
    }
  },
  methods: {
    toArticle(value) {
      // console.log('value', value)
      this.idProduct = value
    },
    showArticles(value) {
      //console.log('value4', value)
      StockService.listWeekArticles(value).then((response) => {
        //console.log('response', response)
        // console.log('response.length', response.length)
        if (response.length > 1) {
          //C'est une famille
          //console.log('response', response[0])
          //console.log('response', response)
          let catOneProducts = 0
          let catTwooProducts = 0
          let catThreeProducts = 0
          if (response[0]) {
            this.catOne = response[0]
            catOneProducts = response[0].products.length
          } else {
            this.catOne = 0
            catOneProducts = 0
          }
          if (response[1]) {
            this.catTwoo = response[1]
            catTwooProducts = response[1].products.length
          } else {
            this.catTwoo = 0
            catTwooProducts = 0
          }
          if (response[2]) {
            this.catThree = response[2]
            catThreeProducts = response[2].products.length
          } else {
            this.catThree = 0
            catThreeProducts = 0
          }
          this.totalrecords =
            catOneProducts + catTwooProducts + catThreeProducts
          //console.log('this.totalrecords', this.totalrecords)
          // console.log('this.catOne', this.catOne)
          //console.log('this.catOne.products', this.catOne.products)
          //console.log('this.catTwoo.products', this.catTwoo.products)
          //  console.log('this.visibleItemsPerPageCount', this.visibleItemsPerPageCount)
          if (this.catOne.products.length < this.visibleItemsPerPageCount) {
            this.catOne = response[0]
            this.catOneItems = true
            this.catTwoo = response[1]
            this.catTwooItems = true
            if (
              this.catOne.products.length + this.catTwoo.products.length <
              this.visibleItemsPerPageCount
            ) {
              this.firstItemTwoo = 0
              this.firstItemThree = 0
              this.catThree = response[2]
              this.catThreeItems = true
            } else if (
              this.catOne.products.length +
                this.catTwoo.products.length +
                this.catThree.products.length <
              this.visibleItemsPerPageCount
            ) {
            }
          } else {
            this.catOneItems = true
            this.catTwooItems = false
            this.catThreeItems = false
          }
        } else {
          // console.log('response', response)
          this.category = response[0].category_description
          this.catOneItems = true
          this.catTwooItems = false
          this.catThreeItems = false
          this.catOne = response[0]
          this.catTwoo = []
          this.catThree = []
          //  console.log('this.catOne', this.catOne)
          this.totalrecords = this.catOne.products.length
          //console.log('this.totalrecords', this.totalrecords)
          // console.log('this.visibleItemsPerPageCount', this.visibleItemsPerPageCount)
          //console.log('this.pageCount', this.pageCount)
        }
        this.pageCount = Math.ceil(
          this.totalrecords / this.visibleItemsPerPageCount
        )
        this.lastItem = this.visibleItemsPerPageCount
        this.departementsSave = response
        // console.log('this.departementsSave', this.departementsSave)
      })
    },
    pageChangeHandle(value) {
      //  console.log('value', value)
      const catOneLenght = this.departementsSave[0].products.length
      //console.log('this.departementsSave.length', this.departementsSave.length)
      this.currentPage = Number(this.currentPage)
      switch (value) {
      case 'next':
        this.currentPage += 1
        break
      case 'previous':
        this.currentPage -= 1
        break
      default:
        this.currentPage = Number(value)
      }
      this.lastItem = this.visibleItemsPerPageCount * this.currentPage
      //console.log('this.lastItem', this.lastItem)
      if (this.currentPage != 1) {
        const pageCurrent =
          (this.currentPage - 1) * (this.visibleItemsPerPageCount - 1) +
          (this.currentPage - 1)
        this.firstItem = pageCurrent
        if (catOneLenght > this.lastItem) {
          this.catOneItems = true
          this.catTwooItems = false
          this.catThreeItems = false
        } else {
          this.firstItemOne =
            (parseInt(catOneLenght / this.visibleItemsPerPageCount, 10) + 1) *
            this.visibleItemsPerPageCount
          //Sinon CatOne (29) est inférieur à lastItem (30)
          if (
            this.visibleItemsPerPageCount - (this.lastItem - catOneLenght) <
            0
          ) {
            //Si le nombre de lignes disponib!e est inférieur à 7
            //  console.log('ici')
            this.catOneItems = false
            this.catTwooItems = true
            this.firstItemTwoo = this.firstItem - this.firstItemOne
            this.lastItemTwoo =
              this.firstItemTwoo + this.visibleItemsPerPageCount
            const catTwooLenght = this.departementsSave[1].products.length
            if (this.catTwooItems < this.lastItemTwoo) {
              this.catThreeItems = true
              if (
                this.visibleItemsPerPageCount -
                  (this.lastItemTwoo - catTwooLenght) >
                3
              ) {
                this.catTwooItems = true
                this.firstItemThree =
                  this.firstItem - this.firstItemOne - this.firstItemTwoo
              } else {
                this.catTwooItems = false
                this.firstItemThree =
                  this.firstItem -
                  this.firstItemOne -
                  this.firstItemTwoo +
                  (this.lastItemTwoo - catTwooLenght) -
                  this.visibleItemsPerPageCount
              }
            } else {
              this.catThreeItems = false
            }
          } else if (
            this.visibleItemsPerPageCount - (this.lastItem - catOneLenght) ==
            this.visibleItemsPerPageCount
          ) {
            this.catOneItems = true
            this.catTwooItems = false
            this.catThreeItems = false
          } else {
            if (
              this.visibleItemsPerPageCount - (this.lastItem - catOneLenght) >
              0
            ) {
              this.catOneItems = true
              this.catTwooItems = false
              this.catThreeItems = false
            } else {
              this.catOneItems = false
              this.catTwooItems = true
              this.catThreeItems = true
            }
          }
        }
      } else {
        this.firstItem = 0
        // console.log('catOneLenght', catOneLenght)
        // console.log('catTwooLenght', catTwooLenght)
        if (catOneLenght > this.lastItem) {
          this.catOneItems = true
          this.catTwooItems = false
          this.catThreeItems = false
        } else {
          if (catOneLenght + catTwooLenght > this.lastItem) {
            this.catOneItems = true
            this.catTwooItems = true
            this.catThreeItems = false
          } else {
            this.catOneItems = true
            this.catTwooItems = true
            this.catThreeItems = true
          }
        }
      }
    },
    computedItems(payload) {
      // console.log(payload)
      this.page = payload.page
      this.perPage = payload.perPage
      this.lastItem = this.perPage * this.page
      if (this.page != 1) {
        this.firstItem = (this.page - 1) * (this.perPage - 1) + (this.page - 1)
      } else {
        this.firstItem = 0
      }
      //console.log('this.page', this.page, 'this.perPage', this.perPage)
      const slice = this.items.slice(this.firstItem, this.lastItem)
      this.slices = this.items.slice(this.firstItem, this.lastItem)
      //console.log('firstItem', this.firstItem, 'lastItem', this.lastItem)
      //console.log('slice', slice)
    },
    toggleMobileNav() {
      this.mobileNav = !this.mobileNav
    },
    checkScreen() {
      // console.log('this.catOne', this.catOne)
      //console.log('this.allItems', this.allItems)
      this.windowWidth = window.innerWidth
      if (this.windowWidth <= 768) {
        let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
        if (screenOrientation === 'portrait-primary') {
          //console.log('screenOrientation1', screenOrientation)
          //console.log('this.allItems', this.allItems)
          if (!this.catOne) {
            //Affichage d'une catégorie
            this.orientation = true
            this.mobile = true
            this.visibleItemsPerPageCount = 10
            this.currentPage = 1
            this.items.length = 0
            for (let i = 0; i < this.visibleItemsPerPageCount; i++) {
              this.items.push(this.allItems[i])
            }
            //console.log('this.items', this.items)
            return
          } else {
            //Affichage d'une famille
            //console.log('this.catOne', this.catOne)
            this.orientation = true
            this.mobile = true
            this.visibleItemsPerPageCount = 10
            this.currentPage = 1
            const itemsOne = []
            const itemsTwoo = []
            const itemsThree = []
            this.itemsOne.length = 0
            this.itemsTwoo.length = 0
            this.itemsThree.length = 0
            //console.log('this.allItems', this.allItems)
            for (let i = 0; i < this.allItems.length; i++) {
              if (this.catOne.cat === this.allItems[i].cat_prod) {
                itemsOne.push(this.allItems[i])
              }
            }
            if (itemsOne.length >= this.visibleItemsPerPageCount) {
              for (let i = 0; i < this.visibleItemsPerPageCount; i++) {
                this.itemsOne.push(itemsOne[i])
              }
            } else {
              for (let i = 0; i < itemsOne.length; i++) {
                this.itemsOne.push(itemsOne[i])
              }
              //console.log('this.itemsOne', this.itemsOne)
              if (this.catTwoo) {
                for (let i = 0; i < this.allItems.length; i++) {
                  if (this.catTwoo.cat === this.allItems[i].cat_prod) {
                    itemsTwoo.push(this.allItems[i])
                  }
                }
                //console.log('this.itemsTwoo', this.itemsTwoo)
                const differenceTwoo =
                  this.visibleItemsPerPageCount - this.itemsOne.length
                if (itemsTwoo.length >= differenceTwoo) {
                  for (let i = 0; i < differenceTwoo; i++) {
                    this.itemsTwoo.push(itemsTwoo[i])
                  }
                  //console.log('this.itemsTwoo', this.itemsTwoo)
                } else {
                  for (let i = 0; i < itemsTwoo.length; i++) {
                    this.itemsTwoo.push(itemsTwoo[i])
                  }
                  //console.log('this.itemsTwoo', this.itemsTwoo)
                  if (this.catThree) {
                    for (let i = 0; i < this.allItems.length; i++) {
                      if (this.catThree.cat === this.allItems[i].cat_prod) {
                        itemsThree.push(this.allItems[i])
                      }
                    }
                    const differenceThree =
                      this.visibleItemsPerPageCount -
                      (this.itemsOne.length + this.itemsTwoo.length)
                    if (itemsThree.length >= differenceThree) {
                      for (let i = 0; i < differenceThree; i++) {
                        this.itemsThree.push(itemsThree[i])
                      }
                    } else {
                      for (let i = 0; i < itemsThree.length; i++) {
                        this.itemsThree.push(itemsThree[i])
                      }
                      this.visibleItemsPerPageCount =
                        this.itemsOne.length +
                        this.itemsTwoo.length +
                        this.itemsThree.length
                    }
                  } else {
                    this.visibleItemsPerPageCount =
                      this.itemsOne.length + this.itemsTwoo.length
                    //console.log('this.visibleItemsPerPageCount', this.visibleItemsPerPageCount)
                  }
                }
              } else {
                this.visibleItemsPerPageCount = this.itemsOne.length
              }
            }
            // console.log('this.itemsOne', this.itemsOne)
            //console.log('this.itemsTwoo', this.itemsTwoo)
            return
          }
        } else {
          //Mobile landscape
          //console.log('this.allItems', this.allItems)
          //console.log('this.catOne', this.catOne)
          //console.log('screenOrientation2', screenOrientation)
          if (!this.catOne) {
            //Affichage d'une catégorie
            this.orientation = false
            this.mobile = true
            this.visibleItemsPerPageCount = 10
            this.currentPage = 1
            this.items.length = 0
            for (let i = 0; i < this.visibleItemsPerPageCount; i++) {
              this.items.push(this.allItems[i])
            }
            //console.log('this.items', this.items)
            return
          } else {
            //Affichage d'une famille
            //console.log('this.catOne', this.catOne)
            this.orientation = true
            this.mobile = true
            this.visibleItemsPerPageCount = 10
            this.currentPage = 1
            const itemsOne = []
            const itemsTwoo = []
            const itemsThree = []
            this.itemsOne.length = 0
            this.itemsTwoo.length = 0
            this.itemsThree.length = 0
            //console.log('this.allItems2', this.allItems)
            for (let i = 0; i < this.allItems.length; i++) {
              if (this.catOne.cat === this.allItems[i].cat_prod) {
                itemsOne.push(this.allItems[i])
              }
            }
            if (itemsOne.length >= this.visibleItemsPerPageCount) {
              for (let i = 0; i < this.visibleItemsPerPageCount; i++) {
                this.itemsOne.push(itemsOne[i])
              }
            } else {
              for (let i = 0; i < itemsOne.length; i++) {
                this.itemsOne.push(itemsOne[i])
              }
              if (this.catTwoo) {
                for (let i = 0; i < this.allItems.length; i++) {
                  if (this.catTwoo.cat === this.allItems[i].cat_prod) {
                    itemsTwoo.push(this.allItems[i])
                  }
                }
                //console.log('this.itemsTwoo', this.itemsTwoo)
                const differenceTwoo =
                  this.visibleItemsPerPageCount - this.itemsOne.length
                if (itemsTwoo.length >= differenceTwoo) {
                  for (let i = 0; i < differenceTwoo; i++) {
                    this.itemsTwoo.push(itemsTwoo[i])
                  }
                  //console.log('this.itemsTwoo', this.itemsTwoo)
                } else {
                  for (let i = 0; i < itemsTwoo.length; i++) {
                    this.itemsTwoo.push(itemsTwoo[i])
                  }
                  if (this.catThree) {
                    for (let i = 0; i < this.allItems.length; i++) {
                      if (this.catThree.cat === this.allItems[i].cat_prod) {
                        itemsThree.push(this.allItems[i])
                      }
                    }
                    const differenceThree =
                      this.visibleItemsPerPageCount -
                      (this.itemsOne.length + this.itemsTwoo.length)
                    if (itemsThree.length >= differenceThree) {
                      for (let i = 0; i < differenceThree; i++) {
                        this.itemsThree.push(itemsThree[i])
                      }
                    } else {
                      for (let i = 0; i < itemsThree.length; i++) {
                        this.itemsThree.push(itemsThree[i])
                      }
                      this.visibleItemsPerPageCount =
                        this.itemsOne.length +
                        this.itemsTwoo.length +
                        this.itemsThree.length
                    }
                  } else {
                    this.visibleItemsPerPageCount =
                      this.itemsOne.length + this.itemsTwoo.length
                  }
                }
              } else {
                this.visibleItemsPerPageCount = this.itemsOne.length
              }
            }
            // console.log('this.itemsOne', this.itemsOne)
            //console.log('this.itemsTwoo', this.itemsTwoo)
            return
          }
        }
      }
      this.orientation = false
      this.mobile = false
      this.mobileNav = false
      this.visibleItemsPerPageCount = 15
      return
    },
  },
}
</script>

<style lang="scss" scoped>
@import "../assets/sass/libs/variables.scss";

section {
  position: relative;
  overflow: hidden;
  .articles {
    position: relative;
    height: 67.2vh;
    overflow: hidden;
  }
  .page-link {
    font-size: 2vh;
    color: darken($tools, 65%);
  }
  .page-link:hover {
    background-color: $tools;
    box-shadow: none;
    outline: none;
  }
  .page-link:focus {
    background-color: $tools;
    box-shadow: none;
    outline: none;
  }
}
.btn-secondary {
  background-color: transparent;
  border: none;
}
h2 {
  display: inline;
}
#categories {
  margin-left: 0.5rem;
}
.hover-leg,
.hover-fruit,
.hover-prod {
  margin-left: 0.5rem;
  padding: 0;
}
.dropdown-leg {
  background-color: rgba(7, 109, 49, 0.8);
}
.dropdown-fruit {
  background-color: rgba(255, 127, 0, 0.8);
}
.dropdown-prod {
  background-color: rgba(104, 45, 134, 0.8);
}
.hover-leg:hover {
  background-color: rgba(0, 184, 0, 0.6);
}
.hover-fruit:hover {
  background-color: rgba(255, 187, 51, 0.6);
}
.hover-prod:hover {
  background-color: rgba(170, 102, 204, 0.6);
}
.icon {
  position: absolute;
}
.text-infos {
  position: relative;
}

//Pour desktop
@media #{$desktop-up} {
  section {
    top: 0;
    height: 89.5vh;
    display: flex;
    display: -webkit-flex; /* Safari */
    flex-direction: row;
  }
  div#header {
    order: 1;
    height: 5vh;
    width: 70%;
    z-index: 10;
  }
  .articles {
    height: 70.3vh !important;
  }
  .icon {
    text-align: center;
  }
  .icon-legumes {
    font-size: 83vh;
    margin-left: 4.5vw;
  }
  .icon-fruits {
    font-size: 61.5vh;
    line-height: 85vh;
  }
  .icon-produits {
    font-size: 45vh;
    line-height: 105vh;
  }
  h2 {
    font-size: 4vh;
  }
  .dropdown-menu--left {
    top: -2vh !important;
    left: 22.5vw !important;
    padding: 0 0.5rem 0 0;
    text-align: right;
    color: white;
    border-radius: 0;
    li {
      margin-bottom: 0.5rem;
    }
  }
  .dropdown-menu--right {
    top: -2vh !important;
    left: -0.5vw !important;
    padding: 0 0.5rem 0 0;
    color: white;
    border-radius: 0;
    li {
      margin-bottom: 0.5rem;
    }
  }
  h3 {
    font-size: 1rem;
    margin: 0;
  }
  div#infos {
    order: 2;
    width: 30%;
    z-index: 11;
  }
  .text-infos {
    height: 89%;
    .product {
      height: 95%;
    }
  }
  .text-break {
    padding: 2vh 2vw 0 2vw;
    text-align: justify;
    word-break: normal !important;
    -webkit-hyphens: auto;
    -moz-hyphens: auto;
    -ms-hyphens: auto;
    -o-hyphens: auto;
    hyphens: auto;
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  section {
    top: 5vh;
    display: flex;
    display: -webkit-flex; /* Safari */
    flex-direction: column;
  }
  section > #header {
    width: 100vw;
    order: 1;
    .btn-group {
      height: 5vh;
      button {
        line-height: 2.5vh;
        //margin-top: -2.5vh;
      }
    }
  }
  .articles {
    height: 44vh !important;
  }
  #pagination {
    height: 6vh;
  }
  section > #infos {
    order: 2;
    height: 44vh !important;
  }
  .icon {
    width: 100vw;
    //margin-top: 1.9vh;
    text-align: center;
  }
  .icon-legumes {
    font-size: 32vh;
  }
  .icon-fruits {
    font-size: 31.5vh;
  }
  .icon-produits {
    font-size: 31.5vh;
  }
  h2 {

    font-size: 2.8vh;
  }
  .dropdown-menu--left {
    top: -0.5vh !important;
    padding: 0 0.5rem 0 0;
    text-align: right;
    font-size: 1rem;
    border-radius: 0;
    li {
      margin-bottom: 0.5rem;
    }
  }
  .dropdown-menu--right {
    top: -0.5vh !important;
    left: 7vw !important;
    padding: 0 0.5rem 0 0;
    border-radius: 0;
    li {
      margin-bottom: 0.5rem;
    }
  }
  h3 {
    font-size: 0.7rem;
    margin: 0;
  }
  .product--title {
    height: 30vh;
  }
  #families {
    margin-right: 4vw;
    a {
      padding: 0 4vw 0.2vh 0;
    }
  }
  #categories {
    margin-left: -3vw;
    a {
      padding: 0 0 0.2vh 5vw;
    }
  }
  #infos {
    z-index: 99;
  }
  .hover-leg {
    background-color: rgba(0, 184, 0, 1);
  }
  .hover-fruit {
    background-color: rgba(255, 187, 51, 1);
  }
  .hover-prod {
    background-color: rgba(170, 102, 204, 1);
    width: 100%;
  }
  .text-infos {
    height: 75%;
    .product {
      height: 66%;
    }
    .legend {
      height: 25%;
      font-size: 12px;
    }
  }
  .text-break {
    padding: 2vh 7vw 0 7vw;
    column-count: 2;
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  section {
    position: relative;
    left: 5vw;
    height: 100%;
    display: flex;
    display: -webkit-flex; /* Safari */
    flex-direction: row;
    #pagination {
      margin-top: 1vh;
    }
  }
  div#header {
    order: 1;
    width: 55%;
  }
  .articles {
    height: 70vh !important;
  }
  div#infos {
    order: 2;
    width: 50%;
    .icon {
      position: relative;
      top: 0;
      height: 70vh;
      text-align: center;
    }
  }
  .text-infos {
    top: -70vh;
    height: 95%;
    .product {
      height: 90%;
    }
    .legend {
      height: 20%;
      font-size: 12px;
    }
  }
  .icon-produits {
    display: inline-block;
    position: absolute;
    bottom: -10vh;
    left: 0;
    font-size: 52vh;
  }
  .icon-legumes {
    font-size: 92.5vh;
  }
  .icon-fruits {
    margin: -3.8vh 0 0 -2vw;
    font-size: 70vh;
    line-height: 100vh;
    display: inline-block;
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg);
    /* Firefox */
    -moz-transform: rotate(-45deg);
    /* Opera */
    -o-transform: rotate(-45deg);
  }
  h2 {
    font-size: 4.3vh;
  }
  .h2-landscape {
    padding: 0 !important;
  }
  .dropdown-menu {
    padding: 0 !important;
    margin: 0 !important;
  }
  .dropdown-menu--left {
    top: -0.7vh !important;
    left: 0 !important;
    padding: 0 0.5rem 0 0;
    text-align: right;
    font-size: 1rem;
    color: white;
    border-radius: 0;
    min-width: 27vw;
    li {
      padding-right: 0.5vw;
      margin-bottom: 0.5rem;
    }
  }
  .dropdown-menu--right {
    top: -0.7vh !important;
    left: -1.6vw !important;
    padding: 0 0.5rem 0 0;
    color: white;
    border-radius: 0;
    min-width: 27vw;
  }
  h3 {
    font-size: 0.7rem;
    margin: 0;
  }
  #families {
    margin-left: 1vw;
    a {
      padding: 0 1vw 0.2vh 0;
      text-align: right;
    }
  }
  #categories {
    margin-left: -1vw;
    a {
      padding: 0 0 0.2vh 1.5vw;
    }
  }
  .hover-leg {
    background-color: rgba(0, 184, 0, 0.6);
  }
  .hover-fruit {
    background-color: rgba(255, 187, 51, 0.6);
  }
  .hover-prod {
    background-color: rgba(170, 102, 204, 0.6);
    width: 85%;
  }
  .text-break {
    padding: 4.5vh 5vw 0 5vw;
    text-align: justify;
    word-break: normal !important;
    -webkit-hyphens: auto;
    -moz-hyphens: auto;
    -ms-hyphens: auto;
    -o-hyphens: auto;
    hyphens: auto;
  }
}
</style>