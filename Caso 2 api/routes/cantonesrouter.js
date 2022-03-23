"use strict";
exports.__esModule = true;
exports.cantonesrouter = void 0;
var express = require("express");
var common_1 = require("../common");
var cantonesController_1 = require("../controllers/cantonesController");
var app = express();
exports.cantonesrouter = app;
var log = new common_1.Logger();
app.get("/list", function (req, res, next) {
    cantonesController_1.CantonesController.getInstance().listCantones(req.query.electionDate)
        .then(function (data) {
        res.json(data.recordset);
    })["catch"](function (err) {
        log.error(err);
        return "{msg: \"error\"}";
    });
});
