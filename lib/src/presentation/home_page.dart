
import 'package:flutter/material.dart';
import 'package:tema_curs5_flutter/src/models/movie.dart';
import 'package:tema_curs5_flutter/src/containers/movies_container.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
        builder: (BuildContext context, List < Movie > movies){
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'MovieApp',
                style: TextStyle(color: Colors.yellow),
              ),
              centerTitle: true,
            ),
            body: GridView.builder(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 56.0),
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final Movie movie = movies[index];


                return GridTile(
                  child: Image.network(movie.mediumCover),
                  footer: GridTileBar(
                    title: Text(movie.title),
                  ),
                );
              },
            ),
          );
        });
  }
}