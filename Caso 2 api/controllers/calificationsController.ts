import { data_calificaciones } from '../repositories/data_califications'
import { Logger } from '../common'


export class CalificationsController {
    private static instance: CalificationsController;
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

    public static getInstance() : CalificationsController
    {
        if (!this.instance)
        {
            this.instance = new CalificationsController();
        }
        return this.instance;
    }

    public listCalifications(idUser, idPlan, califications) : Promise<any> 
    {
        const dynamo = new data_calificaciones();
        return dynamo.getCalifications(idUser, idPlan, califications);
    }
}