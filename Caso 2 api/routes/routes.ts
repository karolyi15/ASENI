import * as express from 'express';
import * as bodyParser from 'body-parser';
import { Logger } from '../common';
import {cantonesrouter} from './cantonesrouter';

class Routes {

    public express: express.Application;
    public logger: Logger;

    constructor() {
        this.express = express();
        this.logger = new Logger();

        this.middleware();
        this.routes();
    }

    // Configure Express middleware.
    private middleware(): void {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    }

    private routes(): void {
        this.express.use('/cantones', cantonesrouter);
        this.express.use('/califications', cantonesrouter);
    }
}

export default new Routes().express;