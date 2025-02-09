import 'package:flutter/widgets.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/moteis_model.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/header_motel.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites.dart';

class Motel extends StatefulWidget {
  final Moteis motel;
  const Motel({super.key, required this.motel});

  @override
  State<Motel> createState() => _MotelState();
}

class _MotelState extends State<Motel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderMotel(
          logoUrl: widget.motel.logo!,
          fantasia: widget.motel.fantasia!,
          bairro: widget.motel.bairro!,
          media: widget.motel.media.toString(),
          qntAval: widget.motel.qtdAvaliacoes.toString(),
        ),
        ListSuites(
          suites: widget.motel.suites ?? [],
        ),
      ],
    );
  }
}
