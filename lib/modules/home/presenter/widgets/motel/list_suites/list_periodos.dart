import 'package:flutter/material.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/periodos_model.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/periodo_item.dart';

class ListPeriodos extends StatefulWidget {
  final List<Periodos> periodos;
  const ListPeriodos({super.key, required this.periodos});

  @override
  State<ListPeriodos> createState() => _ListPeriodosState();
}

class _ListPeriodosState extends State<ListPeriodos> {
  List<Widget> _buildPeriodos(List<Periodos> periodos) {
    List<Widget> nList = [];
    for (var periodo in periodos) {
      nList.add(
        PeriodoItem(periodo: periodo),
      );
    }

    return nList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [..._buildPeriodos(widget.periodos)],
    );
  }
}
