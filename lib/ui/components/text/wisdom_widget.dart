import 'package:flutter/material.dart';

class WisdomWidget extends StatelessWidget {
  final String wisdom;
  final String author;
  final String? assetImage;
  final TextStyle? wisdomTextStyle;
  final TextStyle? authorTextStyle;

  const WisdomWidget({
    super.key,
    required this.wisdom,
    required this.author,
    this.assetImage,
    this.wisdomTextStyle,
    this.authorTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          spacing: 10,
          children: <Widget>[
            if (this.assetImage != null) ...[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(this.assetImage ?? ''),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  SelectableText(this.wisdom, style: this.wisdomTextStyle),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SelectableText(
              this.author,
              style: this.authorTextStyle,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }
}
