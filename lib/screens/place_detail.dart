import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';

class PlaceDetail extends StatefulWidget {
  static const String routeName = '/placedetail';

  const PlaceDetail({Key? key}) : super(key: key);

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  List<ParkingSpace> parkingSpaces = [
    ParkingSpace(id: 'a1', isAvailable: true),
    ParkingSpace(id: 'a2', isAvailable: false),
    ParkingSpace(id: 'a3', isAvailable: true),
  ];

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String placeId = routeArgs['id']!;
    final String placeImageUrl = routeArgs['imageUrl']!;
    final selectedPlace = dummyPlace.firstWhere((place) => place.id == placeId);
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(selectedPlace.title),
    );

    final int availableSpaces =
        parkingSpaces.where((space) => space.isAvailable).length;
    final int totalSpaces = parkingSpaces.length;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          // Image widget (adjust the size to your needs)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
              child: SizedBox(
                height: mediaQuery.size.height * 0.2,
                width: mediaQuery.size.width,
                child: Image.network(
                  placeImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ), // Adjust the spacing between the image and the summary
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            alignment: Alignment.center,
            child: Text(
              'Available Spaces: $availableSpaces / $totalSpaces',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: parkingSpaces.length,
              itemBuilder: (context, index) {
                ParkingSpace parkingSpace = parkingSpaces[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: ListTile(
                    title: Text(
                      parkingSpace.id,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      parkingSpace.isAvailable ? 'Available' : 'Unavailable',
                      style: TextStyle(
                        color: parkingSpace.isAvailable
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    tileColor: parkingSpace.isAvailable
                        ? Colors.green[100]
                        : Colors.red[100],
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: parkingSpace.isAvailable
                            ? Colors.green
                            : Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ParkingSpace {
  final String id;
  final bool isAvailable;

  ParkingSpace({required this.id, required this.isAvailable});
}
