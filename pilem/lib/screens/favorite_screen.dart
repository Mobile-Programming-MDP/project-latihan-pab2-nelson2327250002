import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pilem/models/movie.dart';
import 'package:pilem/screens/detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  List<Movie> _favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteMovies();
  }

  Future<void> _loadFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favoriteMovieIds =
        prefs.getKeys().where((key) => key.startsWith('movie_')).toList();
    print('favoriteMovieIds: $favoriteMovieIds');
    setState(() {
      _favoriteMovies =
          favoriteMovieIds
              .map((id) {
                final String? movieJson = prefs.getString(id);
                if (movieJson != null && movieJson.isNotEmpty) {
                  final Map<String, dynamic> movieData = jsonDecode(movieJson);
                  return Movie.fromJson(movieData);
                }
                return null;
              })
              .where((movie) => movie != null)
              .cast<Movie>()
              .toList();
    });
  }

  Future<void> _removeFavoriteMovie(String movieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(movieId);
    _loadFavoriteMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Movies')),
      body: ListView.builder(
        itemCount: _favoriteMovies.length,
        itemBuilder: (context, index) {
          final Movie movie = _favoriteMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Dismissible(
              key: Key(movie.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _removeFavoriteMovie('movie_${movie.id}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${movie.title} removed from favorites'),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(movie.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(movie: movie),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
