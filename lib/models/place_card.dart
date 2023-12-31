import 'package:flutter/material.dart';
import 'package:yourspot_app/screens/place_detail.dart';
import 'package:yourspot_app/models/place.dart';

class PlaceCard extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int availability;

  const PlaceCard({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.availability,
  }) : super(key: key);

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isFavorite = false;
  List<Place> favoritePlaces = [];

  void selectPlace(BuildContext context) {
    Navigator.of(context).pushNamed(
      PlaceDetail.routeName,
      arguments: {
        'id': widget.id,
        'title': widget.title,
        'imageUrl': widget.imageUrl
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectPlace(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 410,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        // IconButton(
                        //   onPressed: toggleFavorite,
                        //   icon: Icon(
                        //     isFavorite ? Icons.favorite : Icons.favorite_border,
                        //     color: isFavorite ? Colors.red : Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.car_repair),
                      const SizedBox(width: 6),
                      Text('${widget.availability} Spots'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
