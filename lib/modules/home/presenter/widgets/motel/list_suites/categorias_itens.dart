import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/categoria_itens_model.dart';

class CategoriasItens extends StatefulWidget {
  final List<CategoriaItens> itens;
  const CategoriasItens({super.key, required this.itens});

  @override
  State<CategoriasItens> createState() => _CategoriasItensState();
}

class _CategoriasItensState extends State<CategoriasItens> {
  List<Widget> _buildItens(List<CategoriaItens> list) {
    List<Widget> nList = [];
    for (int i = 0; i < list.length; i++) {
      var item = list[i];
      if (i < 5) {
        nList.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.background,
              ),
              height: 45,
              width: 45,
              child: Image.network(item.icone!),
            ),
          ),
        );
      }
    }
    return nList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Container(
        height: 75,
        width: double.maxFinite,
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ..._buildItens(widget.itens),
                SizedBox(
                  width: 42,
                  child: Text(
                    'ver todos',
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
