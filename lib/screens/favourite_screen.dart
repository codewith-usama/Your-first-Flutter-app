import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../my_app_state.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favourites.isEmpty) {
      return Center(
        child: Text('No Favourites yet'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('You have '
              '${appState.favourites.length} favourites:'),
        ),
        for (var pair in appState.favourites)
          ListTile(
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  appState.favourites.remove(pair);
                });
              },
              child: Icon(Icons.delete),
            ),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
