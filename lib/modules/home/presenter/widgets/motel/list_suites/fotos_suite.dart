import 'package:flutter/material.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class FotosSuite extends StatefulWidget {
  final List<String> fotos;
  const FotosSuite({super.key, required this.fotos});

  @override
  State<FotosSuite> createState() => _FotosSuiteState();
}

List<Widget> _buildFotos(List<String> list, BuildContext context) {
  List<Image> images = [];
  for (var imagem in list) {
    images.add(Image(image: NetworkImage(imagem)));
  }

  List<Widget> nList = [];
  for (var i = 0; i < list.length; i++) {
    bool isFullWidth = (i + 1) % 4 == 1 || (i + 1) % 4 == 0;
    nList.add(
      SizedBox(
        height: 150,
        width: isFullWidth
            ? MediaQuery.of(context).size.width
            : (MediaQuery.of(context).size.width / 2) - 3 - 6,
        child: GestureDetector(
          onTap: () {
            SwipeImageGallery(
              context: context,
              children: images,
            ).show();
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  list[i],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
  return nList;
}

class _FotosSuiteState extends State<FotosSuite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(6),
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: _buildFotos(widget.fotos, context),
          ),
        ),
      ),
    );
  }
}
