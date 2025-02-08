import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  bool agora = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 300),
              alignment: agora ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: (MediaQuery.of(context).size.width - 42 - 90) / 2,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          agora = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.boltLightning,
                            color: agora ? AppColors.primary : Colors.white,
                            size: 17,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'ir agora',
                            style: TextStyle(
                              color: agora ? Colors.black54 : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          agora = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.calendarCheck,
                            color: !agora ? AppColors.primary : Colors.white,
                            size: 17,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'ir outro dia',
                            style: TextStyle(
                              color: !agora ? Colors.black54 : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
