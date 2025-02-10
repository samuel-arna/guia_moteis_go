import 'package:flutter/material.dart';
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
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.suite.fotos!.first,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 12),
              child: Text(
                (widget.suite.nome ?? '').toLowerCase(),
                style: TextStyle(
                  color: AppColors.strongText,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
