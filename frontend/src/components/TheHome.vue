<template>
  <!-- Desktop et mobile landscape -->
  <!--<section
    v-if="!orientation"
    class="section-landscape notselectable d-flex flex-wrap"
  >-->
  <section
    class="section-landscape notselectable d-flex flex-wrap"
   >
    <div v-for="dep in departements" :key="dep.family_description" class="w50">
      <div
        v-if="dep.family_description != 'Tools'"
        class="w100 d-flex flex-column align-items-start"
       >
        <router-link
          :to="{
            name: 'TheProducts',
            params: {
              linkType: `${dep.family_id}__products`,
            },
          }"
          class=""
          :title="`${dep.family_description}`"
          :aria-label="`${dep.family_description}`"
        >
          <div class="bg-icon" :class="`bg-${dep.family_sass} flex-fill`">
            <span
              :class="`icon-${dep.family_description
                .replace(/\s|_|\(|\)/g, '-')
                .normalize('NFD')
                .replace(/\p{Diacritic}/gu, '')
                .toLowerCase()} icon text-${dep.family_sass}--darken`"
            ></span>
          </div>
          <div
            class="family fw-bold"
            :class="`bg-${dep.family_sass}--darken text-${dep.family_sass}`"
          >
            <span v-if="dep.family_description != 'Légumes'" class="family-font"
              >{{ dep.family_description }}{{ dep.family_description
              }}{{ dep.family_description }}{{ dep.family_description
              }}{{ dep.family_description }}</span
            >
            <span v-else class="family-leg"
              >{{ dep.family_description }}{{ dep.family_description
              }}{{ dep.family_description }}{{ dep.family_description
              }}{{ dep.family_description }}</span
            >
          </div>
        </router-link>
        <!--<div class="d-flex flex-column">
              <router-link
                :to="{
                  name: 'TheProducts',
                  params: {
                    linkType: `${dep.family_id}__products`,
                  },
                }"
                :class="`bg-${dep.family_sass} flex-fill bg-icon`"
                :title="`${dep.family_description}`"
                :aria-label="`${dep.family_description}`"
              >
                <span
                  :class="`icon-${dep.family_description
                    .replace(/\s|_|\(|\)/g, '-')
                    .normalize('NFD')
                    .replace(/\p{Diacritic}/gu, '')
                    .toLowerCase()} icon text-${dep.family_sass}--darken`"
                ></span>
              </router-link>
              <div :class="`flex-fill family bg-${dep.family_sass}--darken`">
                <div class="row">
                  <router-link
                    :to="{
                      name: 'TheProducts',
                      params: {
                        linkType: `${dep.family_id}__products`,
                      },
                    }"
                    class=""
                    :class="`text-${dep.family_sass}`"
                  >
                    <div class="fw-bold" :class="`family-${dep.family_sass}`">
                      {{ dep.family_description }}{{ dep.family_description
                      }}{{ dep.family_description }}{{ dep.family_description
                      }}{{ dep.family_description }}
                    </div>
                  </router-link>
                </div>
              </div>
            </div>-->
      </div>
      <div v-else>
        <div id="tools--background" class="w50">
          <font-awesome-icon
            :icon="['fas', 'gear']"
            class="text-tools btn-tools"
            aria-label="Outils"
            title="Outils"
          />
        </div>
        <div id="tools--icons">
        <div class="d-flex justify-content-around">
            <router-link
              :to="{
                name: 'TheError',
                params: {
                  linkType: 'InConstruction',
                },
              }"
            >
              <font-awesome-icon
                :icon="['fas', 'map-marker-alt']"
                class="text-tools--darken btn-tools"
                aria-label="Nos points de vente"
                title="Nos points de vente"
              />
            </router-link>
            <router-link
              :to="{
                name: 'TheError',
                params: {
                  linkType: 'InConstruction',
                },
              }"
            >
              <font-awesome-icon
                :icon="['fas', 'tag']"
                class="text-tools--darken btn-tools"
                aria-label="En promotion"
                title="En promotion"
              />
            </router-link>
          </div>
          <div class="d-flex justify-content-around">
            <router-link
              v-if="authenticated"
              :to="{
                name: 'TheError',
                params: {
                  linkType: 'InConstruction',
                },
              }"
            >
              <font-awesome-icon
                :icon="['fas', 'address-card']"
                class="text-tools--darken btn-tools"
                aria-label="Carte de fidélité"
                title="Carte de fidélité"
              />
            </router-link>

            <a
              href="https://fr-fr.facebook.com/"
              target="_blank"
              title="Consulter notre page Facebook"
            >
              <font-awesome-icon
                :icon="['fab', 'facebook']"
                class="text-tools--darken btn-networks me-3"
                aria-label="Consulter notre page Facebook"
              />
            </a>
            <a
              href="https://twitter.com/?lang=fr"
              target="_blank"
              title="Suivez-nous sur Twitter"
            >
              <font-awesome-icon
                :icon="['fab', 'twitter']"
                class="text-tools--darken btn-networks"
                aria-label="Suivez-nous sur Twitter"
              />
            </a>
          </div>
        </div>
      </div>
    </div>
    
  </section>
  <!--<section v-else class="operator">
    <img src="../assets/img/background/home.jpg"/>
  </section>
   Mobile Portrait -->
 <!-- <section v-else class="section-portrait">
    <div class="row">
      <div
        v-for="dep in departements"
        :key="dep.family_description"
        class="col-6"
      >
        <div class="row">
          <div
            v-if="dep.family_description != 'Tools'"
            class="h50"
            :class="`bg-${dep.family_sass}`"
          >
            <router-link
              :to="{
                name: 'TheProducts',
                params: {
                  linkType: `${dep.family_id}__products`,
                },
              }"
              :title="`${dep.family_description}`"
              :aria-label="`${dep.family_description}`"
            >
              <div
                :class="`display-${dep.family_sass}`"
                :aria-label="`${dep.family_description}`"
              >
                <span
                  :class="`icon-${dep.family_description
                    .replace(/\s|_|\(|\)/g, '-')
                    .normalize('NFD')
                    .replace(/\p{Diacritic}/gu, '')
                    .toLowerCase()} icon text-${dep.family_sass}--darken`"
                >
                </span>
              </div>
              <div :class="`bg-${dep.family_sass}--darken`">
                <span :class="`text-${dep.family_sass} fw-bold`">
                  {{ dep.family_description }}{{ dep.family_description
                  }}{{ dep.family_description }}
                </span>
              </div>
            </router-link>
          </div>
          <div v-else class="h50 col-column pe-3 pt-4">
            <div id="tools--background" class="d-flex">
              <div class="tools--novisible"></div>
              <div class="align-self-center tools--text">
                <font-awesome-icon
                  :icon="['fas', 'gear']"
                  aria-label="Outils"
                  title="Outils"
                />
              </div>
            </div>
            <div id="tools--icons">
              <div v-if="!authenticated" class="pb3"></div>
              <div class="col-12 text-center pb-4">
                <router-link
                  :to="{
                    name: 'TheError',
                    params: {
                      linkType: 'InConstruction',
                    },
                  }"
                >
                  <font-awesome-icon
                    :icon="['fas', 'map-marker-alt']"
                    class="text-tools--darken btn-tools"
                    aria-label="Nos points de vente"
                    title="Nos points de vente"
                  />
                </router-link>
              </div>
              <div class="col-12 text-center pb-4 pt-1">
                <router-link
                  :to="{
                    name: 'TheError',
                    params: {
                      linkType: 'InConstruction',
                    },
                  }"
                >
                  <font-awesome-icon
                    :icon="['fas', 'tag']"
                    class="text-tools--darken btn-tools"
                    aria-label="En promotion"
                    title="En promotion"
                  />
                </router-link>
              </div>
              <div v-if="authenticated" class="col-12 text-center pb-4 pt-1">
                <router-link
                  :to="{
                    name: 'TheError',
                    params: {
                      linkType: 'InConstruction',
                    },
                  }"
                >
                  <font-awesome-icon
                    :icon="['fas', 'address-card']"
                    class="text-tools--darken btn-tools"
                    aria-label="Carte de fidélité"
                    title="Carte de fidélité"
                  />
                </router-link>
              </div>
              <div class="col-12 text-center pb-4 pt-2">
                <a href="https://fr-fr.facebook.com/" target="_blank">
                  <font-awesome-icon
                    :icon="['fab', 'facebook']"
                    class="text-tools--darken btn-networks"
                    aria-label="Consulter notre page Facebook"
                  />
                </a>
              </div>
              <div class="col-12 text-center pt-2">
                <a href="https://twitter.com/?lang=fr" target="_blank">
                  <font-awesome-icon
                    :icon="['fab', 'twitter']"
                    class="text-tools--darken btn-networks"
                    aria-label="Suivez-nous sur Twitter"
                  />
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>-->
</template>

<script>
import StockService from '@/services/stock-service.js'
import { ref } from 'vue'
import { mapGetters } from 'vuex'

export default {
  name: 'TheHome',
  /* props: {
    orientationo: {
      type: Boolean,
      default: false,
    },
  },*/
  setup() {
    const departements = ref([])
    StockService.listDepartements().then((response) => {
      response.push({
        family_abbreviation: 't',
        family_description: 'Tools',
        family_id: 0,
        family_sass: 'tools',
      })
      // console.log('departements', response)
      departements.value = response
    })
    return { departements }
  },
  data() {
    return {
      // mobile: false,
      // mobileNav: false,
      //orientation: false,
      //operator: false,
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
    /* management(newManagement, oldManagement) {
      if(newManagement != 'Customer') {
        if(window.innerHeight > window.innerWidth) {
          // console.log('yes', window.innerWidth)
          this.operator = true
        } else {
          this.operator = false
          // console.log('no')
        }
        //console.log('newManagement',newManagement, 'oldManagement',oldManagement) 
      } else {
        this.operator = false
        // console.log('no1')
      }
    },*/
    /*operator(newOperator, oldOperator) {
      console.log('newOperator', newOperator, 'oldOperator', oldOperator)
    },*/
  },
  /*created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
  },*/
  /* mounted() {
    this.checkScreen()
  },*/
  methods: {
    /* toggleMobileNav() {
      this.mobileNav = !this.mobileNav
    },*/
    /* checkScreen() {
      if (window.innerWidth <= 992) {
        let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
        if (screenOrientation === 'portrait-primary') {
          // console.log('portrait-primary', screenOrientation)
          if(this.management !== null && this.management !== 'Customer') {
            // console.log('ici')
            // this.operator = true
            this.mobile = true
            this.orientation = true
            return          
          } else {
            // this.operator = false
            this.mobile = true
            this.orientation = true
            return
          }
        } else {
          // console.log('portrait-landscape', screenOrientation)
          //this.operator = false
          this.mobile = true
          this.orientation = false
          return
        }
      }
      // this.operator = false
      this.orientation = false
      this.mobile = false
      this.mobileNav = false
      return
    },*/
  },
}
</script>

<style scoped lang="scss">
@import "../assets/sass/libs/variables.scss";
@import "../assets/sass/style.scss";

.section-landscape {
  // background-color: red;
  .w50 {
    width: 50%;
    height: 50%;
    .w100 {
      width: 100%;
      height: 100%;
      a {
        width: 100%;
        height: 100%;
        //background-color: red;
        .bg-icon {
          width: 100%;
          height: 85%;
          text-align: center;
          overflow: hidden;
          .icon {
            font-size: 35.2vh;
          }
        }
        .family {
          width: 100%;
          height: 15%;
          overflow: hidden;
          .family-leg {
            display: block;
            margin: -2.5vh 0 0 -0.3vw;
            font-size: 6.7vh;
          }
          .family-font {
            display: block;
            margin: -2.9vh 0 0 -0.3vw;
            font-size: 8.2vh;
          }
        }
      }
    }
    #tools--background {
      position: absolute;
      text-align: center;
    }  
#tools--icons {
  position: relative;
  width: 100%;
}
  }
}
/*.family-leg {
  margin-left: -0.3vw;
  line-height: 5vh;
  font-size: 7vh;
}*/
/*.family-fruit,
.family-prod {
  margin-left: -0.3vw;
  line-height: 7vh;
  font-size: 10vh;
}
#tools--background {
  position: absolute;
  text-align: center;
}*/
//Pour desktop
@media #{$desktop-up} {
  /* .section-landscape {
    width: 100vw;
    height: 83.2vh;
   // background-color: red;
    .w50 {
      width: 50%;
     // height: 40vh;
     .bg-icon {
      height: 35vh;
      text-align: center;
      overflow: hidden;
      .icon {
        font-size: 35vh;
      }
    }
    }
  }*/
  .section-landscape {
    width: 100vw;
    height: 83.2vh;
  #tools--background {
    width: 50%;
    margin-left: -1vw;
    line-height: 0;
    font-size: 41.6vh;
  }
  #tools--icons {
    padding-top: 2vh;
    margin-left: -1vw;
    font-size: 12vh;
  }
}
 /* .family--hover:hover {
    .bg-leg {
      background-color: lighten($leg, 15%);
    }
    .family-leg {
      color: lighten($leg, 15%);
    }
    .bg-fruit {
      background-color: #ffec27;
    }
    .family-fruit {
      color: #ffec27;
    }
    .bg-prod {
      background-color: #b732e6;
    }
    .family-prod {
      color: #b732e6;
    }
  }
  .family-fruit {
    margin-left: -1.5vw;
  }*/
}
//Pour mobile portrait
@media #{$mobile-up} {
  .section-landscape {
    position: relative;
    top: 6vh;
    width: 100vw;
    height: 86.5vh;
    .w50 {
      .w100 {
        a {
          .bg-icon {
            .icon {
              font-size: 37vh;
            }
          }
          .family {
            width: 100%;
            height: 15%;
            overflow: hidden;
            .family-leg {
              display: block;
              margin: -2.5vh 0 0 -0.8vw;
              font-size: 7vh;
              letter-spacing: -.1rem;
            }
            .family-font {
              display: block;
              margin: -2.9vh 0 0 -0.8vw;
              font-size: 8.5vh;
              letter-spacing: -.2rem;
            }
          }
        }
      }
      #tools--background {
      top: 48.2%; 
      left: 48.2%;    
      font-size: 30vh;
      }  
  #tools--icons {
      margin-top: 27%;  
      font-size: 8vh;
  }
    }
  }
  /*.section-portrait {
    position: absolute;
    margin: 0;
    top: 0;
    width: 100vw;
    .h50 {
      display: flex;
      flex-wrap: wrap;
      flex-direction: row;
      //width: 50vw;
      overflow: hidden;
    }
    .display-leg {
      order: 1;
      padding: 0;
      width: 50vw;
      .icon-legumes {
        display: block;
        margin-top: 2.5vh;
        font-size: 40vh;
        text-align: center;
      }
}
    .bg-leg--darken {
      position: absolute;
      order: 2;
      padding: 0;
      top: 39vh;
      width: 50vw;
      height: 5vh;
      background-color: darken($leg, 15%);
      overflow: hidden;
      .text-leg {
        display: inline-block;
        margin: -3.2vw 0 0 -0.5vw;
        font-size: 5vh;
      }
    }
    .bg-fruit--darken {
      position: absolute;
      top: 39vh;
      left: 50vw;
      order: 1;
      height: 5vh;
      width: 50vw;
      padding-left: 0;
      overflow: hidden;
      .text-fruit {
        font-size: 6.7vh;
        line-height: 5.4vh;
        margin-left: -0.5vw;
      }
    }
    .display-fruit {
      order: 2;
      height: 39vh;
      font-size: 30vh;
      padding: 3.5vh 0 0 0;
      .icon-fruits {
        display: block;
        margin: 1.2vh 0 0 -10%;
        transform: rotate(-45deg);
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
      }
    }
    .bg-prod--darken {
      position: relative;
      top: -3vh;
      padding-left: 7vw;
      max-height: 5vh;
      padding: 0;
      order: 2;
      .text-prod {
        margin-left: -0.5vw;
        font-size: 6vh;
        line-height: 5.5vh;
      }
    }
    .display-prod {
      order: 1;
      .icon-produits {
        display: block;
        margin-top: 3vh;
        font-size: 39vh;
        margin-left: -19%;
      }
    }
    #tools--background {
      top: 47.5%;
      left: 50vw;
      height: 50%;
      width: 50vw;
      margin: 0;
      padding: 0;
      .tools--novisible {
        height: 100%;
        visibility: hidden;
      }
      .tools--text {
        font-size: 54vw !important;
        color: $tools;
        height: 54vw;
        line-height: 0;
        // display: block;
        margin: -3vh 0 0 -1.7vw;
        //text-align: center;
      }
    }
    #tools--icons {
      height: 44.5vh;
      padding: 0;
      margin-top: -5%;
      .text-tools--darken {
        font-size: 100%;
      }
    }
    .col-column {
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding-right: 2vw;
      padding-bottom: 1.5vh;
      div {
        height: 7.5vh;
        font-size: 4.5vh;
      }
    }
    .pb3 {
      max-height: 4.5vh;
    }
  }*/
  .operator {
    position: absolute;
    top: 5vh;
    left: 9.8vw;
    height: 100vh;
    width: 95vw;
    img {
      width: 93vw;
      height: 95vh;
    }
  }
  .section-landscape--rotated {
    position: relative;
    -webkit-transform: rotate(90deg) !important;
   -moz-transform: rotate(90deg) !important;
   -o-transform: rotate(90deg) !important;
   -ms-transform: rotate(90deg) !important;
   transform: rotate(90deg) !important;
  // transform-origin: left top;
  top: -18.5vh;
//  left: -18.4vw;
    width: 95vh;
    height: 100vw;
   background-color: red;  
    .w50 {
      width: 50%;
      height: 30vh;
      .w100 {
        width: 100%;
        height: 100%;
        a {
          width: 100%;
          height: 100%;
          //background-color: red;
          .bg-icon {
            width: 100%;
            height: 85%;
            text-align: center;
            overflow: hidden;
            .icon {
              font-size: 35.2vh;
            }
        }
        .family {
          width: 100%;
          height: 15%;
          overflow: hidden;
          .family-leg {
            display: block;
            margin: -2.5vh 0 0 -0.3vw;
            font-size: 7.5vh;
          }
          .family-font {
            display: block;
            margin: -2.9vh 0 0 -0.3vw;
            font-size: 9vh;
          }
        }
      }
    }
    #tools--background {
   // top: 40%;     
   // font-size: 46vh;
    }  
#tools--icons {
  //  margin-top: 5%;  
   // font-size: 12vh;
}
  }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  .section-landscape {
    width: 100%;
    height: 93.2vh;
 //  background-color: red;  
    .w50 {
    .w100 {
      a {
        .bg-icon {
          .icon {
            font-size: 39.5vh;
          }
        }
        .family {
          width: 100%;
          height: 15%;
          overflow: hidden;
          .family-leg {
            display: block;
            margin: -2.5vh 0 0 -0.3vw;
            font-size: 7.5vh;
          }
          .family-font {
            display: block;
            margin: -2.9vh 0 0 -0.3vw;
            font-size: 9vh;
          }
        }
      }
    }
    #tools--background {
    top: 40%;     
    font-size: 46vh;
    }  
#tools--icons {
    margin-top: 5%;  
    font-size: 12vh;
}
  }
   // background-color: red;

    /* position: relative;
    top: 0;
    left: 5vw;
    width: 100%;
    height: 94%;
    overflow: hidden;*/
  }
/*  .background {
    height: 40vh;
    line-height: 40vh;
    .icon {
      font-size: 39.5vh;
    }
  }
  .family-fruit {
    margin-left: -2.7vw;
  }
  #tools--background {
    position: absolute;
    width: 46.9%;
    margin-left: -2.5vw;
    line-height: 0;
    text-align: center;
    font-size: 46vh;
  }
  #tools--icons {
    position: relative;
    width: 100%;
    padding-top: 5vh;
    margin-left: -2.7vw;
    font-size: 12vh;
  }*/
}
</style>
