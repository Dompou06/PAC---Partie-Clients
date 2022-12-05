<!-- eslint-disable vue/require-explicit-emits -->
<template>
  <nav aria-label="Navigation par pages">
    <div class="row">
      <ul class="col-12 pagination justify-content-center">
        <li class="page-item">
          <div
            :class="{ transparent: Number(currentPage) === 1 }"
            class="page-link notselectable"
            :disabled="previousDisabled"
            aria-label="Précédent"
            @click="previousPage"
          >
            <span aria-hidden="true">&laquo;</span>
          </div>
        </li>
        <li v-for="index in pages" :key="index" class="page-item">
          <div
            class="page-link notselectable"
            :class="{ active: index === Number(currentPage) }"
            @click="changeIndex(`${index}`)"
          >
            {{ index }}
          </div>
        </li>
        <li class="page-item">
          <div
            :class="{
              transparent:
                Number(currentPage) === Number(pages) || Number(pages) === 0,
            }"
            class="page-link notselectable"
            :disabled="nextDisabled"
            aria-label="Suivant"
            @click="nextPage"
          >
            <span aria-hidden="true">&raquo;</span>
          </div>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  props: {
    totalrecords: {
      type: Number,
      default: 0,
    },
    currentPage: {
      type: Number,
      required: true,
    },
    pageCount: {
      type: Number,
      required: true,
    },
    visibleItems: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      pages: 0,
      page: 1,
      visibleItemsPerPageCount: 0,
      mobile: false,
      mobileNav: false,
      windowWidth: null,
      orientation: false,
    }
  },
  computed: {
    previousDisabled() {
      return this.currentPage === 1
    },
    nextDisabled() {
      return this.currentPage === this.pages
    },
  },
  watch: {
    orentationWindow: function () {
      window.addEventListener('resize', this.checkScreen)
      this.checkScreen()
    },
    totalrecords: function (newTotalrecords, oldTotalrecords) {
      this.pages = Math.ceil(newTotalrecords / this.visibleItemsPerPageCount)
      if (this.pages > 1) {
        return (this.pages = Math.ceil(
          this.totalrecords / this.visibleItemsPerPageCount
        ))
      } else {
        return this.pages
      }
    },
  },
  created() {
    window.addEventListener('resize', this.checkScreen)
    this.checkScreen()
    this.visibleItemsPerPageCount = this.visibleItems
    this.pages = Math.ceil(this.totalrecords / this.visibleItemsPerPageCount)
    if (this.pages > 1) {
      return (this.pages = Math.ceil(
        this.totalrecords / this.visibleItemsPerPageCount
      ))
    } else if (this.pages === 1) {
      this.pages = 0
      return this.pages
    } else {
      return this.pages
    }
  },
  methods: {
    nextPage() {
      // eslint-disable-next-line vue/require-explicit-emits
      this.$emit('next-page')
    },
    previousPage() {
      // eslint-disable-next-line vue/require-explicit-emits
      this.$emit('previous-page')
    },
    changeIndex(val) {
      // eslint-disable-next-line vue/require-explicit-emits
      this.$emit('load-page', val)
    },
    toggleMobileNav() {
      this.mobileNav = !this.mobileNav
    },
    checkScreen() {
      this.windowWidth = window.innerWidth
      if (this.windowWidth <= 768) {
        let screenOrientation =
          (screen.orientation || {}).type ||
          screen.mozOrientation ||
          screen.msOrientation
        if (screenOrientation === 'portrait-primary') {
          this.visibleItemsPerPageCount = this.visibleItems
          this.pages = Math.ceil(
            this.totalrecords / this.visibleItemsPerPageCount
          )
          this.orientation = true
          this.mobile = true
          return
        } else {
          this.visibleItemsPerPageCount = this.visibleItems
          this.pages = Math.ceil(
            this.totalrecords / this.visibleItemsPerPageCount
          )
          this.orientation = false
          this.mobile = true
          return
        }
      } else {
        this.visibleItemsPerPageCount = this.visibleItems
        this.pages = Math.ceil(
          this.totalrecords / this.visibleItemsPerPageCount
        )
        this.orientation = false
        this.mobile = false
        this.mobileNav = false
        return
      }
    },
  },
}
</script>
<style lang="scss" scoped>
@import "../assets/sass/libs/variables.scss";

.pagination {
  li {
    .page-link {
      border: none;
      color: darken($tools, 65%);
    }
    .page-link:focus {
      background-color: darken($tools, 65%) !important;
      color: white !important;
    }
    .transparent {
      background-color: transparent;
      color: transparent;
      border: transparent;
      pointer-events: none;
    }
    .transparent:hover {
      @extend .transparent;
    }
    .active {
      background-color: darken($tools, 65%);
      color: white !important;
    }
  }
}
//Pour desktop
@media #{$desktop-up} {
  .pagination {
    li {
      .page-link:hover {
        background-color: darken($tools, 35%);
        color: white !important;
      }
    }
  }
}
</style>
