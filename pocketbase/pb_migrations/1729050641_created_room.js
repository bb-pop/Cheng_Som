/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "yo9217et98l6tyb",
    "created": "2024-10-16 03:50:41.616Z",
    "updated": "2024-10-16 03:50:41.616Z",
    "name": "room",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "inqack8z",
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
      }
    ],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("yo9217et98l6tyb");

  return dao.deleteCollection(collection);
})
