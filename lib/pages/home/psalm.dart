import 'package:flutter/material.dart';
import 'package:jungers_psalter/models/psalm.dart' as psalm_model;
import 'package:jungers_psalter/storage/psalm_storage.dart';
import 'package:easy_localization/easy_localization.dart';

class Psalm extends StatefulWidget {
  final String? psalmId;
  const Psalm({super.key, this.psalmId = ''});

  @override
  State<Psalm> createState() => _PsalmState();
}

class _PsalmState extends State<Psalm> {
  late psalm_model.Psalm psalm;

  Future<psalm_model.Psalm> fetchData() async {
    return await PsalmStorage.getPsalmById(widget.psalmId ?? '');
  }

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
      body: FutureBuilder<psalm_model.Psalm>(
        future: this.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Center(
              child: Text('Data loaded: ${snapshot.data!.getPsalmDescription()}'),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
