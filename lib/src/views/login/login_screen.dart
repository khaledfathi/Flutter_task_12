import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //title
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.only(left: 10),
              child: Text('Login' , style: Theme.of(context).textTheme.titleLarge,),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 64,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.check, size: 24,),
                  suffixIconColor: Colors.green,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                ),
              ),
            )
            //inputs 
            //forget password button
            //login button

          ],
        ),
      ),
    );
  }
}
