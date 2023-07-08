import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourspot_app/screens/core.dart';
import 'package:yourspot_app/screens/favorite.dart';
import 'package:yourspot_app/screens/login.dart';
import 'package:yourspot_app/screens/home.dart';
import 'package:yourspot_app/screens/place_detail.dart';
import 'models/place.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;
DatabaseReference databaseReference = database.ref();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Place> favoritePlaces = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CoreScreen(
                favoritePlaces: [],
              );
            } else {
              return const LoginPage();
            }
          }),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        CoreScreen.routeName: (context) => const CoreScreen(
              favoritePlaces: [],
            ),
        HomeScreen.routeName: (context) => HomeScreen(
              filteredPlaces: const [],
              updateFilteredPlaces: (value) {},
            ),
        FavoriteScreen.routeName: (context) => FavoriteScreen(
              favoritePlaces: const [],
              updateFavoritePlaces: (List<Place> favoriteList) {},
            ),
        PlaceDetail.routeName: (context) => PlaceDetail(),
      },
    );
  }
}
