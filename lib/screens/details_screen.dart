import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/trending_movie.dart';
import 'package:movie_app/widgets/back_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});
  final TrendingMovie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const ButtonBack(),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title,
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              background: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  '${Constants.imagePath}${movie.posterPath}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Text('Overview',
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(movie.overview,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Release Date :',
                                style: GoogleFonts.openSans(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.openSans(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Rating: ',
                                  style: GoogleFonts.openSans(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '${movie.voteAverage.toStringAsFixed(1)}/10',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
