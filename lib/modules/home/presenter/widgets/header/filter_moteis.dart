import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/header/filter_item.dart';

class FilterMoteis extends StatefulWidget {
  const FilterMoteis({super.key});

  @override
  State<FilterMoteis> createState() => _FilterMoteisState();
}

class _FilterMoteisState extends State<FilterMoteis> {
  //mock
  List<String> filtros = [
    'com desconto',
    'disponíveis',
    'hidro',
    'piscina',
    'sauna',
    'ofurô',
    'decoração erótica',
    'decoração temática',
    'cadeira erótica',
    'pista de dança',
    'garagem privativa',
    'frigobar',
    'internet wi-fi',
    'suite para festas',
    'suite com acessibilidade',
  ];
  List<Widget> _buildFilters(List<String> list) {
    List<Widget> nList = [];
    for (var filter in list) {
      nList.add(FilterItem(label: filter));
    }
    return nList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(9),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              FilterItem(
                label: 'filtros',
                icon: FontAwesomeIcons.sliders,
              ),
              ..._buildFilters(filtros),
            ],
          ),
        ),
      ),
    );
  }
}
