import 'package:flutter/material.dart';

class ListViewWrapper extends StatefulWidget {
  final List<Widget> data;

  const ListViewWrapper({super.key, required this.data});

  @override
  State<ListViewWrapper> createState() => _ListViewWrapperState();
}

class _ListViewWrapperState extends State<ListViewWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsetsGeometry.all(10),
        children: widget.data,
      ),
    );
  }
}
