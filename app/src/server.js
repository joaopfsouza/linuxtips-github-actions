import express from 'express'
import { soma } from './index.js'

const app = express()

app.get('/soma', (req, res) => {
    const { a=0, b=0 } = req.query
    res.json({resultado: soma(a,b)})
})

app.listen(3000, () =>
    console.log('Servidor escutando em http://localhost:3000/soma?a=1&b=2')
)