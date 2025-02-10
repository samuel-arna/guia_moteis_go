import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';

class MapFab extends StatefulWidget {
  const MapFab({super.key});

  @override
  State<MapFab> createState() => _MapFabState();
}

class _MapFabState extends State<MapFab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 42,
        width: 87,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(3, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.map,
                color: AppColors.primary,
                size: 12,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'mapa',
                style: GoogleFonts.epilogue(
                  color: AppColors.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
