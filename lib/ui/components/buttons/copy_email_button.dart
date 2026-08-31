import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyEmailButton extends StatelessWidget {
  final String email;

  const CopyEmailButton({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.copy),
      label: Text(this.email),
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: this.email));
      }
    );
  }
}
