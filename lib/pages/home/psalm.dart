import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orth_psalter/mixins/scroll_position_storage_mixin.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/models/psalm.dart' as psalm_model;
import 'package:orth_psalter/models/router_extra_parameters.dart';
import 'package:orth_psalter/storage/psalm_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/storage/scroll_position_storage.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/app_font.dart';
import 'package:orth_psalter/ui/views/text_page_view_wrapper.dart';

class Psalm extends StatefulWidget {
  final int psalmId;

  const Psalm({super.key, required this.psalmId});

  @override
  State<Psalm> createState() => _PsalmState();
}

class _PsalmState extends State<Psalm> with ScrollPositionStorageMixin {
  late RouterExtraParameters routerExtra;
  late double bodyFontSize;
  late double titleFontSize;

  Future<psalm_model.Psalm> fetchData(BuildContext context) async {
    this.bodyFontSize = await AppFont.getPsalterReadingFontSize();
    this.titleFontSize =
        (this.bodyFontSize + AppFont.psalterTitleFontSizeOffset);
    this.routerExtra = (GoRouterState.of(context).extra != null)
        ? GoRouterState.of(context).extra as RouterExtraParameters
        : RouterExtraParameters();
    if (this.routerExtra.isResetScrollPosition()) {
      await ScrollPositionStorage.deleteOffset(EntityType.psalm);
    }

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
        future: this.fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // initialize scroll position after async data loaded
            this.initScrollPositionStorageMixin(EntityType.psalm);

            return TextPageViewWrapper(
              data: [
                DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: this.titleFontSize,
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
                  style: TextStyle(fontSize: this.bodyFontSize),
                  child: SelectableText(snapshot.data!.getText()),
                ),
                SizedBox(height: 20),
              ],
              scrollController: this.routerExtra.isEnableScrollStorage()
                  ? this.getScrollController()
                  : null,
            );
          }

          return const Center(child: Text('No data found'));
        },
      ),
    );
  }
}
