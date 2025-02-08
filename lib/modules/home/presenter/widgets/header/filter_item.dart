import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
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
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
