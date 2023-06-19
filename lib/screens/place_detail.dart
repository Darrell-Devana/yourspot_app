import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';

class PlaceDetail extends StatefulWidget {
  static const String routeName = '/placedetail';

  const PlaceDetail({Key? key}) : super(key: key);

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  final databaseRef = FirebaseDatabase.instance.ref();

  List<Object?> parkingSpaceIds = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String placeId = routeArgs['id']!;
    final String placeImageUrl = routeArgs['imageUrl']!;
    final selectedPlace = dummyPlace.firstWhere((place) => place.id == placeId);

    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(
        selectedPlace.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       setState(() {
      //         isFavorite = !isFavorite;
      //         if (isFavorite) {
      //           favoritePlaces.add(selectedPlace.id);
      //         } else {
      //           favoritePlaces.remove(selectedPlace.id);
      //         }
      //       });
      //     },
      //     icon: Icon(
      //       isFavorite ? Icons.favorite : Icons.favorite_border,
      //       color: Colors.red,
      //     ),
      //   ),
      // ],
    );

    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        height: mediaQuery.size.height,
        child: StreamBuilder(
          stream: databaseRef.child('test').onValue,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
              // Mengambil nilai dari DataSnapshot
              dynamic data = snapshot.data!.snapshot.value;

              // Mengubah nilai menjadi daftar
              List<dynamic> historyData = data.values.toList();
              List<String> parkingSpaceIds = data.keys.toList().cast<String>();

              int availableSpaces =
                  historyData.where((data) => data.toString() == 'true').length;

              return Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.darken,
                          ),
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
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 430,
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Available Spaces: $availableSpaces / ${parkingSpaceIds.length}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Icon(Icons.car_repair)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: parkingSpaceIds.length,
                      itemBuilder: (context, index) {
                        int reversedIndex = parkingSpaceIds.length - 1 - index;
                        String parkingSpaceId = parkingSpaceIds[reversedIndex];

                        return Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            child: ListTile(
                              title: Text(
                                parkingSpaceId,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              trailing: Text(
                                historyData[reversedIndex].toString() == 'true'
                                    ? 'Available'
                                    : 'Unavailable',
                                style: TextStyle(
                                  color: historyData[reversedIndex]
                                              .toString() ==
                                          'true'
                                      ? const Color.fromARGB(255, 49, 255, 56)
                                      : const Color.fromARGB(255, 255, 44, 29),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color:
                                      historyData[reversedIndex].toString() ==
                                              'true'
                                          ? Colors.green
                                          : Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
