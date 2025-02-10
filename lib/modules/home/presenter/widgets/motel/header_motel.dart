import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';

class HeaderMotel extends StatelessWidget {
  final String logoUrl;
  final String fantasia;
  final String bairro;
  final String media;
  final String qntAval;

  const HeaderMotel({
    super.key,
    required this.logoUrl,
    required this.fantasia,
    required this.bairro,
    required this.media,
    required this.qntAval,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(logoUrl),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fantasia.toLowerCase(),
                    style: GoogleFonts.epilogue(
                      fontSize: 27,
                      color: AppColors.strongText,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    bairro.toLowerCase(),
                    style: GoogleFonts.epilogue(
                      fontSize: 14,
                      color: AppColors.lightText,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.amber),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.amber,
                              size: 10,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              media,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.strongText,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 9),
                      Text(
                        '$qntAval avaliações',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.strongText,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const FaIcon(
                        FontAwesomeIcons.chevronDown,
                        color: AppColors.strongText,
                        size: 9,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Color.fromARGB(255, 183, 179, 179),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
