require('dotenv').config()
const httpStatus = require('http-status')
const Sequelize = require('sequelize')

const db = require('../models')

const Op = Sequelize.Op

const Stock = db.stock
const Rayon = db.rayon
const Family = db.family

const curr = new Date()
//  console.log('getDay()', curr.getDay())
let jan4 = new Date(curr.getFullYear(), 0, 4)
let dayDiff = (curr - jan4) / 86400000
let currentWeek = ''
if (new Date(curr.getFullYear(), 0, 1).getDay() < 5) {
    currentWeek = `${curr.getFullYear()}-W${1 + Math.ceil(dayDiff / 7)}`
} else {
    if(curr.getDay() === 1) {
        currentWeek = `${curr.getFullYear()}-W${Math.ceil(((dayDiff) / 7) + 1)}`
    } else {
        currentWeek = `${curr.getFullYear()}-W${Math.ceil((dayDiff) / 7)}`
    }
}

exports.findAllDepartements = (req, res) => {
    Family.findAll({
        attributes: { exclude: ['createdAt', 'updatedAt'] },
    })
        .then((response) => {
            // console.log('response', response)
            Rayon.findAll({
                attributes: {
                    exclude: ['category_text', 'createdAt', 'updatedAt']
                }
            }).then((responseTwoo) => {
                let resultFamily = []
                let categories = []

                for (let n = 0; n < responseTwoo.length; n++) {
                    //  console.log(responseTwoo[n].family_abbreviation, response[i].id)
                    categories.push({
                        category_id: responseTwoo[n].id,
                        family_abbreviation: responseTwoo[n].family_abbreviation,
                        category_abbreviation: responseTwoo[n].category_abbreviation,
                        category_cat: responseTwoo[n].cat,
                        category_description: responseTwoo[n].category_description,
                        category_products: responseTwoo[n].products
                    })
                }              
                //console.log(categories)
                for (let i = 0; i < response.length; i++) {
                    resultFamily.push({
                        family_id: response[i].id,
                        family_description: response[i].family_description,
                        family_abbreviation: response[i].family_abbreviation,
                        family_sass: response[i].family_sass,
                        categories: categories
                    })
                }
                //  console.log(resultFamily)
                resultFamily.forEach(family => {
                    //  console.log(family.categories)
                    let categories = family.categories 
                    function toFilter (element) {
                        if(element.family_abbreviation === family.family_id) {
                            return element.categories + ' ' + family.family_description
                        }
                    }
                    const filterCategory = categories.filter(toFilter)
                    if(filterCategory[0] != undefined && family.family_id === filterCategory[0].family_abbreviation) {
                        // console.log(family.family_description+''+filterCategory)
                        family.categories = filterCategory
                    }
                })
                res.status(httpStatus.OK).send(resultFamily)
            })
        })
        .catch((err) => {
            console.log('err', err)
        })
}
exports.findAllCurrentDepartements = (req, res) => {
    // console.log('currentWeek', currentWeek)
    Family.findAll({
        attributes: { exclude: ['createdAt', 'updatedAt'] },
    })
        .then((response) => {
            // console.log('response', response)
            Rayon.findAll({
                attributes: {
                    exclude: ['category_text', 'createdAt', 'updatedAt']
                }
            }).then((responseTwoo) => {
                let resultFamily = []
                let categories = []
                Stock.findAll({
                    where: {
                        week: currentWeek
                    },
                    group: ['departement'],
                    attributes: ['departement'],
                }).then(responseCS => {
                    const currFamilies = []
                    for(let i = 0; i < responseCS.length ; i++) {
                        let split = responseCS[i].departement.split('_') 
                        currFamilies.push({
                            departement: responseCS[i].departement,
                            familyId: split[0],
                            categoryId: split[1]
                        })
                    }                    
                    //console.log('currFamilies', currFamilies)
                    for (let n = 0; n < responseTwoo.length; n++) {
                    //  console.log(responseTwoo[n].family_abbreviation, response[i].id)
                        categories.push({
                            category_id: responseTwoo[n].id,
                            family_abbreviation: responseTwoo[n].family_abbreviation,
                            category_abbreviation: responseTwoo[n].category_abbreviation,
                            category_cat: responseTwoo[n].cat,
                            category_description: responseTwoo[n].category_description,
                            category_products: responseTwoo[n].products,
                            catCurr: currFamilies
                        })
                    }              
                    //console.log(categories)
                    const currentCategories = []
                    categories.forEach(category => {
                        let currCategories = category.catCurr
                        function toFilter (element) {
                        //console.log(element.familyId)                           
                        //console.log(family.family_id)                           
                            if(element.categoryId === category.category_id.toString()) {
                            // console.log(element.familyId)                           
                                return element.currCategories + ' ' + category.category_description
                            }
                        }
                    
                        const filterCurrCategory = currCategories.filter(toFilter)
                        if(filterCurrCategory[0] != undefined && category.category_id.toString() === filterCurrCategory[0].categoryId) {
                            // console.log(family.family_description+''+filterCurrCategory)
                            currentCategories.push({
                                category_id: category.category_id,
                                family_abbreviation: category.family_abbreviation,
                                category_abbreviation: category.category_abbreviation,
                                category_cat: category.category_cat,
                                category_description: category.category_description,
                                category_products: category.category_products,
                            })
                        }
                    })

                    //  console.log('currentCategories', currentCategories)
                    //console.log('categories', categories)
                    for (let i = 0; i < response.length; i++) {
                        resultFamily.push({
                            family_id: response[i].id,
                            family_description: response[i].family_description,
                            family_abbreviation: response[i].family_abbreviation,
                            family_sass: response[i].family_sass,
                            categories: currentCategories,
                        })
                    }
                
                    // console.log(resultFamily)
                    resultFamily.forEach(family => {
                    //  console.log(family.categories)
                        let categories = family.categories                        
                        function toFilter (element) {
                            if(element.family_abbreviation === family.family_id) {
                                return element.categories + ' ' + family.family_description
                            }
                        }
                        const filterCategory = categories.filter(toFilter)
                        if(filterCategory[0] != undefined && family.family_id === filterCategory[0].family_abbreviation) {
                        // console.log(family.family_description+''+filterCategory)
                            family.categories = filterCategory
                        }
                    })
                    // console.log('resultFamily', resultFamily)
                    res.status(httpStatus.OK).send(resultFamily)
                })
            })
        })
        .catch((err) => {
            console.log('err', err)
        })
}
exports.findDepartement = (req, res) => {    
    //console.log('req', req.query)
    Rayon.findOne({
        where: {
            family_abbreviation: req.query.departement[0],
            id: req.query.departement[2]
        },
        attributes: { exclude: ['category_text', 'category_description', 'products', 'createdAt', 'updatedAt'] },

    }).then((response) => {
        res.status(httpStatus.OK).send(response)
    })
        .catch((err) => {
            console.log('err', err)
        })
}
exports.findAllFamilies = (req, res) => {
    Family.findAll({
        attributes: { exclude: ['createdAt', 'updatedAt'] },
    }).then((response) => {
    //console.log('response', response)
        let resultFamily = []
        for (let i = 0; i < response.length; i++) {
            resultFamily.push({
                family_id: response[i].id,
                family_description: response[i].family_description,
                family_abbreviation: response[i].family_abbreviation,
                family_sass: response[i].family_sass,
            })
        }
        //console.log('resultFamily', resultFamily)
        res.status(httpStatus.OK).send(resultFamily)
    })
}
exports.findFamily = (req, res) => {
    const family_abbreviation = req.query.family_abbreviation
    //console.log('family_abbreviation', family_abbreviation)
    Family.findOne({
        attributes: { exclude: ['createdAt', 'updatedAt'] },
        where: {
            family_abbreviation: family_abbreviation,
        },
    })
        .then((response) => {
            // console.log('response', response)
            res.status(httpStatus.OK).send(response)
        })
        .catch((err) => {
            console.log('err', err)
            res
                .status(httpStatus.INTERNAL_SERVER_ERROR)
                .send({ message: err.message })
        })
}
exports.findAllCategories = (req, res) => {
    Rayon.findAll({
        attributes: { exclude: ['category_text', 'createdAt', 'updatedAt'] },
    }).then((response) => {
    //console.log('response', response.articles)
        const resultCategory = []
        for (let i = 0; i < response.length; i++) {
            resultCategory.push({
                category_id: response[i].id,
                family_abbreviation: response[i].family_abbreviation,
                category_abbreviation: response[i].category_abbreviation,
                category_description: response[i].category_description,
                cat_description: response[i].cat_description,
                family_sass: response[i].family_sass,
                rayon: `${response[i].family_abbreviation}_${response[i].category_abbreviation}`,
            })
        }
        //console.log('resultCategory', resultCategory)
        res.status(httpStatus.OK).send(resultCategory)
    })
}
exports.findAllInCurrentFamily = (req, res) => {
    // console.log('req', req.query)
    //1 si toute la gamme de response de la catégorie
    //< 1 si une seule gamme d'une catégorie
    //console.log('lengthCat_prod', lengthCat_prod)
    if (req.query.rayon[2]) {
        const familyId = req.query.rayon[0]
        const categoryId = req.query.rayon[2]
        Rayon.findByPk(categoryId).then((response) => {
            // console.log('response', response)
            //  console.log('category', category)
            const departement = `${familyId}_${categoryId}`
            //console.log('departement', departement)          
            Stock.findAll({
                where: {
                    departement: departement,
                    week: currentWeek,
                },
                attributes: {exclude: ['createdAt', 'updatedAt']},
                order: [
                    ['name', 'ASC'],
                ],
            })
                .then(allProducts => {
                //    console.log('allProducts', allProducts)
                    const productsCurr = []
                    const varieties = []
                    for(let i in allProducts) {
                        let idSplit = allProducts[i].id_prod.split('_')
                        let idArticle = idSplit[2]
                        let idVariety = idSplit[3] 
                        if(idVariety) {
                            varieties.push({
                                departement: allProducts[i].departement,
                                idStock: allProducts[i].id,
                                idArticle: idArticle,
                                ref: allProducts[i].id_prod,
                                idVariety: idVariety,
                                variety: allProducts[i].variety,
                                agr: allProducts[i].agr,
                                loc: allProducts[i].loc,
                                four: allProducts[i].four,
                                mes: allProducts[i].mes,
                                cond: allProducts[i].cond,
                                quantity: Math.round(Number(allProducts[i].quantity)),
                                marge: allProducts[i].marge,
                            })
                            productsCurr.push({
                                departement: allProducts[i].departement,
                                idArticle: idArticle,
                                ref: allProducts[i].id_prod,
                                name: allProducts[i].name,
                                agr: allProducts[i].agr,
                                loc: allProducts[i].loc,
                                four: allProducts[i].four,
                                mes: allProducts[i].mes,
                                cond: allProducts[i].cond,
                                quantity: allProducts[i].quantity,
                                marge: allProducts[i].marge,
                                varieties: varieties
                            })
                        } else {           
                            productsCurr.push({
                                departement: allProducts[i].departement,
                                idStock: allProducts[i].id,
                                idArticle: idArticle,
                                ref: allProducts[i].id_prod,
                                name: allProducts[i].name,
                                agr: allProducts[i].agr,
                                loc: allProducts[i].loc,
                                four: allProducts[i].four,
                                mes: allProducts[i].mes,
                                cond: allProducts[i].cond,
                                quantity: Math.round(Number(allProducts[i].quantity)),
                                marge: allProducts[i].marge,
                                varieties: varieties                        
                            })
                        }
                    }
                    productsCurr.forEach(product => {
                        let varieties = product.varieties 
                        function toFilter (element) {
                            if(product.varieties && element.idArticle === product.idArticle) {
                                return element.varieties + ' ' + product.name
                            }
                        }
                        const filterVariety = varieties.filter(toFilter)
                        if(filterVariety[0] != undefined && product.idArticle === filterVariety[0].idArticle) {
                            // console.log(family.family_description+''+filterCategory)    
                            product.idArticle = '',
                            product.idStock = '',
                            product.ref = '',
                            product.agr = '',
                            product.loc = '',
                            product.four = '',
                            product.mes = '',
                            product.cond = '',
                            product.quantity = '',
                            product.marge = '',
                            product.varieties = filterVariety
                        } else {
                            product.varieties = ''
                        }
                    })
                    const productsReduce = productsCurr.reduce((unique, o) => {
                        if(!unique.some(obj => obj.name === o.name)) {
                            unique.push(o)
                        }
                        return unique
                    },[])
                    // console.log('productsReduce', productsReduce)
                    const result = [
                        {
                            category_id: response.id,
                            family_id: response.family_abbreviation,
                            family_category: response.cat_description,
                            category_description: response.category_description,
                            category_abbreviation: response.cat,
                            products: productsReduce
                        }]
                    res.status(httpStatus.OK).send({ result })
                })
        })
    } else {
        const family = req.query.rayon[0]
        //console.log('family', family)
        Stock.findAll({
            where: {
                departement: {
                    [Op.like]: `${family}%`
                },
                week: currentWeek
            },
            attributes: {exclude: ['createdAt', 'updatedAt']},
            order: [
                ['departement', 'ASC'],
                ['name', 'ASC'],
            ],
        })
            .then(allProducts => {
                //  console.log('allProducts', allProducts)   
                const productsCurr = []
                const varieties = []
                const currCategories = []
                for(let i in allProducts) {
                    let category = allProducts[i].departement[2]
                    currCategories.push({
                        categoryId: category
                    })
                    let idSplit = allProducts[i].id_prod.split('_')
                    let idArticle = idSplit[2]
                    let idVariety = idSplit[3] 
                    if(idVariety) {
                        varieties.push({
                            departement: allProducts[i].departement,
                            idStock: allProducts[i].id,
                            idArticle: idArticle,
                            ref: allProducts[i].id_prod,
                            idVariety: idVariety,
                            variety: allProducts[i].variety,
                            agr: allProducts[i].agr,
                            loc: allProducts[i].loc,
                            four: allProducts[i].four,
                            mes: allProducts[i].mes,
                            cond: allProducts[i].cond,
                            quantity: Math.round(Number(allProducts[i].quantity)),
                            marge: allProducts[i].marge,
                        })              
                        productsCurr.push({
                            departement: allProducts[i].departement,
                            idStock: allProducts[i].id,
                            idArticle: idArticle,
                            ref: allProducts[i].id_prod,
                            name: allProducts[i].name,
                            agr: allProducts[i].agr,
                            loc: allProducts[i].loc,
                            four: allProducts[i].four,
                            mes: allProducts[i].mes,
                            cond: allProducts[i].cond,
                            quantity: Math.round(Number(allProducts[i].quantity)),
                            marge: allProducts[i].marge,
                            varieties: varieties
                        })
                    } else {           
                        productsCurr.push({
                            departement: allProducts[i].departement,
                            idStock: allProducts[i].id,
                            idArticle: idArticle,
                            ref: allProducts[i].id_prod,
                            name: allProducts[i].name,
                            agr: allProducts[i].agr,
                            loc: allProducts[i].loc,
                            four: allProducts[i].four,
                            mes: allProducts[i].mes,
                            cond: allProducts[i].cond,
                            quantity: Math.round(Number(allProducts[i].quantity)),
                            marge: allProducts[i].marge,
                            varieties: varieties                        
                        })
                    }
                }
                productsCurr.forEach(product => {
                    let varieties = product.varieties 
                    function toFilter (element) {
                        if(product.varieties && element.idArticle === product.idArticle) {
                            return element.varieties + ' ' + product.name
                        }
                    }
                    const filterVariety = varieties.filter(toFilter)
                    if(filterVariety[0] != undefined && product.idArticle === filterVariety[0].idArticle) {
                        // console.log(family.family_description+''+filterCategory)    
                        product.idStock = '',
                        product.idArticle = '',
                        product.ref = '',
                        product.agr = '',
                        product.loc = '',
                        product.four = '',
                        product.mes = '',
                        product.cond = '',
                        product.quantity = '',
                        product.marge = '',
                        product.varieties = filterVariety
                    } else {
                        product.varieties = ''
                    }               
                })
                const productsReduce = productsCurr.reduce((unique, o) => {
                    if(!unique.some(obj => obj.name === o.name)) {
                        unique.push(o)
                    }
                    return unique
                },[])
                //   console.log('newProducts', productsReduce)
                Rayon.findAll({
                    where: {
                        family_abbreviation: family,
                    }, 
                    attributes: {
                        exclude: ['category_text', 'createdAt', 'updatedAt']
                    }
                }).then((response) => {
                    const categories = []
                    for(let i = 0; i < response.length; i++) {
                        let category = {
                            category_id: response[i].id,
                            family_id: response[i].family_abbreviation,
                            family_category: response[i].cat_description,
                            category_description: response[i].category_description,
                            category_abbreviation: response[i].cat,
                            cat_abbreviation: response[i].category_abbreviation,
                        }
                        categories.push(category)
                    }  
                    const resultCat = []                     
                    // console.log('currCategories', currCategories)
                    // console.log('categories', categories)
                    categories.forEach(el => {
                        // console.log('el.cat_abbreviation', el.cat_abbreviation)
                        currCategories.forEach(e => {
                            // console.log('e.categoryId', e.categoryId)
                            if(el.category_id.toString() === e.categoryId) {
                                // console.log('e.categoryId', e.categoryId)
                                resultCat.push({
                                    category_abbreviation: el.category_abbreviation,
                                    category_description: el.category_description,
                                    category_id: el.category_id,
                                    family_category: el.family_category,
                                    family_id: el.family_id,
                                    cat_abbreviation: el.cat_abbreviation
                                })
                            }
                        })
                    })
                    //  console.log('resultCat', resultCat)
                    const products = []
                    resultCat.forEach(cat => {
                        productsReduce.forEach(prod => {
                            if(prod.departement[2] === cat.category_id.toString()) {
                                products.push({
                                    departement: prod.departement,
                                    idStock: prod.idStock,
                                    idArticle: prod.idArticle,
                                    ref: prod.ref,
                                    name: prod.name,
                                    agr: prod.agr,
                                    loc: prod.loc,
                                    four: prod.four,
                                    mes: prod.mes,
                                    cond: prod.cond,
                                    quantity:  Math.round(Number(prod.quantity)),
                                    marge: prod.marge,
                                    varieties: prod.varieties
                                })
                            }
                        })
                        function prodToCat(e) {
                            if(e.departement[2] === cat.category_id.toString()) {
                                return e.name + ' ' + cat.category_description
                            }
                        }
                        //  console.log('product', products)
                        const filterProduct = products.filter(prodToCat)
                        if(filterProduct[0] != undefined && cat.category_id.toString() === filterProduct[0].departement[2]) {
                            cat.products = filterProduct
                        }
                    })
                    const result = resultCat.reduce((unique, o) => {
                        if(!unique.some(obj => obj.category_id
                            === o.category_id
                        )) {
                            unique.push(o)
                        }
                        return unique
                    },[])
                    //console.log('result', result)
                    res.status(httpStatus.OK).send({ result })                
                }) 
            })
    }
}
exports.findAllInCart = (req, res) => {
    // console.log('req', req.query.ref)
    const articles = req.query.ref  
    // console.log('articles', articles)
    Stock.findAll({
        where: {
            id_prod: {
                [Op.in]: articles
            },
            week: currentWeek
        },
        order: [['departement', 'ASC'], ['name', 'ASC']],
        attributes: {
            exclude: ['user_id', 'clone', 'pf', 'marge', 'stock_arrival', 'stock_current', 'week', 'createdAt', 'updatedAt']
        }
    }).then(inStock => {
        Stock.findAll({
            where: {
                id_prod: {
                    [Op.notIn]: articles
                },
                week: currentWeek
            },
            order: [['departement', 'ASC'], ['pf', 'DESC']],
            group: 'departement',
            attributes: {
                exclude: ['user_id', 'clone', 'stock_arrival', 'stock_current', 'week', 'createdAt', 'updatedAt']
            }
        }).then(discover => {
            if(inStock.length < articles.length) {
                const notFound = articles.filter((cart) => 
                    inStock.filter((stock) => stock.id_prod === cart).length === 0)
                //   console.log(notFound)
                Stock.findAll({
                    where: {
                        id_prod: {
                            [Op.in]: notFound
                        }
                    },
                    order: [['departement', 'ASC'], ['name', 'ASC']],
                    group: 'id_prod',
                    attributes: {
                        exclude: ['user_id', 'clone', 'pf', 'marge', 'stock_arrival', 'stock_current', 'week', 'createdAt', 'updatedAt']
                    }
                }).then(soldOut => {
                    //   console.log('soldOut', soldOut)
                    res.status(httpStatus.OK).send({ inStock, soldOut, discover })            
                })
            } else {
                res.status(httpStatus.OK).send({ inStock, discover })            
            }
        })
    })
}
exports.findArticle = (req, res) => {
    //console.log('req', req.query.type)
    const query = req.query
    //  console.log('query', query.value)
    if(query.type === 'product') {
        //console.log('value', query.value)      
        Stock.findOne({
            where: {
                id: query.value,
                week: currentWeek
            },
            attributes: { exclude: ['user_id', 'createdAt', 'updatedAt'] }
        }).then(response => {
            //  console.log('response', response)
            res.status(httpStatus.OK).send({ response })
        })
            .catch((err) => {
                res
                    .status(httpStatus.INTERNAL_SERVER_ERROR)
                    .send({ message: err.message })
            })
    } else {
        if(query.type === 'category') {
            // console.log('value', query.value)
            Rayon.findOne({
                where: {
                    id: query.value
                },
                attributes: { exclude: ['products', 'createdAt', 'updatedAt'] }
            }).then(response => {
                // console.log('response', response)
                res.status(httpStatus.OK).send({ response })
            })
                .catch((err) => {
                    res
                        .status(httpStatus.INTERNAL_SERVER_ERROR)
                        .send({ message: err.message })
                })
        } else {
            //console.log('value', query.value)
            Family.findOne({
                where: {
                    id: query.value
                },
                attributes: { exclude: ['family_abbreviation', 'createdAt', 'updatedAt'] }
            }).then(response => {
                // console.log('response', response)
                res.status(httpStatus.OK).send({ response })
            })
                .catch((err) => {
                    res
                        .status(httpStatus.INTERNAL_SERVER_ERROR)
                        .send({ message: err.message })
                })
        }
    }
}
exports.SearchAllWeekArticles = (req, res) => {
    // console.log('req', req.query.search)
    Stock.findAll({
        where: {  
            week: currentWeek,  
            [Op.or]: [{name: {
                [Op.like]: `${req.query.search}%`,
            }}, {variety: {
                [Op.like]: `${req.query.search}%`,
            }}]
        },
        order: [
            ['name', 'ASC'],
            ['variety', 'ASC'],
        ],
        attributes: ['id', 'id_prod', 'name', 'variety'],
    })
        .then((response) => {
            const result = []
            for(let i in response) {
                result.push({
                    id: response[i].id,  
                    ref: response[i].id_prod,  
                    name: response[i].name,  
                    variety: response[i].variety,  
                })
            }
            // console.log('result', result)
            res.status(httpStatus.OK).send({ result })
        })
        .catch((err) => {
            res
                .status(httpStatus.INTERNAL_SERVER_ERROR)
                .send({ message: err.message })
        })
}
exports.findStock = (req, res) => {
    const credential = req.query
    //console.log('credential', credential.departement)
    Stock.findAll({
        where: {
            week: credential.week,
            id_prod: {
                [Op.like]: `${credential.departement}%`,
            },
        }
    })
        .then(products => {
            //console.log('products', products)
            res.status(httpStatus.OK).send({ products })
            //Pour l'exemple Projet AC Customer       
        })
}
exports.findDepartementsInStock = (req, res) => {
    const credential = req.query
    //console.log('credential', credential)
    Stock.findAll({
        where: {
            week: credential.week,
        },
        attributes: [
            'departement'
        ],
        group: ['departement']
    })
        .then(departements => {
            // console.log('departements', departements)
            res.status(httpStatus.OK).send({ departements })
        })
}