<template>
<div id="app">
  <header v-if="!management || management === 'Customer'" class="header">
 <TheNavigation 
  />
  </header>
  <header v-else>
 <TheNavigationO 
 :current-date="currentDate"
 :current-week="currentWeek"
  />
  </header>
  <!--<main :class="[landscape ? !management || management === 'Customer' : main-rotared]">
  <router-view 
  :current-date="currentDate"
  :current-week="currentWeek"
  />
</main>-->   
  <main class="">
  <router-view 
  :current-date="currentDate"
  :current-week="currentWeek"
  />    
  </main> 
  <!--<main v-if="!operator" class="">
  <router-view 
  :current-date="currentDate"
  :current-week="currentWeek"
  :operator="operator"
  />    
  </main>
  <main v-else class="main-rotared">
   <img src="./assets/img/background/home.jpg"/>
   <router-view 
  :current-date="currentDate"
  :current-week="currentWeek"
  />
  </main>-->
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
      amp: true
    }
  }, 
  data() {
    //https://stackoverflow.com/questions/49380830/vue-js-how-to-get-window-size-whenever-it-changes
    // const { offsetWidth, offsetHeight } = document.querySelector('#app')
    return {
      currentDate: '',
      currentWeek: '',
      // operator: false,
      // offsetWidth,
      // offsetHeight,
    //  refreshScrollableArea: undefined,
    }
  },
  computed: {
    ...mapGetters({
      management: 'auth/management',
    }),
  },
  watch: {
    /* management(newManagement, oldManagement) {
      console.log('newManagement',newManagement, 'oldManagent',oldManagement)
      if(newManagement != 'Customer') {
        if(window.innerHeight > window.innerWidth) {
          // console.log('yes watch', screen.orientation.type)
          this.operator = true
        } else {
          this.operator = false
          // console.log('no watch', screen.orientation.type)
        }
      } else {
        this.operator = false
        // console.log('no1 watch', screen.orientation.type)
      }
    },*/
    /*management(newManagement, oldManagent) {
      // console.log('newManagement',newManagement, 'oldManagent',oldManagent)
      if(this.management != 'Customer' && window.screen.width < window.screen.height) {
        this.operator = true
      } else {
        this.operator = false
      }
      /*let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation*/
      
    /*if(screenOrientation != 'landscape' || screenOrientation != 'Landscape-primary') {
        console.log(screen.orientation)
        console.log('width',window.screen.width, 'height', window.screen.height)
        //document.getElementById('app').classList.add('rotated')

      }*/
    /*if(newManagement != 'Customer') {
        switch (screen.orientation.type) {
        case 'landscape-primary':
          console.log('That looks good.')
          this.orientationO = false
          break
        case 'landscape-secondary':
          console.log('Mmmh… the screen is upside down!')
          this.orientationO = false
          break
        case 'portrait-secondary':
        case 'portrait-primary':
          console.log('Mmmh… you should rotate your device to landscape')
          this.orientationO = true
          break
        default:
          console.log("The orientation API isn't supported in this browser :(")
          this.orientationO = false
        }
        /* console.log('type', screenOrientation)           
        alert('Cette partie doit être en mode paysage')  
        this.orientationO = true*/
    /*screen.orientation.lock('landscape')
            .then(function() {
            //alert('Locked')
            })
            .catch(function(error) {
              alert('Cette partie doit être en mode paysage')
            })*/
    /*} else {
        this.orientationO = false
      }*/
    /* if(document.querySelector('#app').requestFullscreen)
          document.querySelector('#app').requestFullscreen()
        else if(document.querySelector('#app').webkitRequestFullScreen)
          document.querySelector('#app').webkitRequestFullScreen()*/
    /* let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
        if(screenOrientation != 'landscape') {
          console.log(screen.orientation)
          screen.orientation = 'landscape'
          document.getElementById('app').classList.add('rotated')

        }*/
    /* screen.orientation.lock('landscape')
          .then(function() {
            alert('Locked')
          })
          .catch(function(error) {
            alert(error)
          })*/
    /*if (window.innerWidth <= 768) {
          
        }*/
      
    // },
    /* offsetHeight() {
      // console.log('offsetHeight changed', window.innerHeight, 'Width', window.innerWidth)
      if(this.management !== null && this.management !== 'Customer') {
        // console.log('offsetHeight changed', window.innerHeight, 'Width', window.innerWidth)
        if(window.innerHeight > window.innerWidth) {
          console.log('yes')
          this.operator = true  
          console.log('this.operator', this.operator)        
          // console.log('this.management', this.management)
          // console.log('offsetHeight changed', this.offsetHeight, 'offsetWidth', this.offsetWidth)
        // this.operator = true
        } else {
          console.log('no', window.innerWidth, window.innerHeight)
          this.operator = false
          console.log('this.operator', this.operator)
        }
      } else {
        console.log('no1')
        this.operator = false
        console.log('this.operator', this.operator)     
      }
    },*/
    /* orientation(newOrientaton, oldOrientation) {
      //console.log('ici', screen.orientation)
      console.log('newOrientaton', newOrientaton, 'oldOrientation', oldOrientation)
    }*/
  },
  created() {
    /* this.refreshScrollableArea = setInterval(() => {
      const { offsetWidth, offsetHeight } = document.getElementById('app')
      this.offsetWidth = offsetWidth
      this.offsetHeight = offsetHeight
    }, 100)*/
  },
  /* beforeUnmount() {
    return clearInterval(this.refreshScrollableArea)
  },*/
  mounted() {     
    this.dateTime()
    //this.operator = false
    // this.roleOrientation()
  },
  methods: {
    dateTime() {
      const curr = new Date()
      let jan4 = new Date(curr.getFullYear(), 0, 4)
      let dayDiff = (curr - jan4) / 86400000
      if (new Date(curr.getFullYear(), 0, 1).getDay() < 5) {
        this.currentWeek = `${curr.getFullYear()}-W${1 + Math.ceil(dayDiff / 7)}`
      } else {
        if(curr.getDay() === 1) {
          this.currentWeek = `${curr.getFullYear()}-W${Math.ceil(((dayDiff) / 7) + 1)}`
        } else {
          this.currentWeek = `${curr.getFullYear()}-W${Math.ceil((dayDiff) / 7)}`
        }      
      }
      const options = {year: 'numeric', month: 'long', day: 'numeric' }
      const opt_weekday = { weekday: 'long' }
      const weekday = curr.toLocaleDateString('fr-FR', opt_weekday)
      const dateTime = weekday + ' ' + curr.toLocaleDateString('fr-FR', options)
      this.currentDate = dateTime
    },
    /* roleOrientation() {
      //console.log(screen.orientation)
      this.orientation = screen.orientation.type
      this.operator = false
      //  this.orientation = screen.orientation.type
      if(management && management != 'Customer') {
        //document.getElementById('app').classList.add('rotated')

        /*  if(document.querySelector('#app').requestFullscreen)
          document.querySelector('#app').requestFullscreen()
        else if(document.querySelector('#app').webkitRequestFullScreen)
          document.querySelector('#app').webkitRequestFullScreen()
        screen.orientation.lock('landscape')
          .then(function() {
            alert('Locked')
          })
          .catch(function(error) {
            alert(error)
          })*/
    /*if (window.innerWidth <= 768) {
          let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
          if(screenOrientation != 'landscape') {
            console.log(screenOrientation)
            document.getElementById('app').classList.add('rotated')
          }
        }*/
    // }
    // }
  }
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
     /*.rotated {
      -webkit-transform: rotate(90deg) !important;
   -moz-transform: rotate(90deg) !important;
   -o-transform: rotate(90deg) !important;
   -ms-transform: rotate(90deg) !important;
   transform: rotate(90deg) !important;
   transform-origin: left top;
    width: 100vh; 
    overflow-x: hidden; 
   // position: absolute; 
    top: 100%; 
    left: 0; 
    }*/
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
/*  .main {
  top: 5.9vh;
  left: 0;
  width: 100vw;
  height: 87.6vh;
}*/
main {
  position: relative;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  /*top: 6vh;
  left: 0;
  width: 100vw;
  height: 86.5vh;*/
//  background-color: red;
}

/*.main-rotated {
  display:block;
  top: 6vh;
  right: 0vh;
  height: 100vw;
  width: 100vh;
    -webkit-transform: rotate(90deg);
    -moz-transform: rotate(90deg);
    -o-transform: rotate(90deg);
    -ms-transform: rotate(90deg);
    transform: rotate(90deg);
    background-color: red;
}*/
.header {
  z-index: 100;
}
/*.main {
 // position: absolute;
//  overflow: hidden !important;
top: 6vh !important;
left: 0;
height: 95vh;
width: 100vw;
}*/
.main-rotared {
  top: 5vh !important;
  left: 6vw;
  height: 95vh;
  background-color: red;
  img {
    height: 95vh;
    width: 95vw;
  }
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
   // height: 93vh;
    overflow: hidden !important;
  }
main {
  top:0;
 // left: 5vw;
  width: 100vw;
  height: 93vh;
//  background-color: red;
}
.main {
  top:0;
 // left: 5vw;
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
