import 'package:flutter/material.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/header/header.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/list_moteis.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/map_fab.dart';
import 'package:provider/provider.dart';
import 'package:guiamoteisgo/modules/home/presenter/stores/home_store.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeStore>().getListMoteis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Consumer<HomeStore>(builder: (context, store, child) {
        return Skeletonizer(
          enabled: store.loading,
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Header(),
                    ListMoteis(),
                  ],
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: MapFab(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
