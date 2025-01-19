import express from 'express';
import routes from './routes.js';

const app = express();
app.use(express.json());

routes(app);
console.log("test");

app.listen(3000, function () {
    console.log('App escucha en el puerto 3000');
});
