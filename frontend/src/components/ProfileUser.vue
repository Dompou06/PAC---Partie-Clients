<template>
  <section>
    <div class="title nav_bg text-center">Mon compte</div>
    <form class="d-flex flex-column" @submit.prevent="submit">
      <div class="mb-auto formulaire d-flex flex-wrap">
        <input
          id="check"
          class="form-check-input hidden"
          type="checkbox"
          name="check"
          :checked="checked"
        />
        <div class="mb-auto w30 landscape">
          <label for="society" class="form-label text-fonce"
            >Société (facultatif)</label
          >
          <input
            id="society"
            v-model="form.society"
            type="text"
            class="form-control"
            name="society"
            aria-describedby="Champ de la société"
            :disabled="!updated ? disabled : ''"
            require
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w30">
          <label for="firstname" class="form-label text-fonce">Prénom</label>
          <input
            id="firstname"
            v-model="form.firstname"
            type="text"
            class="form-control"
            name="firstname"
            aria-describedby="Champ du prénom"
            :disabled="!updated ? disabled : ''"
            require
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w30">
          <label for="lastname" class="form-label text-fonce">Nom</label>
          <input
            id="lastname"
            v-model="form.lastname"
            type="text"
            class="form-control"
            name="lastname"
            aria-describedby="Champ du nom"
            :disabled="!updated ? disabled : ''"
            require
            @change="onchange()"
          />
        </div>
        <div class="mb-auto w20">
          <label for="email" class="form-label text-fonce">Email</label>
          <input
            id="email"
            v-model="form.email"
            type="text"
            class="form-control"
            name="email"
            aria-describedby="Champ d'email"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20">
          <label for="mobile" class="form-label text-fonce">Mobile</label>
          <input
            id="mobile"
            v-model="form.mobile"
            type="text"
            class="form-control"
            name="mobile"
            aria-describedby="Champ du mobile"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20">
          <label for="phone" class="form-label text-fonce">Téléphone</label>
          <input
            id="phone"
            v-model="form.phone"
            type="text"
            class="form-control"
            name="phone"
            aria-describedby="Champ du téléphone"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20">
          <label for="fax" class="form-label text-fonce">Fax</label>
          <input
            id="fax"
            v-model="form.fax"
            type="text"
            class="form-control"
            name="fax"
            aria-describedby="Champ du fax"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto w45">
          <label for="address" class="form-label text-fonce">Addresse</label>
          <input
            id="address"
            v-model="form.address"
            type="text"
            class="form-control"
            name="address"
            aria-describedby="Champ de l'addresse"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w10">
          <label for="cp" class="form-label text-fonce"
            ><span class="desktop">Code postal</span
            ><span class="mobile">CP</span></label
          >
          <input
            id="cp"
            v-model="form.cp"
            type="text"
            class="form-control"
            name="cp"
            aria-describedby="Champ du code postal"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20a">
          <label for="city" class="form-label text-fonce">Ville</label>
          <input
            id="city"
            v-model="form.city"
            type="city"
            class="form-control"
            name="city"
            aria-describedby="Champ de la ville"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20a">
          <label for="state" class="form-label text-fonce">Pays</label>
          <input
            id="state"
            v-model="form.state"
            type="state"
            class="form-control"
            name="state"
            aria-describedby="Champ du pays"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto w45">
          <label for="billing_address" class="form-label text-fonce"
            >Addresse de facturation (facultatif)</label
          >
          <input
            id="billing_address"
            v-model="form.billing_address"
            type="text"
            class="form-control"
            name="billing_address"
            aria-describedby="Champ de l'addresse de facturation"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w10">
          <label for="billing_cp" class="form-label text-fonce"
            ><span class="desktop">Code postal</span
            ><span class="mobile">CP</span></label
          >
          <input
            id="billing_cp"
            v-model="form.billing_cp"
            type="text"
            class="form-control"
            name="billing_cp"
            aria-describedby="Champ du code postal"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20a">
          <label for="billing_city" class="form-label text-fonce">Ville</label>
          <input
            id="billing_city"
            v-model="form.billing_city"
            type="billing_city"
            class="form-control"
            name="billing_city"
            aria-describedby="Champ de la ville"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20a">
          <label for="billing_state" class="form-label text-fonce">Pays</label>
          <input
            id="billing_state"
            v-model="form.billing_city"
            type="state"
            class="form-control"
            name="billing_state"
            aria-describedby="Champ du pays"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto w45">
          <label for="delivery_address" class="form-label text-fonce"
            >Addresse de livraison (facultatif)</label
          >
          <input
            id="delivery_address"
            v-model="form.delivery_address"
            type="text"
            class="form-control"
            name="delivery_address"
            aria-describedby="Champ de l'addresse de livraison"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w10">
          <label for="delivery_cp" class="form-label text-fonce"
            ><span class="desktop">Code postal</span
            ><span class="mobile">CP</span></label
          >
          <input
            id="delivery_cp"
            v-model="form.delivery_cp"
            type="text"
            class="form-control"
            name="delivery_cp"
            aria-describedby="Champ du code postal"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20a">
          <label for="delivery_city" class="form-label text-fonce">Ville</label>
          <input
            id="delivery_city"
            v-model="form.delivery_city"
            type="delivery_city"
            class="form-control"
            name="delivery_city"
            aria-describedby="Champ de la ville"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
        <div class="mb-auto ms-auto w20a">
          <label for="delivery_state" class="form-label text-fonce">Pays</label>
          <input
            id="delivery_state"
            v-model="form.delivery_city"
            type="state"
            class="form-control"
            name="delivery_state"
            aria-describedby="Champ du pays"
            :disabled="!updated ? disabled : ''"
            @change="onchange()"
          />
        </div>
      </div>
      <div class="mb-auto message text-center text-danger fw-bold">
        <div v-if="!destroyAccount" class="d-flex">
          <div class="font-destroy align-self-center">
            Souhaitez-vous réellement supprimer votre compte ?
          </div>
          <div
            class="bg-danger text-light fw-bold ps-2 pe-2 ms-3 cursor"
            @click="deleteAccount()"
          >
            OUI
          </div>
          <div
            class="bg-success text-light fw-bold ps-2 pe-2 ms-3 cursor"
            @click="noDeleteAccount()"
          >
            NON
          </div>
        </div>
        <div v-else>
          {{ msg }}
        </div>
      </div>
      <div class="mb-auto d-flex flex-wrap buttons">
        <button
          v-show="updated"
          type="button"
          class="btn btn-warning fw-bold"
          @click="updated = !updated"
        >
          Modifier
        </button>
        <button v-show="!updated" type="submit" class="btn btn-success fw-bold">
          Valider
        </button>
        <div class="btn-delete d-flex">
          <button
            type="button"
            class="flex-fill btn btn-danger fw-bold border-end"
            @click="deleteProfil()"
          >
            Supprimer le profil
          </button>
          <button
            type="button"
            class="flex-fill btn btn-danger fw-bold"
            @click="destroyAccount = !destroyAccount"
          >
            Supprimer le compte
          </button>
        </div>
      </div>
    </form>
  </section>
