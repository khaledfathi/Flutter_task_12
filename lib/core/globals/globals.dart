//global objects 
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/database/interface/database_core_interface.dart';

late DatabaseCoreInterface appDatabase ; 
late SharedPreferences sharedPreferences ;
late Dio dio ;
late String appDirPath  ; 