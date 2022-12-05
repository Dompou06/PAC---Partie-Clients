const express = require('express')
const router = express.Router()

const stock = require('../controllers/stock.controller')

router.get('/departements', stock.findAllDepartements)
router.get('/currentdepartements', stock.findAllCurrentDepartements)
router.get('/departement', stock.findDepartement)
router.get('/stock/departement', stock.findDepartementsInStock)
router.get('/families', stock.findAllFamilies)
router.get('/family', stock.findFamily)
router.get('/allcategories', stock.findAllCategories)
router.get('/week/products', stock.findAllInCurrentFamily)
router.get('/cart', stock.findAllInCart)
router.get('/currentarticle', stock.findArticle)
router.get('/weeksearch', stock.SearchAllWeekArticles)
router.get('/stock', stock.findStock)

module.exports = router