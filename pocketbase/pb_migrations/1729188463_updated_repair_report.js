/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("gjcuvbpu884du4i")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ltbane8w",
    "name": "status",
    "type": "select",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "รออนุมัติ",
        "รอช่างซ่อม",
        "เสร็จสิ้น"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("gjcuvbpu884du4i")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ltbane8w",
    "name": "status",
    "type": "select",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "รออนุมัติ",
        "รอช่างซ่อม",
        "ซ่อมเสร็จเเล้ว"
      ]
    }
  }))

  return dao.saveCollection(collection)
})
