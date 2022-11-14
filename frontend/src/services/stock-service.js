import api from './api'

export default {
  /**
 * @name listArticles
 * @description Requête vers le backend Liste d'articles
 * @param {string} credential
 * 
 * @returns {object} response
 */
  listCurrentDepartements() {
    return api
      .get('stock/currentdepartements')
      .then(response => {
        //console.log('response', response.data)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },
  listDepartements() {
    return api
      .get('stock/departements')
      .then(response => {
      //  console.log('response', response.data)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },
  /*listFamilies() {
    return api
      .get('stock/families')
      .then(response => {
        //console.log('response', response.data)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },*/
  /* listAllCategories() {
    return api
      .get('stock/allcategories')
      .then(response => {
        //console.log('response', response.data)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },*/
  /*findAllCategories() {
    return api
      .get('stock/allcategories')
      .then(response => {
        //console.log('response', response.data)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },*/
  /* listCategories(credential) {
    //console.log('credential', credential)
    return api
      .get('stock/categories', {
        params: {
          family_abbreviation: credential
        }
      })
      .then(response => {
        //console.log('response', response.data.resultCategories)
        return response.data.resultCategories
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },*/
  /*family(credential) {
    //console.log('credential', credential)
    return api
      .get('stock/family', {
        params: {
          family_abbreviation: credential
        }
      })
      .then(response => {
        //console.log('response', response)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },*/
  /*category(credential) {
    // console.log('credential', credential)
    return api
      .get('stock/category', {
        params: {
          category_abbreviation: credential
        }
      })
      .then(response => {
        //console.log('response', response)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
  },*/
  /*listCurrentArticles(credentials) {
  //  console.log('credentials', credentials)
    return api
      .get('stock/currentstock', {
        params: {
          week: credentials.week,
          rayon: credentials.departement
        }
      }).then(response => {
        // console.log('response', response)
      })
  },*/
  find(credentials) {
  //  console.log('credentials', credentials)
    return api
      .get('stock/currentarticle', {
        params: {
          type: credentials.type,
          value: credentials.value,
        }
      }).then(response => {
      //  console.log('response', response.data)
        return response.data
      })
  },
  findCart(credentials) {
    // console.log('credentials', credential)
    return api
      .get('stock/cart', {
        params: {
          ref: credentials
        }
      }).then(response => {
        //console.log('response', response.data)
        return response.data
      })
  },
  /*listArticles(credential) {
    // console.log('credential', credential)
    return api
      .get('stock/products', {
        params: {
          rayon: credential
        }
      })
      .then(response => {
      //  console.log('response', response.data.result)
        const result = response.data.result
        return result
      })
      .catch(() => {
        return 'Erreur Server'
      })
  }, */
  listWeekArticles(credential) {
    //console.log('credential', credential)
    return api
      .get('stock/week/products', {
        params: {
          rayon: credential
        }
      })
      .then(response => {
        //console.log('response', response.data.result)
        const result = response.data.result
        return result
      })
      .catch(() => {
        return 'Erreur Server'
      })
  }, 
  listArticlesByPage(credentials) {
    //console.log('credential', credentials)
    return api
      .get('stock/products/page', {
        params: {
          cat_prod: credentials.cat_prod,
          firstItem: credentials.firstItem,
          lastItem: credentials.lastItem
        }
      })
      .then(response => {
        //console.log('response', response)
        return response.data
      })
      .catch(() => {
        return 'Erreur Server'
      })
      
  },
  searchWeekArticles(credential) {
    return api
      .get('stock/weeksearch', {
        params: {
          search: credential
        }
      })
      .then(response => {
      // console.log('response', response)
        return response.data
      })
  },
}