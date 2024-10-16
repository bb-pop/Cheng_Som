/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "gjcuvbpu884du4i",
    "created": "2024-10-16 03:55:38.843Z",
    "updated": "2024-10-16 03:55:38.843Z",
    "name": "repair_report",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "4ls7p7xa",
        "name": "no_report",
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
  const collection = dao.findCollectionByNameOrId("gjcuvbpu884du4i");

  return dao.deleteCollection(collection);
})
