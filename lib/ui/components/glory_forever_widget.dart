import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GloryForeverWidget extends StatelessWidget {
  const GloryForeverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: ,
      children: [
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          child: Text(
            context.tr('gloryForeverShort'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 16),
          child: Text(context.tr('gloryForever')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 16),
          child: Text(context.tr('hallelujah3T')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 16),
          child: Text(context.tr('lordHaveMercy3T')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 16),
          child: Text(context.tr('gloryForever')),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
