<template>
  <section class="section-landscape notselectable d-flex flex-wrap">
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
</template>

<script>
import StockService from '@/services/stock-service.js'
import { ref } from 'vue'
import { mapGetters } from 'vuex'

export default {
  name: 'TheHome',
  setup() {
    const departements = ref([])
    StockService.listDepartements().then((response) => {
      response.push({
        family_abbreviation: 't',
        family_description: 'Tools',
        family_id: 0,
        family_sass: 'tools',
      })
      departements.value = response
    })
    return { departements }
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      management: 'auth/management',
    }),
  },
}
</script>

<style scoped lang="scss">
@import "../assets/sass/libs/variables.scss";
@import "../assets/sass/style.scss";

.section-landscape {
  .w50 {
    width: 50%;
    height: 50%;
    .w100 {
      width: 100%;
      height: 100%;
      a {
        width: 100%;
        height: 100%;
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
//Pour desktop
@media #{$desktop-up} {
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
              letter-spacing: -0.1rem;
            }
            .family-font {
              display: block;
              margin: -2.9vh 0 0 -0.8vw;
              font-size: 8.5vh;
              letter-spacing: -0.2rem;
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
}
//Pour mobile landscape
@media #{$mobile-down} {
  .section-landscape {
    width: 100%;
    height: 93.2vh;
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
  }
}
</style>
