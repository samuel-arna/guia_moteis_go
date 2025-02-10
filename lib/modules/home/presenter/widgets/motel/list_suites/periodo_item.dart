import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/periodos_model.dart';

class PeriodoItem extends StatefulWidget {
  final Periodos periodo;
  const PeriodoItem({super.key, required this.periodo});

  @override
  State<PeriodoItem> createState() => _PeriodoItemState();
}

class _PeriodoItemState extends State<PeriodoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ],
        ),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.periodo.tempoFormatado ?? '',
                        style: GoogleFonts.epilogue(
                          fontSize: 21,
                          color: AppColors.strongText,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      widget.periodo.desconto != null
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
                                  '${((widget.periodo.desconto!.desconto! / widget.periodo.valor!) * 100).toStringAsFixed(0)}% off',
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
                  widget.periodo.desconto != null
                      ? Row(
                          children: [
                            Text(
                              'R\$ ${widget.periodo.valor!.toStringAsFixed(2).replaceAll('.', ',')}',
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
                              'R\$ ${widget.periodo.valorTotal!.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: GoogleFonts.epilogue(
                                color: AppColors.strongText,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'R\$ ${widget.periodo.valorTotal!.toStringAsFixed(2).replaceAll('.', ',')}',
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
    );
  }
}
