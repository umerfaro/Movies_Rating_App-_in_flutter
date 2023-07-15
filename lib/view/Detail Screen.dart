import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/utlis.dart';

class MoviesDetails extends StatefulWidget {
  final dynamic title;
  final dynamic image;
  final dynamic releasedate;
  final dynamic Genres;
  final dynamic Stoyline;

  MoviesDetails({
    required this.title,
    required this.image,
    required this.releasedate,
    required this.Genres,
    required this.Stoyline,
  });

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067,
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ReuseableRow(
                            name: "Release Date",
                            value: widget.releasedate.toString()),
                        ReuseableRow(
                            name: "Storyline:",
                            value: widget.Stoyline.toString()),
                        ReuseableRow(
                            name: "Genres:",
                            value: widget.Genres.toString()),
                        // Add additional widgets and content here
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50.0,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: widget.image,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
