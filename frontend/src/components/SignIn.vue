<template>
  <section>
    <div class="title nav_bg text-center">Connexion</div>
    <form class="d-flex flex-column" @submit.prevent="signIn">
      <div class="mb-auto formulaire d-flex flex-column">
        <div class="mb-auto">
          <label for="email" class="form-label text-fonce">Email</label>
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
        <div class="mb-auto">
          <label for="password" class="form-label">Mot de passe</label>
          <div class="input-group">
            <input
              id="password"
              v-model="form.password"
              :type="[showPassword ? 'text' : 'password']"
              class="form-control"
              name="password"
              pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[,;:!@#$%^&*]).{8,}"
              required
            />
            <span
              class="input-group-text"
              @click="showPassword = !showPassword"
            >
              <font-awesome-icon
                :icon="['fas', showPassword ? 'eye' : 'eye-slash']"
                aria-label="Voir le mot de passe"
              />
            </span>
          </div>
        </div>
        <div class="mb-auto d-flex">
          <input
            id="rememberme"
            v-model="form.rememberme"
            type="checkbox"
            class="form-check-input me-1"
            name="rememberme"
          />
          <label for="rememberme" class="form-label align-self-center pt-1"
            >Se souvenir de moi</label
          >
        </div>
      </div>
      <div class="mb-auto message text-center text-danger fw-bold">
        {{ msg }}
      </div>
      <button type="submit" class="mb-auto btn btn-success fw-bold">
        Envoyer
      </button>
      <div
        class="mb-auto text-center fw-bold cursor"
        @click.prevent="forgetPassword"
      >
        Mot de passe oublié ?
      </div>
    </form>
  </section>
</template>

<script>
import AuthService from '@/services/auth-service.js'
import { mapActions, mapGetters } from 'vuex'

export default {
  name: 'SignIn',
  data() {
    return {
      form: {
        email: '',
        password: '',
        rememberme: false,
      },
      msg: '\xa0',
      showPassword: false,
    }
  },
  computed: {
    ...mapGetters({
      role: 'auth/role',
    }),
  },
  methods: {
    ...mapActions({
      signauth: 'auth/signauth',
    }),
    async signIn() {
      let credentials = this.form
      /* if(credentials.rememberme) {
        credentials.rememberme = 'true'
        console.log('user', credentials)}*/
      let response = await AuthService.signIn(credentials)
      //console.log('response', response)
      if (!response.token) {
        this.msg = 'Utilisateur inconnu'
      } else {
        //console.log('response', response)
        const credential = response
        this.signauth(credential)
          .then(() => {
            this.$router.replace({
              name: 'home',
            })
          })
          .catch(() => {
            this.$router.replace({
              name: 'error',
              params: {
                error: 'Un problème serveur est survenu',
              },
            })
          })
      }
    },
    forgetPassword() {
      this.$router.replace({
        name: 'EmailPassword',
      })
    },
  },
}
</script>

<style lang="scss" scoped>
@import "../assets/sass/libs/variables.scss";

section {
  position: relative;
  overflow: hidden;
}
//Pour desktop
@media #{$desktop-up} {
  .title {
    display: none;
  }
  form {
    height: 80vh;
    .formulaire {
      height: 50vh;
      margin: 2vh 15vw 0 15vw;
      .mb-auto {
        padding: 0 3vw;
        label {
          margin: 0;
          line-height: 0.5rem;
        }
        input {
          height: 5vh;
          margin-bottom: 2vh;
          font-size: 0.8rem;
        }
        .input-group-text {
          margin-top: -2vh;
          height: 7vh;
          font-size: 0.8rem;
        }
        #rememberme {
          margin: 1vh 0 0 37%;
          border-radius: 0;
          width: 3vh;
          height: 3vh;
        }
      }
    }
    button {
      margin: 0 18vw;
      border-radius: 0;
    }
  }
}
//Pour mobile portrait
@media #{$mobile-up} {
  .title {
    top: 0 !important;
    font-size: 4vh;
    font-weight: 600;
    color: darken($tools, 65%);
    line-height: 4.5vh;
  }
  form {
    height: 82.5vh;
    .formulaire {
      height: 50vh;
      margin-top: 2vh;
      overflow-y: auto;
      .message {
        min-height: 9vh;
      }
      .mb-auto {
        padding: 0 3vw;
        label {
          margin: 0;
          line-height: 0.5rem;
        }
        input {
          height: 5vh;
          font-size: 0.8rem;
        }
        .input-group-text {
          height: 5vh;
          font-size: 0.8rem;
        }
        #rememberme {
          margin-left: 27%;
          border-radius: 0;
          width: 3vh;
          height: 3vh;
        }
      }
    }
    button {
      border-radius: 0;
    }
  }
}
//Pour mobile landscape
@media #{$mobile-down} {
  .title {
    font-size: 6vh;
    font-weight: 600;
    color: darken($tools, 65%);
    line-height: 6.5vh;
  }
  form {
    height: 87.5vh;
    .formulaire {
      height: 50vh;
      margin: 2vh 1vw 0 5vw;
      .message {
        min-height: 9vh;
      }
      .mb-auto {
        padding: 0 3vw;
        label {
          margin: 0;
          font-size: 0.6rem;
          line-height: 0.5rem;
        }
        input {
          height: 5vh;
          font-size: 0.8rem;
        }
        .input-group-text {
          margin-top: -1.7vh;
          height: 7vh;
          font-size: 0.8rem;
        }
        #rememberme {
          margin-left: 32%;
          border-radius: 0;
          width: 5vh;
          height: 5vh;
        }
      }
    }
    button {
      padding: 0;
      border-radius: 0;
    }
  }
}
</style>
