<template>
  <section>
    <h2 class="nav_bg fw-bold text-center">Mot de passe oublié ?</h2>
    <div class="row vertical-center">
      <form class="col-12" @submit.prevent="sendEmail">
        <div class="row">
          <div class="col-1 col-md-3"></div>
          <div class="col-10 col-md-6">
            <div class="mb-3">
              <label for="email" class="form-label"
                >Email associé à votre compte</label
              >
              <input
                id="email"
                v-model="form.email"
                type="email"
                class="form-control"
                name="email"
                aria-describedby="Champ d'email"
                required
              />
            </div>
          </div>
          <div class="col-1 col-md-3"></div>
        </div>
        <div class="row mt-4">
          <div class="col-md-3"></div>
          <button
            id="buttonsend"
            type="submit"
            class="btn btn-success col-12 col-md-6 fw-bold"
          >
            Envoyer
          </button>
          <div class="col-md-3"></div>
        </div>
        <p class="text-center mt-3">{{ msg }}</p>
      </form>
    </div>
  </section>
</template>

<script>
import AuthService from '@/services/auth-service.js'

export default {
  name: 'EmailPassword',
  data() {
    return {
      form: {
        email: '',
      },
      msg: '',
    }
  },
  methods: {
    sendEmail() {
      const credential = this.form
      AuthService.verifyMail(credential).then((response) => {
        document.getElementById('buttonsend').disabled = true
        this.msg = response.data.response
      })
    },
  },
}
</script>

<style lang="scss" scoped>
@import "../assets/sass/libs/variables.scss";

h2 {
  color: darken($tools, 65%) !important;
}
button {
  border-radius: 0;
}
//Pour desktop
@media #{$desktop-up} {
  h2 {
    box-shadow: inset 0em 0.1em 0.2em darken($moyen, 10%);
    font-size: 4vh;
  }
  form {
    margin-top: 5vh;
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  h2 {
    font-size: 4vh;
  }
  form {
    margin-top: 3vh;
    input {
      height: 5vh;
      font-size: 0.8rem;
    }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  h2 {
    font-size: 5vh;
  }
  form {
    margin-top: 3vh;
  }
}
</style>
