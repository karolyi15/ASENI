"use strict";
exports.__esModule = true;
exports.CantonesController = void 0;
var data_cantones_1 = require("../repositories/data_cantones");
var common_1 = require("../common");
var CantonesController = /** @class */ (function () {
    function CantonesController() {
        this.log = new common_1.Logger();
        try {
        }
        catch (e) {
            this.log.error(e);
        }
    }
    CantonesController.getInstance = function () {
        if (!this.instance) {
            this.instance = new CantonesController();
        }
        return this.instance;
    };
    CantonesController.prototype.listCantones = function (electionDate) {
        var dynamo = new data_cantones_1.data_cantones();
        return dynamo.getCantones(electionDate);
    };
    return CantonesController;
}());
exports.CantonesController = CantonesController;
