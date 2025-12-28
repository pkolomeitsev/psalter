import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Psalm extends StatefulWidget {
  final String? psalmId;
  const Psalm({super.key, this.psalmId = ''});

  @override
  State<Psalm> createState() => _PsalmState();
}

class _PsalmState extends State<Psalm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.white
        ),
        title: Text('${'psalm'.tr()} ${widget.psalmId}', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Placeholder(),
    );
  }
}
