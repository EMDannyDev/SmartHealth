import { response } from "express";
import { getUser } from "./database.js";

export default function (app) {

    app.get('/users/:id', async (req, res) => {
        const users = await getUser(req.params.id);
        res.status(200).send(users);
    });


};
