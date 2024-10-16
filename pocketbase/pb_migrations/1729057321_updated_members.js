/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("xmhnj977ula8mwu")

  // remove
  collection.schema.removeField("4g7zogxd")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ppmkuo1o",
    "name": "room_number",
    "type": "text",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("xmhnj977ula8mwu")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "4g7zogxd",
    "name": "room",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "yo9217et98l6tyb",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // remove
  collection.schema.removeField("ppmkuo1o")

  return dao.saveCollection(collection)
})
