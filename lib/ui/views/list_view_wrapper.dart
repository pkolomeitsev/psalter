import 'package:flutter/material.dart';

class ListViewWrapper extends StatefulWidget {
  final List<Widget> data;
  final ScrollController? scrollController;

  const ListViewWrapper({
    super.key,
    required this.data,
    this.scrollController
  });

  @override
  State<ListViewWrapper> createState() => _ListViewWrapperState();
}

class _ListViewWrapperState extends State<ListViewWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: widget.scrollController,
      child: ListView(
        controller: widget.scrollController,
        padding: EdgeInsetsGeometry.all(10),
        children: widget.data,
      ),
    );
  }
}
