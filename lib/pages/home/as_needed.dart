import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jungers_psalter/models/enums/entity_type.dart';
import 'package:jungers_psalter/storage/psalm_storage.dart';
import 'package:jungers_psalter/ui/views/text_page_view_wrapper.dart';

class AsNeeded extends StatefulWidget {
  final int psalmAmount = (PsalmStorage.psalmsAmount - 1);
  const AsNeeded({super.key});

  @override
  State<AsNeeded> createState() => _AsNeededState();
}

class _AsNeededState extends State<AsNeeded> {
  String psalms = 'psalms';

  @override
  Widget build(BuildContext context) {
    return TextPageViewWrapper(
        data: [
          Column(
            children: [
              DefaultTextStyle.merge(
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
                child: Text(
                  context.tr('psalterReadingAsNeeded'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              DefaultTextStyle.merge(
                style: const TextStyle(fontSize: 16),
                child: Text(
                    context.tr('psalterReadingRuleByStArseniosTheCappadocian')),
              ),
              SizedBox(height: 10),
              DefaultTextStyle.merge(
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                child: Text(
                    context.tr('psalterReadingAsNeededHelp')),
              ),
              SizedBox(height: 10),
              this.renderPsalms(context),
            ],
          )
        ]);
  }

  Widget renderPsalms(BuildContext context) {
    List<Widget> psalms = [];
    for (var num = 1; num <= widget.psalmAmount; num++) {
      String description = context.tr('psalm${num}AsNeeded');

      psalms.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text('$num.')),
              Expanded(flex: 9,
                  child: InkWell(
                      onTap: () {
                        context.go('/${EntityType.psalm.name}/$num');
                      },
                      child: Text(description,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      )
                  )
              )
            ],
          )
      );

      psalms.add(SizedBox(height: 10));

      if (num == 148) {
        psalms.add(
            DefaultTextStyle.merge(
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              child: Text(
                  context.tr('psalm149150AsNeededHelp')),
            )
        );
        psalms.add(SizedBox(height: 10));
      }
    }

    return Column(
      children: psalms,
    );
  }
}
