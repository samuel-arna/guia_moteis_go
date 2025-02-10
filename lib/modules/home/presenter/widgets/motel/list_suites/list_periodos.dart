import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/categorias_itens.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/header_suite.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/list_prices.dart';

class ListSuites extends StatefulWidget {
  final List<Suites> suites;
  const ListSuites({super.key, required this.suites});

  @override
  State<ListSuites> createState() => _ListSuitesState();
}

class _ListSuitesState extends State<ListSuites> {
  final ExpandableCarouselController _controller =
      ExpandableCarouselController();
  @override
  Widget build(BuildContext context) {
    return ExpandableCarousel.builder(
      options: ExpandableCarouselOptions(
        viewportFraction: 0.9,
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        autoPlay: false,
        controller: _controller,
        floatingIndicator: false,
        showIndicator: false,
        restorationId: 'expandable_carousel',
      ),
      itemCount: widget.suites.length,
      itemBuilder: (context, index, realIdx) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              HeaderSuite(
                suite: widget.suites[index],
              ),
              CategoriasItens(
                itens: widget.suites[index].categoriaItens ?? [],
              ),
              ListPeriodos(
                periodos: widget.suites[index].periodos ?? [],
              )
            ],
          ),
        );
      },
    );
  }
}
