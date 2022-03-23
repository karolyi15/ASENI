"use strict";
exports.__esModule = true;
var express = require("express");
var bodyParser = require("body-parser");
var common_1 = require("../common");
var cantonesrouter_1 = require("./cantonesrouter");
var Routes = /** @class */ (function () {
    function Routes() {
        this.express = express();
        this.logger = new common_1.Logger();
        this.middleware();
        this.routes();
    }
    // Configure Express middleware.
    Routes.prototype.middleware = function () {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    };
    Routes.prototype.routes = function () {
        this.express.use('/cantones', cantonesrouter_1.cantonesrouter);
    };
    return Routes;
}());
exports["default"] = new Routes().express;
