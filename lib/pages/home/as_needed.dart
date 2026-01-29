import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/ui/views/text_page_view_wrapper.dart';

class AsNeeded extends StatefulWidget {
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
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight
                    .bold),
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
            ],
          )
        ]);
  }
}
