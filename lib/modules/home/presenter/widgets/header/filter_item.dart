import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/presenter/store/home_store.dart';
import 'package:provider/provider.dart';

class FilterItem extends StatefulWidget {
  final IconData? icon;
  final String label;
  const FilterItem({super.key, this.icon, required this.label});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStore>(builder: (context, store, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: GestureDetector(
          onTap: widget.icon != null
              ? null
              : () {
                  store.setFiltered(widget.label);
                },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  color: store.listCategories.contains(widget.label)
                      ? AppColors.primary
                      : Colors.white,
                  border: Border.all(
                    width: 0.5,
                    color: store.listCategories.contains(widget.label)
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.icon != null
                          ? Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: FaIcon(
                                widget.icon,
                                size: 12,
                                color: Colors.black54,
                              ),
                            )
                          : SizedBox(),
                      Text(
                        widget.label,
                        style: GoogleFonts.epilogue(
                          fontWeight: FontWeight.w600,
                          color: store.listCategories.contains(widget.label)
                              ? Colors.white
                              : AppColors.strongText,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              widget.icon != null && store.listCategories.isNotEmpty
                  ? Positioned(
                      top: 3,
                      left: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 15,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              store.listCategories.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}
