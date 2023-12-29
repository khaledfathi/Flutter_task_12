import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/database/database_sqlite.dart';
import '../globals/globals.dart' as globals;

class AppConfig {
  static late Map config;
  //apply config
  Future<void> apply() async {
    _initFlutter();
    await _initAppPath();
    await _readConfigFile();
    await _initDB();
    await _initSharedPreference();
    _initDio();
  }

  Future<Map> _readConfigFile() async {
    String configString  = await rootBundle.loadString('assets/config.json'); 
    config = jsonDecode(configString);
    debugPrint('AppConfig : Reading configurations  [OK]');
    return config;
  }

  //flutter required
  void _initFlutter() {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint('AppConfig : Flutter ensureInitialized [OK]');
  }

  //database initilization
  Future<void> _initDB() async {
    switch (config['database']['DBMS']) {
      case 'sqlite':
        globals.appDatabase = DatabaseSqlite();
        debugPrint('AppConfig : Database initilizing with DMBS = sqlite [OK]');
    }
  }

  //init shared preference
  Future<void> _initSharedPreference() async {
    globals.sharedPreferences = await SharedPreferences.getInstance();
    await globals.sharedPreferences.setBool('isLogin' , false); 
    debugPrint('AppConfig : Shared Preferences initilaizing  [OK]');    
    debugPrint('AppConfig : Shared Prefrences set (isLogin = false) [OK]');    
  }

  //init DIO
  void _initDio() {
    globals.api = Dio();
    debugPrint('AppConfig : Dio (http communications) initilaizing  [OK]');
  }

  Future<void> _initAppPath() async {
    await getApplicationDocumentsDirectory()
        .then((direcrory) => globals.appDirPath = direcrory.path);
      debugPrint('AppConfig : device path initilaizing  [OK]');
  }
}
