const cors = require('cors');
const express = require('express');
require('dotenv').config();

const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

const app = express();

app.use(express.json());
app.use(cors());

app.get('/', (req, res)=>{
    res.send("Hola desde el back");
})

app.listen(8000,()=>{
    console.log("Servidor iniciado en el puerto 8000")
}) 