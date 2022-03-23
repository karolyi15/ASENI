import * as express from 'express';
import { Logger } from '../common'
import { CalificationsController } from '../controllers/calificationsController'

const app = express();
const log = new Logger();

app.post("/post", (req, res,next) => {
    CalificationsController.getInstance().listCalifications(req.query.idUser, req.query.idPlan, req.query.califications)
    .catch((err)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
});

export { app as calificationrouter };