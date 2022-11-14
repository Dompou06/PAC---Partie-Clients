<template>
  <div class="home">
    <TheHome />
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
  computed: {
    ...mapGetters({
      management: 'auth/management',
    }),
  },
}
</script>
