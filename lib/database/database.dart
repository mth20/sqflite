import 'package:sqflite/sqflite.dart';
import 'package:sqlite_test/model/fruit_model.dart';
import 'package:path/path.dart';

class DatabaseManager {
  late Database database;

//// create data in database
  Future openDb() async {
    database = await openDatabase(
      join(await getDatabasesPath(), "mth.db"),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE model(id INTEGER PRIMARY KEY autoincrement, fruitName TEXT, quantity TEXT)",
        );
      },
    );
    return database;
  }

  Future insertModel(FruitsModel fModel) async {
    await openDb();
    return await database.insert("model", fModel.toJson());
  }

  Future updateModel(FruitsModel fModel) async {
    await openDb();

    return await database.update("model", fModel.toJson(),
        where: "id=?", whereArgs: [fModel.id]);
  }

  Future deleteModel(FruitsModel fModel) async {
    await openDb();

    return await database.delete(
      "model",

      where: "id=?",
      whereArgs: [fModel.id],
    );
  }

  Future<List<FruitsModel>> getFruitsList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await database.query("model");

    return List.generate(
      maps.length,
      (i) {
        return FruitsModel(
          id: maps[i]["id"],
          fruitName: maps[i]["fruitName"],
          quantity: maps[i]["quantity"],
        );
      },
    );
  }
}
