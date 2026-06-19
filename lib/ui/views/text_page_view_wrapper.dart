import 'package:flutter/material.dart';

class TextPageViewWrapper extends StatefulWidget {
  final List<Widget> data;
  final ScrollController? scrollController;

  const TextPageViewWrapper({
    super.key,
    required this.data,
    this.scrollController,
  });

  @override
  State<TextPageViewWrapper> createState() => _TextPageViewWrapperState();
}

class _TextPageViewWrapperState extends State<TextPageViewWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: widget.scrollController,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Container(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(children: widget.data),
        ),
      ),
    );
  }
}
