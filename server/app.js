import express from 'express';
import routes from './routes.js';
const app = express();

routes(app);

app.listen(3000, function () {
    console.log('App escucha en el puerto 3000');
});
