import 'package:flutter_task_12/core/core_export.dart';
import 'package:flutter_task_12/src/models/abstract/model.dart';

class UserModel extends Model<UserModel> {
  //user model fields 
  String? id ; 
  String? name; 
  String? email; 
  String? image; 

  UserModel({super.tableName = 'users'});
  
  UserModel.toMap(Map map,  {super.tableName = 'users'}){
    id = map['id'].toString();
    name = map['name']; 
    email = map ['email']; 
    image = '$API_BASE_URL${map['image']}'; 
  }


  @override
  Map<String, dynamic> toMap() {
    // conver model to map 
    return {}; 
  }  
  
  @override
  List<UserModel> createQueryModelList(List<Map<String, Object?>> queryResult) {
    // convert map to model 
    return []; 
  }

}