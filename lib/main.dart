import 'package:flutter/material.dart';
import 'package:restaurants/account/account.dart';
import 'package:restaurants/favorites/favorites.dart';
import 'package:restaurants/restaurants/restaurants.dart';
import 'package:restaurants/search/search.dart';
import 'package:restaurants/top_restaurants/top_restaurants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants | lfdel24@gmail.com',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigatorView(),
    );
  }
}

class NavigatorView extends StatefulWidget {
  @override
  _NavigatorViewState createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int _currentIndex = 0;
  final List<Widget> views = [
    RestaurantsView(),
    FavoritesView(),
    TopRestaurantsView(),
    SearchView(),
    AccountView()
  ];

  void _onTab(int index){
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Restaurantes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: "Favoritos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined), label: "Top 5"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_off_outlined), label: "Buscar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Cuenta"),
        ],
      ),
    );
  }
}
