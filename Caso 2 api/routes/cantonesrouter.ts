import * as express from 'express';
import { Logger } from '../common'
import { CantonesController } from '../controllers/cantonesController'

const app = express();
const log = new Logger();

app.get("/list", (req, res,next) => {
    CantonesController.getInstance().listCantones(req.query.electionDate)
    .then((data)=>{
        res.json(data.recordset);
    })
    .catch((err)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
});

export { app as cantonesrouter };