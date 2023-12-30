import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/core_export.dart';

class MainProfileScreenUserData extends StatelessWidget {
  const MainProfileScreenUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          //image
          Container(
            margin: const EdgeInsets.only(left: 20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(              
              borderRadius: BorderRadius.circular(32),
            ),
            width: 64,
            height: 64,
            child: Image.network(Auth.currentUser.image!),
          ),
          //details
          Expanded(
            child: Padding(              
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Auth.currentUser.name! , style: TextStyle(color: Colors.black , fontSize: 18 ),), 
                  Text(Auth.currentUser.email! , style: TextStyle(color: Color.fromRGBO(155, 155, 155, 1), fontSize: 14),), 
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
