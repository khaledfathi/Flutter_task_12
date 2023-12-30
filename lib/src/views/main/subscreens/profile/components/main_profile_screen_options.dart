import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/core_export.dart';
import 'package:flutter_task_12/src/views/settings/settings_screen.dart';
import 'package:flutter_task_12/src/views/signup/sign_up_screen.dart';

class MainProfileScreenOptions extends StatefulWidget {
  const MainProfileScreenOptions({super.key});

  @override
  State<MainProfileScreenOptions> createState() =>
      _MainProfileScreenOptionsState();
}

class _MainProfileScreenOptionsState extends State<MainProfileScreenOptions> {
  @override
  Widget build(BuildContext context) {
    List<Map> options = [
    { 'title':'My orders', 'onButtonTap': _myOrderOnTap},
    { 'title':'Shipping addresses', 'onButtonTap': _shippingAddressesOnTap},
    { 'title':'Payment methods', 'onButtonTap': _paymentMethodOnTap},
    { 'title':'Promocode', 'onButtonTap': _promocodeOnTap},
    { 'title':'My review', 'onButtonTap': _myReviewOnTap},
    { 'title':'Settings', 'onButtonTap': _settingsOnTap},
    { 'title':'Logout', 'onButtonTap': _logoutOnTap},
    ];

    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(155, 155, 155, 1))),
          ),
          height: 72,
          child: InkWell(
            onTap: options[index]['onButtonTap'],
            child: ListTile(
              title: Text( options[index]['title'], 
                style: const TextStyle(fontSize: 16),
              ),
              subtitle: Text('subtitle ${index+1}',
                style: const TextStyle(color: Color.fromRGBO(155, 155, 155, 1)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded)),
          ),
        );
      },
    );
  }
  
  //actions for each one
  void _myOrderOnTap (){}
  void _shippingAddressesOnTap (){}
  void _paymentMethodOnTap(){}
  void _promocodeOnTap (){}
  void _myReviewOnTap (){}
  void _settingsOnTap ()=>Navigator.pushNamed(context, SettingsScreen.route);
  void _logoutOnTap (){
    Auth.logout();
    Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.route, (route) => false);
  }


}
