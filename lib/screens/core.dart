import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';
import 'package:yourspot_app/models/place.dart';
import 'package:yourspot_app/screens/favorite.dart';
import 'package:yourspot_app/screens/home.dart';
import 'package:yourspot_app/models/place_card.dart';

class CoreScreen extends StatefulWidget {
  static const String routeName = '/core';
  final List<Place> favoritePlaces;

  const CoreScreen({super.key, required this.favoritePlaces});

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  List<Place> filteredPlaces = [];
  List<Place> favoritePlaces = [];
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void updateFilteredPlaces(List<Place> filteredList) {
    setState(() {
      filteredPlaces = filteredList;
    });
  }

  void updateFavoritePlaces(List<Place> favoriteList) {
    setState(() {
      favoritePlaces = favoriteList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final place = dummyPlace;
    FocusNode focusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: false,
        title: const Text(
          'YourSpot',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          //sign out button
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
              keyboardType: TextInputType.text,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                focusNode.requestFocus();
                List<Place> filteredList = place
                    .where((place) =>
                        place.title.toLowerCase().contains(value.toLowerCase()))
                    .toList();
                setState(() {
                  filteredPlaces = filteredList;
                });
              },
              onSubmitted: (value) {
                focusNode.unfocus();
              },
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomeScreen(
            filteredPlaces: filteredPlaces,
            updateFilteredPlaces: updateFilteredPlaces,
          ),
          FavoriteScreen(
            favoritePlaces: favoritePlaces,
            updateFavoritePlaces: updateFavoritePlaces,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
