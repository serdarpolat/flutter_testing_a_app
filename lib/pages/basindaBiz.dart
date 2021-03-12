import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BasindaBiz extends StatefulWidget {
  @override
  _BasindaBizState createState() => _BasindaBizState();
}

class _BasindaBizState extends State<BasindaBiz>
    with AutomaticKeepAliveClientMixin {
  List photo = [
    "assets/images/haberler/haber6.jpg",
    "assets/images/haberler/haber7.jpg",
    "assets/images/haberler/haber8.jpg",
    "assets/images/haberler/haber3.jpg",
    "assets/images/haberler/haber4.jpg",
    "assets/images/haberler/haber5.jpg",
    "assets/images/haberler/haber1.jpg",
    "assets/images/haberler/haber2.jpg",
    "assets/images/haberler/haber9.jpg",
    "assets/images/haberler/haber10.jpg",
    "assets/images/haberler/haber11.jpg",
    "assets/images/haberler/haber12.jpg",
    "assets/images/haberler/haber13.jpg",
    "assets/images/haberler/haber14.jpg",
    "assets/images/haberler/haber15.jpg",
    "assets/images/haberler/haber16.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoViewGallery.builder(
          backgroundDecoration: BoxDecoration(color: Colors.white),
          enableRotation: true,
          itemCount: photo.length,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(photo[index]),
              initialScale: PhotoViewComputedScale.contained * 1,
            );
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
