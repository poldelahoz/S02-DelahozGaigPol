db = connect( 'mongodb://localhost:27017/culdampolla' );

db.marques.insertMany([{
    "_id": "oakley",
    "nom": "Oakley",
    "proveidor_id": "proveidor1"
  },{
    "_id": "rayban",
    "nom": "Rayban",
    "proveidor_id": "proveidor1"
  },{
    "_id": "arnette",
    "nom": "Arnette",
    "proveidor_id": "proveidor2"
}])

db.empleats.insertMany([{
    "_id": "empleat1",
    "nom": "Nom Cognom Empleat 1"
  },{
    "_id": "empleat2",
    "nom": "Nom Cognom Empleat 2"
}])

db.proveidors.insertMany([{
    "_id": "proveidor1",
    "nom": "proveidor 1",
    "adreça": {
      "carrer": "carrer proveidor 1",
      "numero": "1",
      "pis": "1",
      "porta": "1",
      "ciutat": "ciutat proveidor 1",
      "codi_postal": "12345",
      "pais": "país proveidor 1"
    },
    "telefon": "telefon proveidor 1",
    "fax": "fax proveidor 1",
    "NIF": "NIF proveidor 1"
  },{
    "_id": "proveidor2",
    "nom": "proveidor 2",
    "adreça": {
      "carrer": "carrer proveidor 2",
      "numero": "2",
      "pis": "2",
      "porta": "2",
      "ciutat": "ciutat proveidor 2",
      "codi_postal": "12345",
      "pais": "país proveidor 2"
    },
    "telefon": "telefon proveidor 2",
    "fax": "fax proveidor 2",
    "NIF": "NIF proveidor 2"
  }])

  db.clients.insertMany([{
    "_id": 1,
    "nom": "client 1",
    "adreça": {
      "carrer": "carrer client 1",
      "numero": "1",
      "pis": "1",
      "porta": "1",
      "ciutat": "ciutat client 1",
      "codi_postal": "12345",
      "pais": "país client 1"
    },
    "telefon": "telefon client 1",
    "correu_electronic": "client1@client1.com",
    "data_registre": new Date()
  },{
    "_id": 2,
    "nom": "client 2",
    "adreça": {
      "carrer": "carrer client 2",
      "numero": "1",
      "pis": "1",
      "porta": "1",
      "ciutat": "ciutat client 2",
      "codi_postal": "12345",
      "pais": "país client 2"
    },
    "telefon": "telefon client 2",
    "correu_electronic": "client2@client2.com",
    "data_registre": new Date(),
    "recomenador_id": 1
}])

  db.ulleres.insertMany([{
    "_id": 1,
    "marca_id": "oakley",
    "vidres": {
        "graduacio": {
            "vidre_esquerre": 1.15,
            "vidre_dret": 1.25
        },
        "colors": {
            "vidre_esquerre": "negre",
            "vidre_dret": "negre"
        }
    },
    "muntura": {
        "tipus": "flotant",
        "color": "vermell"
    },
    "preu": 199.99
  },{
    "_id": 2,
    "marca_id": "oakley", 
    "vidres": {
        "graduacio": {
            "vidre_esquerre": 1.15,
            "vidre_dret": 1.25
        },
        "colors": {
            "vidre_esquerre": "blau",
            "vidre_dret": "blau"
        }
    },
    "muntura": {
        "tipus": "flotant",
        "color": "blau"
    },
    "preu": 64.99
  },{
    "_id": 3,
    "marca_id": "rayban", 
    "vidres": {
        "graduacio": {
            "vidre_esquerre": 1.15,
            "vidre_dret": 1.25
        },
        "colors": {
            "vidre_esquerre": "vermell",
            "vidre_dret": "negre"
        }
    },
    "muntura": {
        "tipus": "pasta",
        "color": "negre"
    },
    "preu": 89.99
}])

db.ventes.insertMany([{
    "_id": 1,
    "client_id": 1,
    "empleat_id": "empleat1",
    "ulleres":[
        {
            "ullera_id": 1,
            "quantitat": 1
        },
        {
            "ullera_id": 2,
            "quantitat": 1
        }        
    ],
    "data": new Date()
  },{
    "_id": 2,
    "client_id": 2,
    "empleat_id": "empleat1",
    "ulleres":[
        {
            "ullera_id": 3,
            "quantitat": 1
        }
    ],
    "data": new Date()
  },{
    "_id": 3,
    "client_id": 1,
    "empleat_id": "empleat2",
    "ulleres":[
        {
            "ullera_id": 3,
            "quantitat": 1
        }
    ],
    "data": new Date()
  }])

