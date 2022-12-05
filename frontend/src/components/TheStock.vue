<template>
    <div v-if="management">
         <CurrentStock />
   </div>
</template>

<script>
import { mapGetters } from 'vuex'
import CurrentStock from './stock/CurrentStock.vue'

export default {
  name: 'TheStock',
  components: {
    CurrentStock,
  },
  computed: {
    ...mapGetters({
      management: 'auth/management',
    }),
  }
}
</script>