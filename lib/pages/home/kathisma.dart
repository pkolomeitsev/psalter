import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jungers_psalter/models/kathisma.dart' as kathisma_model;
import 'package:jungers_psalter/models/psalm.dart';
import 'package:jungers_psalter/storage/kathisma_storage.dart';
import 'package:jungers_psalter/ui/components/glory_forever_short_widget.dart';
import 'package:jungers_psalter/ui/components/glory_forever_widget.dart';
import 'package:jungers_psalter/ui/views/psalm_view.dart';
import 'package:jungers_psalter/ui/views/text_page_view_wrapper.dart';

class Kathisma extends StatefulWidget {
  final String? kathismaId;
  const Kathisma({super.key, this.kathismaId = ''});

  @override
  State<Kathisma> createState() => _KathismaState();
}

class _KathismaState extends State<Kathisma> {
  Future<kathisma_model.Kathisma> fetchData() async {
    return await KathismaStorage.getKathismaById(int.parse(widget.kathismaId ?? ''));
  }

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
      body:  FutureBuilder<kathisma_model.Kathisma>(
        future: this.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error} ${snapshot.stackTrace}'));
          } else if (snapshot.hasData) {

            // build everything here
            return TextPageViewWrapper(
              data: [
                this.renderPsalms(context, snapshot.data),
                SizedBox(height: 50),
              ],
            );
          }

          return const Center(child: Text('No data found'));
        },
      ),
    );
  }

  Widget renderPsalms(BuildContext context, kathisma_model.Kathisma? kathisma) {
    List<Widget> psalmWidgets = [];
    List<Psalm> psalms = kathisma!.getPsalms() ?? [];
    List<int> gloryAfter = kathisma!.getGloryAfter() ?? [];

    for(final psalm in psalms) {
      psalm.setTitle("${context.tr('psalm')} ${psalm.getNumber()}");
      psalmWidgets.add(PsalmView(psalm: psalm));
      // add 1, 2 glory
      if (gloryAfter.contains(psalm.getNumber())) {
        psalmWidgets.add(GloryForeverWidget());
      }
    }
    // add 3rd glory
    psalmWidgets.add(GloryForeverShortWidget());

    return Column(
      children: psalmWidgets,
    );
  }
}
