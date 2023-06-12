import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Place> filteredPlaces = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final place = dummyPlace;
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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              radius: 18,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
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
                setState(() {
                  filteredPlaces = place
                      .where((place) => place.title
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return PlaceCard(
            id: filteredPlaces.isNotEmpty
                ? filteredPlaces[index].id
                : place[index].id,
            title: filteredPlaces.isNotEmpty
                ? filteredPlaces[index].title
                : place[index].title,
            imageUrl: filteredPlaces.isNotEmpty
                ? filteredPlaces[index].imageUrl
                : place[index].imageUrl,
            availability: filteredPlaces.isNotEmpty
                ? filteredPlaces[index].availability
                : place[index].availability,
          );
        },
        itemCount:
            filteredPlaces.isNotEmpty ? filteredPlaces.length : place.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/'); // Navigate to home screen
              break;
            case 1:
              Navigator.pushNamed(context, '/favorite');
              break;
            // Add more cases for additional screens
          }
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
