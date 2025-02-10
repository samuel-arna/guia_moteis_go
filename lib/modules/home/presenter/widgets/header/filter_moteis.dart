import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/presenter/stores/home_store.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/header/filter_item.dart';
import 'package:provider/provider.dart';

class FilterMoteis extends StatefulWidget {
  const FilterMoteis({super.key});

  @override
  State<FilterMoteis> createState() => _FilterMoteisState();
}

class _FilterMoteisState extends State<FilterMoteis> {
  List<Widget> _buildFilters(Set<String> list) {
    List<Widget> nList = [];
    for (var filter in list) {
      nList.add(FilterItem(label: filter.toLowerCase()));
    }
    return nList;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStore>(builder: (context, store, child) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border(
            bottom: BorderSide(
              color: const Color.fromARGB(255, 192, 192, 192),
              width: 0.5,
            ),
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                FilterItem(
                  label: 'filtros',
                  icon: FontAwesomeIcons.sliders,
                ),
                ..._buildFilters(store.getCategories()),
              ],
            ),
          ),
        ),
      );
    });
  }
}
