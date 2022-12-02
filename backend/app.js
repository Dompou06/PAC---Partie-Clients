const express = require('express')
const app = express()
const cors = require('cors')
const helmet = require('helmet')
const mysqldump = require('mysqldump')
const fs = require('fs')

const httpStatus = require('http-status')
const CronJob = require('cron').CronJob
const { Op } = require('sequelize')

const db = require('./app/models')

const ListPassword = db.listpassword
const RefreshToken = db.refreshToken
const Stock = db.stock

let curr = new Date()
let jan4 = new Date(curr.getFullYear(), 0, 4)
let dayDiff = (curr - jan4) / 86400000

//Planification de tâches automatiques quotidiennes
const job = new CronJob('1 5 0 * * *', () => {
    let yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 19).replace('T', ' ')
    //Supression des lignes dans listpassword dont la création est précédente à la veille, à minuit et cinq minutes
    ListPassword.destroy({
        where: {
            createdAt: {
                [Op.lt]: yesterday,
            }
        }
    })
        .then()
        .catch(err => { console.log('erreur', err)})
    curr.setSeconds(curr.getSeconds())
    //Suppression des refreshToken expirés
    RefreshToken.destroy({
        where: {
            expiryDate: {
                [Op.lt]: curr.getTime(),
            }
        }
    })
}, null, true)
//Planification de tâches automatiques hebdomadaires
let lastWeek = ''
let currentWeek = ''
if (new Date(curr.getFullYear(), 0, 1).getDay() < 5) {
    lastWeek = `${curr.getFullYear()}-W${Math.ceil(dayDiff / 7)}`
    currentWeek = `${curr.getFullYear()}-W${1 + Math.ceil(dayDiff / 7)}`
} else {
    if(curr.getDay() === 1) {
        lastWeek = `${curr.getFullYear()}-W${Math.ceil(((dayDiff) / 7))}`
        currentWeek = `${curr.getFullYear()}-W${Math.ceil(((dayDiff) / 7) + 1)}`
    }
}    
//Sauvergarde hebdomadaire des bases de données
const jobWeek = new CronJob('1 5 0 * * 1', () => { 
    //console.log('lancement', lastWeek)
    const pathUser = `./app/dump/users/dumpUser${lastWeek}.sql`
    const pathStock = `./app/dump/stocks/dumpStock${lastWeek}.sql`
    try {
        if (fs.existsSync(pathUser)) {
            //file exists
            // console.log('file exists', lastWeek)
        } else {
            //console.log('file noexists', lastWeek) 
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB1,
                },
                dumpToFile: `./app/dump/users/dumpUser${lastWeek}.sql`,
            })
        }
        if (fs.existsSync(pathStock)) {
            //file exists
        } else {
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB2,
                },
                table: {
                    name: 'stocks'
                },
                dumpToFile: `./app/dump/stocks/dumpStock${lastWeek}.sql`,
            })
            Stock.findOne({
                where: {
                    week: currentWeek
                }
            }).then(response => {
                if(!response) {
                    Stock.findAll({
                        where: {
                            week: lastWeek
                        }
                    }).then(response => {
                        for(let i = 0; i < response.length; i++) {
                            let newProduct = {
                                week: currentWeek,
                                departement: response[i].departement,
                                user_id: '',
                                id_prod: response[i].id_prod,
                                name: response[i].name,
                                variety: response[i].variety,
                                description: response[i].description,
                                agr: response[i].agr,
                                loc: response[i].loc,
                                four: response[i].four,
                                mes: response[i].mes,
                                cond: response[i].cond,
                                pf: response[i].pf,
                                quantity: response[i].quantity,
                                arrival: response[i].arrival,
                                stock_arrival: response[i].stock_arrival,
                                stock_current: response[i].stock_current,
                                clone: response.week,
                            }
                            Stock.create(newProduct)  
                        }
                    }).catch(err => {
                        console.log('erreur', err)
                    })
                }
            })
        }
    } catch(err) {  
        console.log('err', err)  
    }
}, null, true)
//Vérification que les planifications ont bien eu lieu
//En cas de plantage de server le matin du lundi
const jobVerifMonday = new CronJob('1 40 9 * * 1', () => {
    //console.log('lancement', lastWeek)
    const pathUser = `./app/dump/users/dumpUser${lastWeek}.sql`
    const pathStock = `./app/dump/stocks/dumpStock${lastWeek}.sql`
    try {
        if (fs.existsSync(pathUser)) {
            //file exists
            // console.log('file exists', lastWeek)
        } else {
            //console.log('file noexists', lastWeek) 
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB1,
                },
                dumpToFile: `./app/dump/users/dumpUser${lastWeek}.sql`,
            })
        }
        if (fs.existsSync(pathStock)) {
            //file exists
        } else {
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB2,
                },
                table: {
                    name: 'stocks'
                },
                dumpToFile: `./app/dump/stocks/dumpStock${lastWeek}.sql`,
            })
            Stock.findOne({
                where: {
                    week: currentWeek
                }
            }).then(response => {
                if(!response) {
                    Stock.findAll({
                        where: {
                            week: lastWeek
                        }
                    }).then(response => {
                        for(let i = 0; i < response.length; i++) {
                            let newProduct = {
                                week: currentWeek,
                                departement: response[i].departement,
                                user_id: '',
                                id_prod: response[i].id_prod,
                                name: response[i].name,
                                variety: response[i].variety,
                                description: response[i].description,
                                agr: response[i].agr,
                                loc: response[i].loc,
                                four: response[i].four,
                                mes: response[i].mes,
                                cond: response[i].cond,
                                pf: response[i].pf,
                                quantity: response[i].quantity,
                                arrival: response[i].arrival,
                                stock_arrival: response[i].stock_arrival,
                                stock_current: response[i].stock_current,
                                clone: response.week,
                            }
                            Stock.create(newProduct)  
                        }
                    }).catch(err => {
                        console.log('erreur', err)
                    })
                }
            })
        }
    } catch(err) {  
        console.log('err', err)  
    }
}, null, true)
//En cas de lundi férié
const jobVerifTuesday = new CronJob('1 0 9 * * 2', () => {
    //console.log('lancement', lastWeek)
    const pathUser = `./app/dump/users/dumpUser${lastWeek}.sql`
    const pathStock = `./app/dump/stocks/dumpStock${lastWeek}.sql`
    try {
        if (fs.existsSync(pathUser)) {
            //file exists
            // console.log('file exists', lastWeek)
        } else {
            //console.log('file noexists', lastWeek) 
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB1,
                },
                dumpToFile: `./app/dump/users/dumpUser${lastWeek}.sql`,
            })
        }
        if (fs.existsSync(pathStock)) {
            //file exists
        } else {
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB2,
                },
                table: {
                    name: 'stocks'
                },
                dumpToFile: `./app/dump/stocks/dumpStock${lastWeek}.sql`,
            })
            Stock.findOne({
                where: {
                    week: currentWeek
                }
            }).then(response => {
                if(!response) {
                    Stock.findAll({
                        where: {
                            week: lastWeek
                        }
                    }).then(response => {
                        for(let i = 0; i < response.length; i++) {
                            let newProduct = {
                                week: currentWeek,
                                departement: response[i].departement,
                                user_id: '',
                                id_prod: response[i].id_prod,
                                name: response[i].name,
                                variety: response[i].variety,
                                description: response[i].description,
                                agr: response[i].agr,
                                loc: response[i].loc,
                                four: response[i].four,
                                mes: response[i].mes,
                                cond: response[i].cond,
                                pf: response[i].pf,
                                quantity: response[i].quantity,
                                arrival: response[i].arrival,
                                stock_arrival: response[i].stock_arrival,
                                stock_current: response[i].stock_current,
                                clone: response.week,
                            }
                            Stock.create(newProduct)  
                        }
                    }).catch(err => {
                        console.log('erreur', err)
                    })
                }
            })
        }
    } catch(err) {  
        console.log('err', err)  
    }
}, null, true)
//En cas de pont début de semaine
const jobVerifWednesday = new CronJob('1 0 9 * * 3', () => {
    //console.log('lancement', lastWeek)
    const pathUser = `./app/dump/users/dumpUser${lastWeek}.sql`
    const pathStock = `./app/dump/stocks/dumpStock${lastWeek}.sql`
    try {
        if (fs.existsSync(pathUser)) {
            //file exists
            // console.log('file exists', lastWeek)
        } else {
            //console.log('file noexists', lastWeek) 
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB1,
                },
                dumpToFile: `./app/dump/users/dumpUser${lastWeek}.sql`,
            })
        }
        if (fs.existsSync(pathStock)) {
            //file exists
        } else {
            mysqldump({
                connection: {
                    host: process.env.DBHOST,
                    user: process.env.DBUSER,
                    password: process.env.DBPASSWORD,
                    database: process.env.DB2,
                },
                table: {
                    name: 'stocks'
                },
                dumpToFile: `./app/dump/stocks/dumpStock${lastWeek}.sql`,
            })
            Stock.findOne({
                where: {
                    week: currentWeek
                }
            }).then(response => {
                if(!response) {
                    Stock.findAll({
                        where: {
                            week: lastWeek
                        }
                    }).then(response => {
                        for(let i = 0; i < response.length; i++) {
                            let newProduct = {
                                week: currentWeek,
                                departement: response[i].departement,
                                user_id: '',
                                id_prod: response[i].id_prod,
                                name: response[i].name,
                                variety: response[i].variety,
                                description: response[i].description,
                                agr: response[i].agr,
                                loc: response[i].loc,
                                four: response[i].four,
                                mes: response[i].mes,
                                cond: response[i].cond,
                                pf: response[i].pf,
                                quantity: response[i].quantity,
                                arrival: response[i].arrival,
                                stock_arrival: response[i].stock_arrival,
                                stock_current: response[i].stock_current,
                                clone: response.week,
                            }
                            Stock.create(newProduct)  
                        }
                    }).catch(err => {
                        console.log('erreur', err)
                    })
                }
            })
        }
    } catch(err) {  
        console.log('err', err)  
    }
}, null, true)


job.start()
jobWeek.start()
jobVerifMonday.start()
jobVerifTuesday.start()
jobVerifWednesday.start()

app.use(cors())
app.use(helmet())
app.use(express.urlencoded({ extended: true }))
app.use(express.json())

const authRoutes = require('./app/routes/auth.route')
const userRoutes = require('./app/routes/user.route')
const stockRoutes = require('./app/routes/stock.route')

app.use('/api/auth', authRoutes)
app.use('/api/users', userRoutes)
app.use('/api/stock', stockRoutes)
app.get('/', (req, res) => {
    res.json({ message: 'Bienvenue' })
})
app.get('*', (req, res) => {
    //console.log(req)
    return res.status((httpStatus.NOT_FOUND)).json({ error: 'Chemin invalide' })
})

module.exports = app