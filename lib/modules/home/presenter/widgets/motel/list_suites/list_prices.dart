import 'package:flutter/material.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/periodos_model.dart';

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
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 3),
                    blurRadius: 6,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: AppColors.lightText,
                      width: 2,
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        periodo.tempoFormatado ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.lightText,
                        ),
                      ),
                      Text(
                        'R\$ ${periodo.valorTotal!.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: TextStyle(
                          color: AppColors.lightText,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
