import './interface/database_core_interface.dart';
import './database_sqlite.dart';

class AppDatabase {
  static DatabaseCoreInterface<DatabaseSqlite> sqlite() => DatabaseSqlite(); 
}