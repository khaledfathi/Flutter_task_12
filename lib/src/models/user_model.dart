import 'package:flutter_task_12/src/models/abstract/model.dart';

class UserModel extends Model<UserModel> {
  //user model fields 
  UserModel({super.tableName = 'users'});
 
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