</template>

<script>
import AuthService from '@/services/auth-service.js'
import { mapActions, mapGetters } from 'vuex'
import store from '../store'

export default {
  name: 'ProfileUser',
  data() {
    return {
      form: {
        check: false,
        firstname: null,
        lastname: null,
        email: null,
        mobile: null,
        phone: null,
        fax: null,
        address: null,
        cp: null,
        city: null,
        state: 'France',
        society: null,
        billing_address: null,
        billing_cp: null,
        billing_city: null,
        billing_state: 'France',
        delivery_address: null,
        delivery_cp: null,
        delivery_city: null,
        delivery_state: 'France',
      },
      token: '',
      msg: '\xa0',
      updated: true,
      checked: false,
      disabled: false,
      destroyAccount: true,
      authenticated: '',
    }
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      management: 'auth/management',
    }),
  },
  watch: {
    management(newManagement, oldManagent) {
      if (newManagement != 'Customer') {
        this.$router.replace({
          name: 'home',
        })
      }
    },
  },
  mounted() {
    if (this.management && this.management != 'Customer') {
      this.$router.replace({
        name: 'home',
      })
    }
    //Données utilisateur au chargement de la page
    AuthService.findMe().then((result) => {
      this.form.firstname = result.firstname
      this.form.lastname = result.lastname
      this.form.email = result.email
    })
    AuthService.profileUser().then((result) => {
      console.log('result', result)

      this.form.mobile = result.mobile
      this.form.phone = result.phone
      this.form.fax = result.fax
      this.form.society = result.society
      this.form.address = result.address
      this.form.cp = result.cp
      this.form.city = result.city
      this.form.state = result.state
      if(result.billing_address) {
        const billing = result.billing_address
        const billingSplit = billing.split(' - ')
        this.form.billing_address = billingSplit[0]
        this.form.billing_cp = billingSplit[1]
        this.form.billing_city = billingSplit[2]
        if (billingSplit[3] != '') {
          this.form.billing_state = billingSplit[3]
        } else {
          this.form.billing_state = this.form.billing_state
        }
      } else {
        this.form.billing_address =''
        this.form.billing_cp = ''
        this.form.billing_city = ''
      }
      if(result.delivery_address) {
        const delivery = result.delivery_address
        const deliverySplit = delivery.split(' - ')
        this.form.delivery_address = deliverySplit[0]
        this.form.delivery_cp = deliverySplit[1]
        this.form.delivery_city = deliverySplit[2]
        if (deliverySplit[3] != '') {
          this.form.billing_state = deliverySplit[3]
        } else {
          this.form.billing_state = this.form.billing_state
        }
      } else {
        this.form.delivery_address = ''
        this.form.delivery_cp = ''
        this.form.delivery_city = ''
      }
    })
  },
  methods: {
    ...mapActions({
      updateUser: 'auth/updateUser',
      refreshToken: 'auth/refreshToken',
      logoutAction: 'auth/logout',
    }),
    //Case à cocher si données utilisateur sont modifiées
    onchange() {
      this.checked = true
      this.form.check = true
    },
    //Envoie des données utilisateur et/ou profile après modifications
    async submit() {
      const check = this.form.check
      const user = {
        firstname: this.form.firstname,
        lastname: this.form.lastname,
        email: this.form.email,
      }
      const billingAddress = `${this.form.billing_address} - ${this.form.billing_cp} - ${this.form.billing_city} - ${this.form.billing_state}`
      const deliveryAddress = `${this.form.delivery_address} - ${this.form.delivery_cp} - ${this.form.delivery_city} - ${this.form.delivery_state}`
      const contact = {
        mobile: this.form.mobile,
        phone: this.form.phone,
        fax: this.form.fax,
        address: this.form.address,
        cp: this.form.cp,
        city: this.form.city,
        state: this.form.state,
        society: this.form.society,
        billing_address: billingAddress,
        delivery_address: deliveryAddress,
      }
      const credentials = {
        check: check,
        user: user,
        contact: contact,
      }
      await AuthService.updateMe(credentials)
        .then((result) => {
          const token = result.token
          if (token != localStorage.getItem('user')) {
            this.refreshToken(token)
          }
          const lastUser = store.getters['auth/user']
          const updateUser = `${result.firstname} ${result.lastname}`
          if (lastUser != updateUser) {
            this.updateUser(updateUser)
              .then(() => {})
              .catch(() => {
                this.$router.replace({
                  name: 'error',
                  params: {
                    error: 'Un problème serveur est survenu',
                  },
                })
              })
          }
          const billingAddress = `${this.form.billing_address} - ${this.form.billing_cp} - ${this.form.billing_city} - ${this.form.billing_state}`
          const deliveryAddress = `${this.form.delivery_address} - ${this.form.delivery_cp} - ${this.form.delivery_city} - ${this.form.delivery_state}`
          this.form.firstname = result.firstname
          this.form.lastname = result.lastname
          this.form.email = result.email
          this.form.mobile = result.mobile
          this.form.phone = result.phone
          this.form.fax = result.fax
          this.form.society = result.society
          this.form.address = result.address
          this.form.cp = result.cp
          this.form.city = result.city
          this.form.state = result.state
          this.form.billing_address = billingAddress
          this.form.delivery_address = billingAddress
          this.checked = false
          this.updated = true
        })
        .catch(() => {
          this.msg = 'Modifications non enregistrées'
        })
    },
    //Suppression du profile
    async deleteProfil() {
      await AuthService.deleteContactMe().then((result) => {
        if (result) {
          const newToken = result.token
          if (newToken != localStorage.getItem('user')) {
            this.refreshToken(token)
          }
          //Rafraîchissement de la page
          this.$router.go()
        }
      })
    },
    //Suppression du compte
    async deleteAccount() {
      //On supprime le compte
      await AuthService.deleteAccountMe()
      this.logoutAction()
        .then(() => {
          this.$router.replace({
            //On retourne à l'accueil
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
    },
    noDeleteAccount() {
      this.destroyAccount = true
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
      height: 70vh;
      width: 90vw;
      margin: 2vh 5vw 0 5vw;
      .w30 {
        width: 30%;
      }
      .w20,
      .w20a {
        width: 20%;
      }
      .w45 {
        width: 45%;
      }
      .w10 {
        width: 10%;
      }
      .mobile {
        display: none;
      }
      .mb-auto {
        label {
          margin: 0;
          font-size: 0.7rem;
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
    .buttons {
      padding: 0 5vw;
      button {
        margin: 0;
        border-radius: 0;
      }
      .btn-warning,
      .btn-success,
      .btn-delete {
        height: 9vh;
        width: 50%;
      }
    }
    .message {
      height: 7vh;
      width: 100vw;
      padding: 0 25vw;
      .font-destroy {
        text-align: start;
        font-size: 0.7rem;
        line-height: 0.7rem;
      }
      .bg-danger,
      .bg-success {
        line-height: 5vh;
      }
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
      height: 75%;
      margin-top: 2vh;
      padding-bottom: 2vh;
      overflow-y: auto;
      .w30,
      .w20,
      .w45 {
        width: 100%;
      }
      .w10 {
        width: 20%;
      }
      .w20a {
        width: 40%;
      }
      .desktop {
        display: none;
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
    .btn-warning,
    .btn-success,
    .btn-delete {
      height: 9vh;
      width: 100%;
    }
    .btn-danger {
      font-size: 0.65rem !important;
    }
    .message {
      height: 7vh;
      width: 100vw;
      padding: 0 3vw;
      .font-destroy {
        min-width: 50%;
        text-align: start;
        font-size: 0.5rem;
        line-height: 0.7rem;
      }
      .bg-danger,
      .bg-success {
        line-height: 6vh;
      }
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
      height: 67.5vh;
      margin: 2vh 3vw 0 7vw;
      overflow-y: auto;

      .w30,
      .w20 {
        width: 50%;
      }
      .landscape {
        margin-right: 50%;
      }
      .w45 {
        width: 100%;
      }
      .w10 {
        width: 20%;
      }
      .w20a {
        width: 40%;
      }
      .desktop {
        display: none;
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
      }
    }
    button {
      padding: 0;
      border-radius: 0;
    }
    .btn-warning,
    .btn-success,
    .btn-delete {
      height: 9vh;
      width: 50%;
    }
    .btn-danger {
      font-size: 0.8rem !important;
    }
    .message {
      height: 7vh;
      width: 100vw;
      padding: 0 7.5vw !important;
      .font-destroy {
        min-width: 50%;
        text-align: start;
        font-size: 0.5rem;
        line-height: 0.7rem;
      }
      .bg-danger,
      .bg-success {
        line-height: 6vh;
      }
    }
  }
}
</style>
