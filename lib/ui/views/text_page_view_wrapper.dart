import 'package:flutter/material.dart';

class TextPageViewWrapper extends StatefulWidget {
  final List<Widget> data;

  const TextPageViewWrapper({super.key, required this.data});

  @override
  State<TextPageViewWrapper> createState() => _TextPageViewWrapperState();
}

class _TextPageViewWrapperState extends State<TextPageViewWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
              children: widget.data
          ),
        ),
      ),
    );
  }
}
