"use strict";
exports.__esModule = true;
exports.data_cantones = void 0;
var common_1 = require("../common");
var data_cantones = /** @class */ (function () {
    function data_cantones() {
        this.sql = require("mssql");
        this.config = {
            server: "localhost\\SERVIDORSQL",
            port: 1433,
            user: "sa",
            password: "sa",
            database: "Aseni",
            trustServerCertificate: true,
            options: {
                enableArithAbort: true
            },
            connectionTimeout: 150000,
            pool: {
                max: 10,
                min: 2,
                idleTimeoutMillis: 3000
            }
        };
        this.log = new common_1.Logger();
        try {
            this.pool = new this.sql.ConnectionPool(this.config);
            this.poolConnect = this.pool.connect();
        }
        catch (e) {
            this.log.error(e);
        }
    }
    data_cantones.prototype.getCantones = function (electionDate) {
        return this.sql.connect(this.config).then(function (pool) {
            return pool.request()
                .input('ElectionDate', electionDate)
                .execute("Aseni_ListCantonsByDeliverables");
        });
    };
    return data_cantones;
}());
exports.data_cantones = data_cantones;
