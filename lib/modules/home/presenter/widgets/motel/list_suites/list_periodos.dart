import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          padding: const EdgeInsets.only(top: 3),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.borderColor,
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            periodo.tempoFormatado ?? '',
                            style: GoogleFonts.epilogue(
                              fontSize: 21,
                              color: AppColors.strongText,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          periodo.desconto != null
                              ? Container(
                                  height: 21,
                                  width: 66,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.green,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${((periodo.desconto?.desconto ?? 0) / (periodo.valor ?? 1) * 100).toStringAsFixed(0)}% off',
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                      periodo.desconto != null
                          ? Row(
                              children: [
                                Text(
                                  'R\$ ${periodo.valor!.toStringAsFixed(2).replaceAll('.', ',')}',
                                  style: GoogleFonts.epilogue(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColors.lightText,
                                    fontSize: 21,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'R\$ ${periodo.valorTotal!.toStringAsFixed(2).replaceAll('.', ',')}',
                                  style: GoogleFonts.epilogue(
                                    color: AppColors.strongText,
                                    fontSize: 21,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              'R\$ ${periodo.valorTotal!.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: GoogleFonts.epilogue(
                                color: AppColors.strongText,
                                fontSize: 21,
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
