import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';

class HeaderSuite extends StatefulWidget {
  final Suites suite;
  const HeaderSuite({super.key, required this.suite});

  @override
  State<HeaderSuite> createState() => _HeaderSuiteState();
}

class _HeaderSuiteState extends State<HeaderSuite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.borderColor,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.suite.fotos!.first,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (widget.suite.nome ?? '').toLowerCase(),
                    style: GoogleFonts.epilogue(
                      color: AppColors.strongText,
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  widget.suite.exibirQtdDisponiveis ?? false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidBell,
                              size: 10,
                              color: AppColors.primary,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'só mais ${widget.suite.qtd} pelo app',
                              style: GoogleFonts.epilogue(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
