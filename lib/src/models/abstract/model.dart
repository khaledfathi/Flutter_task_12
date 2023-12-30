import 'package:flutter/material.dart';
import '../../../core/core_export.dart';

abstract class Model<T> {
  String tableName;
  Map<String, dynamic>? row;

  Model({required this.tableName, this.row});
  List<T> createQueryModelList(List<Map<String, Object?>> queryResult);

  Future<List<T>> select({int? id}) async {
    List<T> records = [];
    if (id == null) {
      await appDatabase.table(tableName).select().then((queryResult) {
        if (queryResult.isNotEmpty) {
          records = createQueryModelList(queryResult);
        }
      });
    } else {
      await appDatabase
          .table(tableName)
          .select(id: id)
          .then((queryResult) {
        if (queryResult.isNotEmpty) {
          records = createQueryModelList(queryResult);
        }
      });
    }
    return records;
  }

  Future<List<T>> selectWhere(String where, List<Object?> whereArgs) async {
    List<T> records = [];
    await appDatabase
        .table(tableName)
        .selectWhere(where, whereArgs)
        .then((queryResult) {
      if (queryResult.isNotEmpty) {
        records = createQueryModelList(queryResult);
      }
    });
    return records;
  }

  Future<int> insert() async {
    try {
      return appDatabase.table(tableName).insert(row);
    } catch (e) {
      debugPrint(e.toString());
    }
    return 0;
  }

  Future<int> update(int id) async {
    Map<String, dynamic> newRow = {};
    row!.forEach((key, value) => value.isNotEmpty ? newRow[key] = value : null);
    try {
      return appDatabase.table(tableName).update(newRow, id);
    } catch (e) {
      debugPrint(e.toString());
    }
    return 0;
  }

  Future<int> updateWhere(String where, List<Object?> whereArgs) async {
    Map<String, dynamic> newRow = {};
    row!.forEach((key, value) => value.isNotEmpty ? newRow[key] = value : null);
    return appDatabase.table(tableName).update(where, whereArgs);
  }

  Future<int> delete({int? id}) {
    if (id == null) {
      return appDatabase.table(tableName).delete();
    } else {
      return appDatabase.table(tableName).delete(id: id);
    }
  }

  Future<int> deleteWhere(String where, List<Object?> whereArgs) {
    return appDatabase.table(tableName).delete(where, whereArgs);
  }

  Map<String, dynamic> toMap();
}
