import 'package:flutter/material.dart';
import 'package:flutter_task_12/src/views/main/subscreens/bag/main_bag_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/favorites/main_favorites_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/home/main_home_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/profile/main_profile_screen.dart';
import 'package:flutter_task_12/src/views/main/subscreens/shop/main_shop_screen.dart';
class MainScreen extends StatefulWidget {
  static const String route = 'main'; 


  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //subscreens
  List<Widget> subscreens = [
    const MainHomeScreen(), 
    const MainShopScreen(), 
    const MainBagScreen(), 
    const MainFavoritesScreen(), 
    const MainProfileScreen(), 
  ]; 
  //values 
  int bottomNavigatorSelected  = 0 ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigatorSelected, 
        unselectedItemColor: const Color.fromRGBO(155, 155, 155, 1),
        selectedItemColor: const  Color.fromRGBO(219, 48, 34, 1 ),
        showUnselectedLabels: true,
        onTap: (selected)=>setState(() {
           bottomNavigatorSelected = selected;           
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30,) , label: 'Home' ,), 
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, size: 30) , label: 'Shop'), 
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined, size: 30) , label: 'Bag'), 
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border, size: 30) , label: 'Favorites'), 
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined, size: 30) , label: 'profile'), 
        ], 
      ),
      body: subscreens[bottomNavigatorSelected], 
    );
  }
}