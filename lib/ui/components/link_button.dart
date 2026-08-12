import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String link;
  final String label;
  const LinkButton({super.key, required this.link, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      iconAlignment: IconAlignment.end,
      onPressed: () async {
        final Uri toLaunch = Uri.parse(this.link);
        if (!await launchUrl(
          toLaunch,
          mode: LaunchMode.inAppBrowserView,
        )) {
          throw Exception('Could not launch $toLaunch');
        }
      },
      label: Text(this.label),
      icon: const Icon(Icons.launch, size: 16),
    );
  }
}
