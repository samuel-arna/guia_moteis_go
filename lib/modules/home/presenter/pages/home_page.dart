import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HomeStore>(
              builder: (_, store, child) => SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: store.listMoteis.length,
                  itemBuilder: (_, i) =>
                      Text(store.listMoteis[i].fantasia ?? ''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
