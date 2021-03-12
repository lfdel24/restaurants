import 'package:flutter/material.dart';
import 'package:restaurants/account/views/account_view.dart';
import 'package:restaurants/database.dart';
import 'package:restaurants/favorites/favorites.dart';
import 'package:restaurants/r_colors.dart';
import 'package:restaurants/restaurants/restaurants.dart';
import 'package:restaurants/search/search.dart';
import 'package:restaurants/top_restaurants/top_restaurants.dart';

void main() async {

  final client = Database().getSupabaseClient();

  // query data
  final response = await client
      .from('test')
      .select()
      .order('name', ascending: true)
      .execute();
  if (response.error == null) {
    print('response.data: ${response.data}');
  } else {
    print('response.data: ${response.data}');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurants | lfdel24@gmail.com',
      theme: ThemeData(primaryColor: Colors.white),
      home: NavigatorView(),
    );
  }
}

class NavigatorView extends StatefulWidget {
  @override
  _NavigatorViewState createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int _currentIndex = 4;
  final List<Widget> _views = [
    RestaurantsView(),
    FavoritesView(),
    TopRestaurantsView(),
    SearchView(),
    AccountView()
  ];

  void _onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: RColors.purpleAccent,
        currentIndex: _currentIndex,
        onTap: _onTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: RColors.purple),
              label: "Restaurantes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined, color: RColors.purple),
              label: "Favoritos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined, color: RColors.purple),
              label: "Top 5"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_off_outlined, color: RColors.purple),
              label: "Buscar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: RColors.purple,
              ),
              label: "Cuenta"),
        ],
      ),
    );
  }
}
