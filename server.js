/**
 * 
 * Created by Allysson Oliveira
 * Copyright (c) 2017 IBM Research. All rights reserved.
 * To start:
 *   > cf login -a api.ng.bluemix.net
 *   > cf create-service cloudantNoSQLDB Lite <SERVICE_NAME>
 *   > cf create-service-key "<SERVICE_NAME>" credentials -c '{"role":"member"}'
 *   > cf service-key <SERVICE_NAME> credentials
 *   > npm install
 *   > node server.js
 *   > cf push
 * 
 * Commands:
 *   // LIST DATABASES
 *   > curl -X GET http://localhost:4001/dbs/list
 * 
 *   // CREATE DATABASE
 *   > curl -X POST -H 'Content-type: application/json' http://localhost:4001/dbs/add -d '{"name": "<DATABASE_NAME>"}'
 * 
 *   // LIST ALL DOCUMENTS
 *   > curl -X GET http://localhost:4001/doc/list?name=<DATABASE_NAME>
 * 
 *   // ADD DOCUMENT
 *   > curl -X POST -H 'Content-type: application/json' http://localhost:4001/doc/add -d '{"name": "<DATABASE_NAME>", "document": {"property": "value"}}'
 * 
 *   // GET DOCUMENT
 *   > curl -X GET "http://localhost:4001/doc?name=<DATABASE_NAME>&doc=<DOCUMENT_ID>"
 * 
 *   // UPDATE DOCUMENT
 *   > curl -X PUT -H 'Content-type: application/json' http://localhost:4001/doc/update -d '{"name": "<DATABASE_NAME>", "document": {"_id": "<DOCUMENT_ID>", "_rev": "<REVISION>", "property": "new value 2"}}'
 *   
 *   // DELETE DOCUMENT
 *   > curl -X DELETE -H 'Content-type: application/json' http://localhost:4001/doc/remove -d '{"name": "<DATABASE_NAME>", "document": "<DOCUMENT_ID>", "revision": "<REVISION>"}'
 * 
 **/


var express = require('express');
var cfenv = require('./utils/cfenv-wrapper');
var bodyParser = require('body-parser');
var Cloudant = require('cloudant');

var app = express();

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

var appEnv = cfenv.getAppEnv();

if (!appEnv) {
    throw new Error('Failed to load application environment variables!');
} else {
    if (appEnv.isLocal) {
        console.log("Local Development!");
    }
}

// Altere aqui o nome do serviço.
var cloudantCfg = appEnv.getService("ramonfsk").credentials;

// Database instance
var cloudant = Cloudant({
    url: cloudantCfg.url,
    account: cloudantCfg.user,
    password: cloudantCfg.password
});

/**
 * PASSO 1 - LIST ALL DATABASES ON CLOUDANT INSTANCES
 * 
 * @param
 * @return {array} all databases
 */
app.get('/dbs/list', function (req, res) {
    cloudant.db.list(function (err, allDbs) {
        if (err) {
            console.log(err);
            return res.status(400).json({
                message: "Erro ao retornar listar bancos."
            });
        }

        if (allDbs && allDbs.length > 0) {
            return res.json({
                message: allDbs.join(', ')
            });
        } else {
            return res.json({
                message: "Nenhum banco encontrado"
            });
        }
    });
});

/**
 * PASSO 2 - ADD DATABASE TO CLOUDANT INSTANCE
 * 
 * @param {string} name database name
 * @returns {Object} status of the operation
 */
app.post('/dbs/add', function (req, res) {
    var dbname = req.body.name;

    if (dbname) {
        cloudant.db.create(dbname, function (err, body) {
            if (err) {
                console.log(err);
                return res.status(400).json({
                    message: "Erro ao criar banco de dados!"
                });
            }

            return res.json({
                message: "Banco de dados criado com sucesso!"
            });
        });
    } else {
        return res.status(400).json({
            message: "Nome do banco não informado!"
        });
    }
});

/**
 * PASSO 5 - GET DOCUMENT
 * 
 * @param {string} name database name
 * @param {string} doc document id
 * @returns {Object} document if any or error status
 */
