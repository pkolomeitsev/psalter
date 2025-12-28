import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Kathisma extends StatefulWidget {
  final String? kathismaId;
  const Kathisma({super.key, this.kathismaId = ''});

  @override
  State<Kathisma> createState() => _KathismaState();
}

class _KathismaState extends State<Kathisma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.white
        ),
        title: Text('${'kathisma'.tr()} ${widget.kathismaId}', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Placeholder(),
    );
  }
}
