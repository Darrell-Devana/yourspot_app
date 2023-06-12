import 'package:flutter/material.dart';
import 'package:yourspot_app/models/place_card.dart';
import 'package:yourspot_app/models/place.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = '/favorite';
  final List<Place> filteredPlaces;
  final Function(List<Place> filteredList) updateFilteredPlaces;

  const FavoriteScreen({
    Key? key,
    required this.filteredPlaces,
    required this.updateFilteredPlaces,
  }) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Place> filteredPlaces = [];

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PlaceCard(
          id: filteredPlaces[index].id,
          title: filteredPlaces[index].title,
          imageUrl: filteredPlaces[index].imageUrl,
          availability: filteredPlaces[index].availability,
        );
      },
      itemCount: filteredPlaces.length,
    );
  }
}
