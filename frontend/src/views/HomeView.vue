<template>
  <div>
  <div v-if="!management || management === 'Customer'" class="home">
    <TheHome />
  </div>
  <div v-else>
    <div v-if="orientation === 'landscape'" class="home"><TheHome /></div>
    <div v-else class="home-portrait"><img src="../../src/assets/img/background/home.jpg"/></div>i
  </div>
  </div>
</template>

<script>
import TheHome from '@/components/TheHome.vue'
import { mapGetters } from 'vuex'

export default {
  name: 'HomeView',
  components: {
    TheHome,
  },
  data() {
    return {
      orientation: '',
    }
  },
  computed: {
    ...mapGetters({
      management: 'auth/management',
    }),
  },
  watch: {
    /* orientation(newOrientation, oldOrientation) {
      //console.log('newOrientation',newOrientation, 'oldOrientation',oldOrientation)
    }*/
  },
  created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
  },
  mounted() {
    this.checkScreen()
  },
  methods: {
    checkScreen() {
      if (window.innerWidth < window.innerHeight) {
        this.orientation = 'portrait' 
      } else {
        this.orientation = 'landscape'
      }
    }
  }
}
</script>

<style scoped lang="scss">
@import "../assets/sass/libs/variables.scss";
@import "../assets/sass/style.scss";

//Pour desktop
@media #{$desktop-up} {
  .home {
 
  }
}
//Pour mobile paysage
@media #{$mobile-down} {
  .home {
    position: relative;
    top: 0;
    left: 5vw;
    height: 93vh;
    width: 95vw;
  }
}

.home-portrait {
  position: relative;
  top: 5vh;
  left: 9.8vw;
  height: 95vh;
  width: 91.3vw;
  img {
    width: 100%;
    height: 100%;
  }
}


</style>
