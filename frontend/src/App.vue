<template>
  <div id="app">
    <header v-if="!management || management === 'Customer'" class="header">
      <TheNavigation />
    </header>
    <header v-else>
      <TheNavigationO :current-date="currentDate" :current-week="currentWeek" />
    </header>
    <main class="">
      <router-view :current-date="currentDate" :current-week="currentWeek" />
    </main>
    <footer v-if="!management || management === 'Customer'" class="footer-c">
      <TheFooter />
    </footer>
    <footer v-else class="footer-o">
      <TheFooterO />
    </footer>
  </div>
</template>

<script>
import TheFooter from '@/components/TheFooter.vue'
import TheNavigation from '@/components/TheNavigation.vue'
import TheNavigationO from '@/components/operators/TheNavigationMP.vue'
import TheFooterO from '@/components/operators/TheFooter.vue'
import { mapGetters } from 'vuex'

export default {
  components: {
    TheNavigation,
    TheNavigationO,
    TheFooter,
    TheFooterO,
  },
  metaInfo: {
    title: 'PAC',
    titleTemplate: '%s - Yay!',
    htmlAttrs: {
      lang: 'fr',
      amp: true,
    },
  },
  data() {
    return {
      currentDate: '',
      currentWeek: '',
    }
  },
  computed: {
    ...mapGetters({
      management: 'auth/management',
    }),
  },
  mounted() {
    this.dateTime()
  },
  methods: {
    dateTime() {
      const curr = new Date()
      let jan4 = new Date(curr.getFullYear(), 0, 4)
      let dayDiff = (curr - jan4) / 86400000
      if (new Date(curr.getFullYear(), 0, 1).getDay() < 5) {
        this.currentWeek = `${curr.getFullYear()}-W${
          1 + Math.ceil(dayDiff / 7)
        }`
      } else {
        if (curr.getDay() === 1) {
          this.currentWeek = `${curr.getFullYear()}-W${Math.ceil(
            dayDiff / 7 + 1
          )}`
        } else {
          this.currentWeek = `${curr.getFullYear()}-W${Math.ceil(dayDiff / 7)}`
        }
      }
      const options = { year: 'numeric', month: 'long', day: 'numeric' }
      const opt_weekday = { weekday: 'long' }
      const weekday = curr.toLocaleDateString('fr-FR', opt_weekday)
      const dateTime = weekday + ' ' + curr.toLocaleDateString('fr-FR', options)
      this.currentDate = dateTime
    },
  },
}
</script>

<style scoped lang="scss">
@import url("./assets/icomoon/navigation/style.css");
@import url("./assets/icomoon/home/style.css");
@import "./assets/sass/libs/variables.scss";
@import "./assets/sass/style.scss";

#app {
  position: absolute;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  overflow: hidden !important;
  header {
    z-index: 100;
  }
  main {
    position: absolute;
    overflow: hidden !important;
  }
  footer {
    position: absolute;
    z-index: 99;
  }
}
//Pour desktop
@media #{$desktop-up} {
  .header {
    top: 0;
    left: 0;
    width: 100vw;
  }
  main {
    position: relative;
    top: 6.3vh;
    left: 0;
    width: 100vw;
    height: 83.2vh;
  }
  .main {
    top: 6.3vh;
    left: 0;
    width: 100vw;
    height: 83.2vh;
  }
  footer {
    top: 89.5vh;
    left: 0;
    width: 100vw;
    height: 10.5vh;
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  #app {
    font-size: 2.5vh;
    .footer-o {
      position: absolute;
      height: 100vh;
      width: 6vw;
      top: 0;
      left: 0;
    }
  }
  .header {
    position: absolute;
    top: 0;
    width: 100vw;
  }
  main {
    position: relative;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
  }
  .header {
    z-index: 100;
  }
  .footer-c {
    bottom: 0 !important;
    left: 0;
    width: 100vw;
  }
}
//Pour mobile paysage
@media #{$mobile-down} {
  #app {
    top: 0;
    height: 100vh !important;
    font-size: 4vh;
    overflow: hidden !important;
    .header {
      width: 100vw;
      max-height: 50vh !important;
      overflow: hidden !important;
    }
    main {
      top: 0;
      width: 100vw;
      height: 93vh;
    }
    .main {
      top: 0;
      width: 100vw;
      height: 93vh;
    }
    footer {
      top: 93vh;
      left: 0;
      width: 100vw;
      height: 10.5vh;
    }
    .footer-o {
      position: absolute;
      bottom: -2.5vh;
    }
  }
}
</style>
