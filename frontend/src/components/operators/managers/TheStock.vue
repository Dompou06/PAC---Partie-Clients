<template>
  <div>
    <div class="home-rotate"></div>
    <div class="container">
      <header class="d-flex">
        <div><font-awesome-icon :icon="['fas', 'caret-left']" /></div>
        <div>{{ semaine }} {{ year }}</div>
        <div><font-awesome-icon :icon="['fas', 'caret-right']" /></div>
      </header>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TheStock',
  data() {
    return {
      semaine: '',
      year: 0,
    }
  },
  mounted() {
    this.dateTime()
  },
  created() {
    this.dateTime()
  },
  methods: {
    dateTime() {
      const curr = new Date()
      this.year = curr.getFullYear()
      let jan4 = new Date(curr.getFullYear(), 0, 4)
      let dayDiff = (curr - jan4) / 86400000
      if (new Date(curr.getFullYear(), 0, 1).getDay() < 5) {
        this.semaine = 1 + Math.ceil(dayDiff / 7)
        this.week = 'W' + (1 + Math.ceil(dayDiff / 7))
        this.weeknow = `${this.year}-W${1 + Math.ceil(dayDiff / 7)}`
      } else {
        this.semaine = Math.ceil(dayDiff / 7)
        this.week = 'W' + Math.ceil(dayDiff / 7)
        this.weeknow = `${this.year}-W${Math.ceil(dayDiff / 7)}`
      }
    },
  },
}
</script>

<style scoped lang="scss">
@import "../../../assets/sass/libs/variables.scss";
@import "../../../assets/sass/style.scss";

//Pour desktop
@media #{$desktop-up} {
  .home-rotate {
    display: none;
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  .container {
    display: none;
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  .home-rotate {
    display: none;
  }
}
</style>
