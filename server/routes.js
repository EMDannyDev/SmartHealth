import { response } from "express";

export default function (app) {

    app.get('/', (require, response) => {
        response.json({ "Mensaje": "Get raiz correcto" });
    });


};
