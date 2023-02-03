db = connect( 'mongodb://localhost:27017/pizzeria' );

db.clients.insertMany([{
    "_id": 1,
    "nom": "Client 1",
    "adreça":{
        "adreça": "adreça client 1",
        "codi_postal": "12345",
        "localitats_id": 1,
    },
    "telefon": "telefon proveidor 1"
  },
  {
    "_id": 2,
    "nom": "Client 2",
    "adreça":{
        "adreça": "adreça client 2",
        "codi_postal": "12345",
        "localitats_id": 3,
    },
    "telefon": "telefon proveidor 1"
  }
])

db.localitats.insertMany([{
    "_id": 1,
    "nom": "Localitat 1",
    "provincies_id": 1
  },
  {
    "_id": 2,
    "nom": "Localitat 2",
    "provincies_id": 1
  },
  {
    "_id": 3,
    "nom": "Localitat 3",
    "provincies_id": 2
  }
])

db.provincies.insertMany([{
    "_id": 1,
    "nom": "Provincia 1"
  },
  {
    "_id": 2,
    "nom": "Provincia 2"
  }
])

db.comandes.insertMany([
  {
    "_id": 1,
    "data": new Date(),
    "tipus": "a domicili",
    "productes":[
        {
            "productes_id": 1,
            "quanitat": 1
        },
        {
            "productes_id": 2,
            "quanitat": 2
        }
    ],
    "clients_id": 1,
    "botigues_id": 1,
    "empleats_id": 2,
    "data_lliurament": new Date()
  },
  {
    "_id": 2,
    "data": new Date(),
    "tipus": "a domicili",
    "productes":[
        {
            "productes_id": 2,
            "quanitat": 1
        },
        {
            "productes_id": 3,
            "quanitat": 1
        }
    ],
    "clients_id": 2,
    "botigues_id": 2
  }
])

db.productes.insertMany([{
    "_id": 1,
    "tipus": "pizza",
    "nom": "pizza 1",
    "descripcio": "Descripcio pizza 1",
    "preu": 12.25,
    "categories_pizzes_id": 1
  },
  {
    "_id": 2,
    "tipus": "hamburguesa",
    "nom": "hamburguesa 1",
    "descripcio": "Descripcio hamburguesa 1",
    "preu": 9.50
  },
  {
    "_id": 3,
    "tipus": "beguda",
    "nom": "beguda 1",
    "descripcio": "Descripcio beguda 1",
    "preu": 1.50
  }
])

db.categories_pizzes.insertMany([{
    "_id": 1,
    "nom": "Amb carn"
  },
  {
    "_id": 2,
    "nom": "Amb verdures"
  }
])

db.botigues.insertMany([{
    "_id": 1,
    "nom": "Botiga 1",
    "adreça":{
        "adreça": "adreça botiga 1",
        "codi_postal": "12345",
        "localitats_id": 1
    }
  },
  {
    "_id": 2,
    "nom": "Botiga 2",
    "adreça":{
        "adreça": "adreça botiga 2",
        "codi_postal": "12345",
        "localitats_id": 2
    }
  }
])

db.empleats.insertMany([{
    "_id": 1,
    "nom": "Empleat 1",
    "cognoms": "Cognoms empleat 1",
    "nif": "nif empleat 1",
    "telefon": "telefon empleat 1",
    "tipus": "cuiner",
    "botigues_id": 1
  },
  {
    "_id": 2,
    "nom": "Empleat 2",
    "cognoms": "Cognoms empleat 2",
    "nif": "nif empleat 2",
    "telefon": "telefon empleat 2",
    "tipus": "repartidor",
    "botigues_id": 1
  },
  {
    "_id": 3,
    "nom": "Empleat 3",
    "cognoms": "Cognoms empleat 3",
    "nif": "nif empleat 3",
    "telefon": "telefon empleat 3",
    "tipus": "cuiner",
    "botigues_id": 2
  }
])