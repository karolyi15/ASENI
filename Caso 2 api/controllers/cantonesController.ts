import { data_cantones } from '../repositories/data_cantones'
import { Logger } from '../common'


export class CantonesController {
    private static instance: CantonesController;
    private log: Logger;

    private constructor()
    {
        this.log = new Logger();
        try
        {
        } catch (e)
        {
            this.log.error(e);
        }
    }

    public static getInstance() : CantonesController
    {
        if (!this.instance)
        {
            this.instance = new CantonesController();
        }
        return this.instance;
    }

    public listCantones(electionDate) : Promise<any> 
    {
        const dynamo = new data_cantones();
        return dynamo.getCantones(electionDate);
    }
}