<template>
    <div class="container d-flex align-items-center">  
      <div v-if="error === 'InConstruction'" class="text-center"> 
        <font-awesome-icon
                        :icon="['fas', 'person-digging']"
                        class="icon text-tools"
                        aria-label="Page en construction"
                      />
                      <div class="fw-bold">En constuction</div>
      </div> 
    </div>
</template>

<script>
export default {
  name: 'InConstruction',
  data() {
    return {
      error: ''
    }
  },
  mounted() {
    if (this.$route.params.linkType) {
      this.error = this.$route.params.linkType
      // console.log('this.error', this.error)
    }
  }
}
</script>

<style lang="scss" scoped>

.container {
  width: 100vw;
  height: 90%;
  div {
    width: 100%;
    .icon {
      font-size: 20vh;
    }
}
  }
</style>