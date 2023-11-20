import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/details_screen.dart';

class CustomScrollWidget extends StatelessWidget {
  const CustomScrollWidget({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                movie: snapshot.data[index],
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                      height: 200,
                      width: 150,
                      child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          '${Constants.imagePath}${snapshot.data![index].posterPath}')),
                ),
              ),
            );
          },
        ));
  }
}
