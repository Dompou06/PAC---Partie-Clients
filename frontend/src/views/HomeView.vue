<template>
  <div>
  <div v-if="!management || management === 'Customer'" class="home">
    <TheHome />
  </div>
  <div v-else>
    <div v-if="orientation === 'landscape'" class="home"><TheHome /></div>
    <div v-else class="home-rotate"></div>
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
</style>
