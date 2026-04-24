import 'package:flutter/material.dart';
import 'package:orth_psalter/models/psalm.dart' as psalm_model;
import 'package:orth_psalter/storage/psalm_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/app_font.dart';
import 'package:orth_psalter/ui/views/text_page_view_wrapper.dart';

class Psalm extends StatefulWidget {
  final String psalmId;

  const Psalm({super.key, this.psalmId = ''});

  @override
  State<Psalm> createState() => _PsalmState();
}

class _PsalmState extends State<Psalm> {
  Future<psalm_model.Psalm> fetchData() async {
    return await PsalmStorage.getPsalmById(widget.psalmId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          '${context.tr('psalm')} ${widget.psalmId}',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<psalm_model.Psalm>(
        future: this.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return TextPageViewWrapper(
              data: [
                DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textHeadingColor,
                  ),
                  child: SelectableText(
                    snapshot.data!.getDescription(),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                DefaultTextStyle.merge(
                  style: const TextStyle(fontSize: AppFont.comfortReadingSize),
                  child: SelectableText(snapshot.data!.getText()),
                ),
                SizedBox(height: 50),
              ],
            );
          }

          return const Center(child: Text('No data found'));
        },
      ),
    );
  }
}
