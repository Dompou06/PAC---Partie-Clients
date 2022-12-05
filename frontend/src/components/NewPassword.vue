<template>
  <section>
    <div class="title nav_bg text-center">Nouveau mot de passe ?</div>
    <form class="d-flex flex-column" @submit.prevent="newPassword">
      <div class="mb-auto formulaire d-flex flex-column">
        <div class="mb-auto">
          <label for="email" class="form-label text-fonce"
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
        <div class="mb-auto">
          <label for="password" class="form-label">Nouveau mot de passe</label>
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
        <div class="mb-auto">
          <label for="confirmpassword" class="form-label"
            >Confirmation du mot de passe</label
          >
          <div class="input-group">
            <input
              id="confirmpassword"
              v-model="form.confirmpassword"
              :type="[showConfirm ? 'text' : 'password']"
              class="form-control"
              name="confirmpassword"
              required
            />
            <span class="input-group-text" @click="showConfirm = !showConfirm">
              <font-awesome-icon
                :icon="['fas', showConfirm ? 'eye' : 'eye-slash']"
                aria-label="Voir le mot de passe"
              />
            </span>
          </div>
        </div>
      </div>
      <div class="mb-auto message text-center text-danger fw-bold">
        {{ msg }}
      </div>
      <button type="submit" class="mb-auto btn btn-success fw-bold">
        Envoyer
      </button>
    </form>
  </section>
</template>

<script>
import AuthService from '@/services/auth-service.js'

export default {
  components: {},
  data() {
    return {
      form: {
        email: '',
        password: '',
        confirmpassword: '',
      },
      msg: '\xa0',
      showPassword: false,
      showConfirm: false,
    }
  },
  methods: {
    async newPassword() {
      try {
        const credentials = this.form
        const password = credentials.password
        const lowerCaseLetters = /[a-z]/g
        const upperCaseLetters = /[A-Z]/g
        const numbers = /[0-9]/g
        const specialCharacters = /[,;:!@#$%^&*]/g
        if (password.length >= 8) {
          if (password.match(lowerCaseLetters)) {
            if (password.match(upperCaseLetters)) {
              if (password.match(numbers)) {
                if (password.match(specialCharacters)) {
                  const confirmpassword = credentials.confirmpassword
                  if (password === confirmpassword) {
                    let response = await AuthService.newPassword(credentials)
                    if (response.message === 'SignIn') {
                      this.$router.replace({
                        name: response.message,
                      })
                    } else {
                      this.msg = response.message
                    }
                  } else {
                    this.msg = 'Mot de passe invalide'
                  }
                } else {
                  this.msg =
                    'Votre mot de passe doit comporter au moins un caratère spécial'
                }
              } else {
                this.msg =
                  'Votre mot de passe doit comporter au moins un chiffre'
              }
            } else {
              this.msg =
                'Votre mot de passe doit comporter au moins une lettre en majuscule'
            }
          } else {
            this.msg =
              'Votre mot de passe doit comporter au moins une lettre en minuscule'
          }
        } else {
          this.msg = 'Votre mot de passe doit comporter au moins 8 caractères'
        }
      } catch {
        this.msg = 'Mot de passe invalide'
      }
    },
  },
}
</script>

<style lang="scss" scoped>
@import "../assets/sass/libs/variables.scss";

section {
  position: relative;
  overflow: hidden;
  .note {
    font-size: 0.5rem;
  }
}
//Pour desktop
@media #{$desktop-up} {
  .title {
    display: none;
  }
  form {
    height: 80vh;
    .formulaire {
      height: 70vh;
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
      height: 70vh;
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
      height: 70vh;
      margin: 2vh 1vw 0 5vw;
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
          margin-top: -1.7vh;
          height: 7vh;
          font-size: 0.8rem;
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
