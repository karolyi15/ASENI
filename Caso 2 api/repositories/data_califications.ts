import { Logger } from '../common'


export class data_calificaciones {
    private log: Logger;

    private sql = require("mssql");

    private config = {
        server: "localhost\\SERVIDORSQL",
        port: 1433,
        user: "sa",
        password: "sa",
        database: "Aseni",
        trustServerCertificate: true,
        options: {
            enableArithAbort: true,
        },
        connectionTimeout: 150000,
        pool: {
            max: 10,
            min: 2,
            idleTimeoutMillis: 3000,
        },
    };
    private static instance: data_calificaciones;
    private pool;
    private poolConnect;

    public constructor()
    {
        this.log = new Logger();
        try
        {
        } catch (e)
        {
            this.log.error(e);
        }
    }

    public getCalifications(idUser, idPlan, califications) : Promise<any>
    {
        return this.sql.connect(this.config).then((pool) => {
            return pool.request()
            .input('IdUser', idUser)
            .input('IdPlan', idPlan)
            .input('Califications', califications)
            .execute(`Aseni_SetCalificationsByUser`)
          })
    }

}