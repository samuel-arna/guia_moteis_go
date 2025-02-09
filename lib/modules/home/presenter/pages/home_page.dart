import 'package:flutter/material.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/header/header.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/list_moteis.dart';
import 'package:provider/provider.dart';
import 'package:guiamoteisgo/modules/home/presenter/stores/home_store.dart';

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
      child: Scaffold(
        body: Column(
          children: [
            Header(),
            ListMoteis(),
          ],
        ),
      ),
    );
  }
}
