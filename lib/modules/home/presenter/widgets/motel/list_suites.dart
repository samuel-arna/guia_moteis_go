import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:guiamoteisgo/core/utils/app_colors.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';

class ListSuites extends StatefulWidget {
  final List<Suites> suites;
  const ListSuites({super.key, required this.suites});

  @override
  State<ListSuites> createState() => _ListSuitesState();
}

class _ListSuitesState extends State<ListSuites> {
  final ExpandableCarouselController _controller =
      ExpandableCarouselController();
  @override
  Widget build(BuildContext context) {
    return ExpandableCarousel.builder(
      options: ExpandableCarouselOptions(
        viewportFraction: 0.9,
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        autoPlay: false,
        controller: _controller,
        floatingIndicator: false,
        showIndicator: false,
        restorationId: 'expandable_carousel',
      ),
      itemCount: widget.suites.length,
      itemBuilder: (context, index, realIdx) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Container(
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
                              widget.suites[index].fotos!.first,
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Text(
                          widget.suites[index].nome ?? '',
                          style: TextStyle(
                            color: AppColors.strongText,
                            fontWeight: FontWeight.w400,
                            fontSize: 21,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
