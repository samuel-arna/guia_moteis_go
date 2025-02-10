import 'package:flutter/material.dart';

class FotosSuite extends StatefulWidget {
  final List<String> fotos;
  const FotosSuite({super.key, required this.fotos});

  @override
  State<FotosSuite> createState() => _FotosSuiteState();
}

List<Widget> _buildFotos(List<String> list) {
  List<Widget> nList = [];
  for (var i = 0; i < list.length; i++) {
    bool isFullWidth = (i + 1) % 4 == 1 || (i + 1) % 4 == 0;
    nList.add(
      Expanded(
        flex: isFullWidth ? 2 : 1,
        child: Container(
          height: 150,
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
    );
  }
  return nList;
}

class _FotosSuiteState extends State<FotosSuite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: _buildFotos(widget.fotos),
      ),
    );
  }
}
