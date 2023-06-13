import 'package:flutter/material.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';
import '../dummy_data/dummy_data.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  final List<Place> favoritePlaces;
  final Function(List<Place> favoriteList) updateFavoritePlaces;

  const FavoriteScreen(
      {super.key, required this.favoritePlaces, required this.updateFavoritePlaces});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Place> filteredPlaces = [
    Place(
      id: 'm1',
      title: 'Syahdan Campus',
      imageUrl:
          'https://binus.ac.id/wp-content/uploads/2019/08/WhatsApp-Image-2020-09-24-at-3.47.56-PM-1.jpeg',
      availability: 10,
    ),
  ];

  @override
  void initState() {
    super.initState();
    filterFavoritePlaces();
  }

  void filterFavoritePlaces() {
    filteredPlaces = dummyPlace
        .where((place) => widget.favoritePlaces.contains(place.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PlaceCard(
          id: filteredPlaces[index].id,
          title: filteredPlaces[index].title,
          imageUrl: filteredPlaces[index].imageUrl,
          availability: filteredPlaces[index].availability,
          updateFavoritePlaces: (List<Place> favoriteList) {},
        );
      },
      itemCount: filteredPlaces.length,
    );
  }
}
