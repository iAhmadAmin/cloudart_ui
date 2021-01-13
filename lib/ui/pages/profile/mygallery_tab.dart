import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyGalleryTab extends StatefulWidget {
  @override
  _MyGalleryTabState createState() => _MyGalleryTabState();
}

class _MyGalleryTabState extends State<MyGalleryTab> {
  List<String> artsPath = [
    "assets/images/art1.png",
    "assets/images/art3.png",
    "assets/images/art4.png",
    "assets/images/art5.png",
    "assets/images/art2.png",
    "assets/images/art6.png",
    "assets/images/art7.png",
    "assets/images/art8.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: artsPath.length,
        itemBuilder: (context, i) {
          String imgPath = artsPath[i];
          return Material(
            elevation: 0.0,
            borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(imgPath, fit: BoxFit.cover)),
          );
        },
        staggeredTileBuilder: (i) =>
            new StaggeredTile.count(2, i.isEven ? 2 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}

class ImageSize {
  final double height;
  final double width;
  ImageSize({@required this.height, @required this.width});
}