app.get('/doc', function (req, res) {
    var dbName = req.query.name;
    var docId = req.query.doc;

    if (dbName && docId) {
        var mydb = cloudant.use(dbName);
        mydb.get(docId, {
            revs_info: true
        }, function (err, body) {
            console.log(body);
            if (err) {
                console.log(err);
                var msg = "Erro ao buscar documento";

                if (err.statusCode == 404) {
                    msg = "Documento não encontrado!";
                }

                return res.status(err.statusCode).json({
                    message: msg
                });
            }

            return res.json(body);
        });
    } else {
        return res.status(400).json({
            message: "Parâmetro não informado!"
        });
    }
});

/**
 * PASSO 3 - LIST ALL DOCUMENTS
 * 
 * @param {string} name database name
 * @returns {Array} all documents found
 */
app.get('/doc/list', function (req, res) {
    var dbName = req.query.name;

    if (dbName) {
        var mydb = cloudant.use(dbName);
        mydb.list({
            include_docs: true
        }, function (err, body) {
            console.log(JSON.stringify(body));


            if (err && err.statusCode == 404) {
                console.log(err);
                return res.status(404).json({
                    message: "Banco de dados não existe!"
                });
            } else if (err) {
                console.log(err);
                return res.status(400).json({
                    message: "Erro ao listar documentos"
                });
            }

            var values = [];

            body.rows.forEach(function (value) {
                values.push(value.doc);
            });

            return res.json(values);
        })
    } else {
        return res.status(400).json({
            message: "Parâmetro não informado!"
        });
    }
});

/**
 * PASSO 4 - ADD DOCUMENT
 * 
 * @param {string} name database name
 * @param {string} document JSON object describing desired document to be inserted
 * @returns {Object} inserted document (with ID and REV) or error message
 */
app.post('/doc/add', function (req, res) {
    var doc = req.body.document;
    var dbName = req.body.name;

    if (doc && dbName) {
        var mydb = cloudant.use(dbName);
        mydb.insert(doc, function (err, body) {
            console.log(body);

            if (err) {
                console.log(err);
                return res.status(400).json({
                    message: "Erro ao inserir documento"
                });
            }

            return res.json(body);
        });
    } else {
        return res.status(400).json({
            message: "Parâmetro não informado!"
        });
    }
});

/**
 * PASSO 6 - UPDATE DOCUMENT
 * 
 * @param {string} name database name
 * @param {string} document JSON object describing desired document to be updated. This document SHALL INCLUDE _id property.
 * @returns {Object} updated document (with ID and REV) or error message
 */
app.put('/doc/update', function (req, res) {
    var doc = req.body.document;
    var dbName = req.body.name;

    if (doc && dbName) {
        var mydb = cloudant.use(dbName);
        mydb.insert(doc, function (err, body) {
            console.log(body);

            if (err) {
                console.log(err);
                return res.status(400).json({
                    message: "Erro ao atualizar documento"
                });
            }

            return res.json(body);
        });
    } else {
        return res.status(400).json({
            message: "Parâmetro não informado!"
        });
    }
});

/**
 * PASSO 7 - REMOVE DOCUMENT
 * 
 * @param {string} name database name
 * @param {string} document document _ID
 * @param {string} revision document _REV
 * @returns {Object} status of the operation
 */
app.delete('/doc/remove', function (req, res) {
    var doc = req.body.document;
    var rev = req.body.revision;
    var dbName = req.body.name;

    if (doc && dbName) {
        var mydb = cloudant.use(dbName);
        mydb.destroy(doc, rev, function (err, body) {
            console.log(body);

            if (err) {
                console.log(err);
                return res.status(400).json({
                    message: "Erro ao remover documento"
                });
            }

            return res.json(body);
        });
    } else {
        return res.status(400).json({
            message: "Parâmetro não informado!"
        });
    }
});

// Handle 404 after handling everything else!
app.use(function (req, res, next) {
    console.log('404 - Error handler: ' + req.headers.host + req.url);
    res.status(404).send({
        message: 'Resource Not Found.',
        type: 'internal'
    });

});

// The IP address of the Cloud Foundry DEA (Droplet Execution Agent) that hosts this application:
// Warning! VCAP_APP_HOST does not exists on Diego Runtime Architecture. This should be replaced
// by address 0.0.0.0.
var host = ('0.0.0.0');

// The port on the DEA for communication with the application:
// Waring!  VCAP_APP_PORT does not exists on Diego Runtime Architecture. This should be replaced
// by PORT variable.
var port = (process.env.PORT || 4001);

app.listen(port, host, function onStart(err) {
    if (err) {
        console.log(err);
    }

    console.info('==> 🌎 Listening on port %s. Open up http://localhost:%s/ in your browser.', port, port);
});