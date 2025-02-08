import 'package:flutter/material.dart';
import 'package:guiamoteisgo/modules/home/presenter/stores/home_store.dart';
import 'package:provider/provider.dart';

class ListMoteis extends StatefulWidget {
  const ListMoteis({super.key});

  @override
  State<ListMoteis> createState() => _ListMoteisState();
}

class _ListMoteisState extends State<ListMoteis> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStore>(
      builder: (_, store, child) => Container(
        height: MediaQuery.of(context).size.height - 150,
        color: Colors.amber,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: store.listMoteis.length,
          itemBuilder: (_, i) => Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                color: Colors.blue,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 150,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
