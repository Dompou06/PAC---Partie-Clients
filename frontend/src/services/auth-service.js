import store from '../store'
import api from './api'

export default {
 
  /**
 * @name signUp
 * @description Requête vers le backend d'inscription'
 * @param {Object} credentials
 * 
 * @returns {object} response
 */
  async signUp(credentials) {
    //console.log(credentials)
    return await api
      .post('auth/signup', credentials)
      .then(response => {
        if (response.data.token) {
          return response.data
        } else {
          return 'Inscription impossible'
        }
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },
  /**
 * @name signIn
 * @description Requête vers le backend de connexion à un compte utilisateur
 * @param {Object} credentials
 * 
 * @returns {object} response
 */
  async signIn(credentials) { 
    // console.log(credentials)
    return await api
      .post('auth/signin', credentials)
      .then(response => {
        //console.log('response', response)
        if (response.data.token) {
          return response.data
        } else {
          return 'Utilisateur inconnu'
        }
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },
  /**
 * @name verifyMail
 * @description Requête vers le backend d'envoi d'un email pour mot de passe oublié
 * @param {object} credential 
 * 
 */
  async verifyMail(credential) {
    let urlSite = 'http://localhost:8080'
    const sendData = {
      email: credential.email,
      subject: 'Réinitialisation de votre mot de passe',
      text: `Bonjour,\n
      nous avons bien reçu votre demande de mot de passe. 
      Rendez-vous à l'adresse suivante (http://localhost:8080/compte/password) pour le modifier dans un délai de 24 h.\n
      Si vous n'avez pas demandé à réinitialiser votre mot de passe, vous pouvez ignorer cet email.\n
      A très bientôt\n
      L'équipe de DPStudio
      `,
      html: `<body>
     <h1>DPStudio</h1>
     <p><h2>Réinitialisation de votre mot de passe</h2></p>
     <p>Bonjour,</p>
     <p>nous avons bien reçu votre demande de mot de passe. 
     Cliquez sur le lien ci-dessous pour le modifier dans un délai de 24 h.</p>
     <p><a href="${urlSite}/compte/password" target="_blank">Modifier mon mot de passe</a></p>
     <p>Si vous n'avez pas demandé à réinitialiser votre mot de passe, vous pouvez ignorer cet email.</p>
     <p>A très bientôt</p>
     <p>L'équipe de DPStudio</p>
     </body>`,
      attachments: []
    }
    return await api
      .post('auth/listpassword', sendData)
  },
  async newPassword(credentials) {
    console.log('credentials', credentials)
    return await api
      .post('auth/newpassword', credentials)
      .then(response => {
        // console.log('response', response)
        if (response.data) {
          return response.data
        } else {
          const response = { 
            message: 'Utilisateur inconnu'
          }
          return response
        }
      })
      .catch(() => {
        const response = { 
          message: 'Requête impossible'
        }
        return response
      })
  },

  /**
 * @name findMe
 * @description Requête vers le backend des données utilisateur
 * 
 * @returns {object} response
 */
  async findMe() {
    const token = store.getters['auth/token']
    //console.log('token',token)
    return await api
      .get('auth/me', {
        headers: {
          'x-access-token': token
        },
        token
      })
      .then(response => {
        const profile = {
          firstname: response.data.firstname,
          lastname: response.data.lastname,
          email: response.data.email,
        }
        return profile 
      })
    /* .catch(() => {
        //   return 'Erreur Server'
      })   */ 
  },
  /**
 * @name profileUser
 * @description Requête vers le backend des données du compte utilisateur
 * 
 * @returns {object} response
 */
  async profileUser() {
    const token = store.getters['auth/token']
    return await api
      .get('auth/profile', {
        headers: {
          'x-access-token': token
        },
        token
      })
      .then(response => {
        // console.log(response)        
        const contact = {
          mobile: response.data.userObject.mobile,
          phone: response.data.userObject.phone,
          fax: response.data.userObject.fax,
          society: response.data.userObject.society,
          address: response.data.userObject.address,
          cp: response.data.userObject.cp,
          city: response.data.userObject.city,
          state: response.data.userObject.state,
          billing_address: response.data.userObject.billing_address,
          delivery_address: response.data.userObject.delivery_address
        }
        return contact 
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },
  /**
 * @name updateMe
 * @description Requête vers le backend de mise à jour du compte utilisateur
 * @param {object} credentials 
 * 
 * @returns {object} result
 */
  async updateMe(credentials) {
    const token = store.getters['auth/token']
    return await api
      .post('auth/update/profile', {
        headers: {
          'x-access-token': token
        },
        credentials
      }).then(response => {
        const result = response.data.newProfile
        return result
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },
  /**
 * @name deleteContactMe
 * @description Requête vers le backend de suppression du compte utilisateur
 * 
 * @returns {string} response token
 */
  async deleteContactMe() {
    const token = store.getters['auth/token']
    return await api
      .get('auth/delete/profile', {
        headers: {
          'x-access-token': token
        }
      })
      .then(response => {
        if(response) {
          return response.data.token
        }
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },
  /**
 * @name deleteAccountMe
 * @description Requête vers le backend de suppression du compte utilisateur
 * 
 */
  async deleteAccountMe() {
    const token = store.getters['auth/token']
    return await api
      .get('auth/delete/user', {
        headers: {
          'x-access-token': token
        }
      }).then(response => {
        //On supprime la clé user du LocalStorage
        localStorage.removeItem('user')
      }).catch(() => {
        return 'Erreur Server'
      })
  },
  /**
 * @name logout
 * @description Requête vers le backend de suppression du refreshoken
 * @param {string} credential (token) 
 *
 *  */
  async logout() {
    const token = store.getters['auth/token']
    return await api
      .get('auth/logout', {
        headers: {
          'x-access-token': token
        }
      }).then(response => {
        //On supprime la clé user du LocalStorage
        localStorage.removeItem('user')
      })
  }
}