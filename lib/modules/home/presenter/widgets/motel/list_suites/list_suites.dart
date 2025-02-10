import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';
import 'package:guiamoteisgo/modules/home/presenter/stores/home_store.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/categorias_itens.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/header_suite.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/list_periodos.dart';
import 'package:provider/provider.dart';

class ListSuites extends StatefulWidget {
  final List<Suites> suites;
  const ListSuites({super.key, required this.suites});

  @override
  State<ListSuites> createState() => _ListSuitesState();
}

class _ListSuitesState extends State<ListSuites> {
  List<Widget> _buildSuites(List<Suites> suites) {
    List<Widget> nList = [];

    for (var i = 0; i < suites.length; i++) {
      nList.add(
        Padding(
          padding: const EdgeInsets.all(6),
          child: Flex(
            direction: Axis.vertical,
            children: [
              HeaderSuite(
                suite: suites[i],
              ),
              CategoriasItens(
                itens: suites[i].categoriaItens ?? [],
              ),
              ListPeriodos(
                periodos: suites[i].periodos ?? [],
              )
            ],
          ),
        ),
      );
    }
    return nList;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStore>(builder: (context, store, child) {
      return FlutterCarousel(
        options: FlutterCarouselOptions(
          height: 780,
          viewportFraction: 0.9,
          disableCenter: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: false,
          autoPlay: false,
          floatingIndicator: false,
          showIndicator: false,
        ),
        items: _buildSuites(store.getFilteredSuites(widget.suites)),
      );
    });
  }
}
