import { Logger } from '../common'


export class data_cantones {
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
    private static instance: data_cantones;
    private pool;
    private poolConnect;

    public constructor()
    {
        this.log = new Logger();
        try
        {
            this.pool = new this.sql.ConnectionPool(this.config);
            this.poolConnect = this.pool.connect();

        } catch (e)
        {
            this.log.error(e);
        }
    }

    public getCantones(electionDate) : Promise<any>
    {
        return this.sql.connect(this.config).then((pool) => {
            return pool.request()
            .input('ElectionDate', electionDate)
            .execute(`Aseni_ListCantonsByDeliverables`)
          })
    }

}