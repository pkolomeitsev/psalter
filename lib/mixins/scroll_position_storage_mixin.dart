import 'package:flutter/material.dart';
import 'package:orth_psalter/helpers/debouncer_helper.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/storage/scroll_position_storage.dart';

mixin ScrollPositionStorageMixin {
  late ScrollController scrollController;
  late DebouncerHelper debouncer;
  late EntityType type;
  late bool listView;

  void initScrollPositionStorageMixin(
    EntityType type, {
    bool listView = false,
  }) {
    this.type = type;
    this.listView = listView;
    this.debouncer = DebouncerHelper();
    this.scrollController = ScrollController();
    this.scrollController.addListener(this.saveScrollPosition);
    this.restoreScrollPosition();
  }

  ScrollController getScrollController() => this.scrollController;

  void saveScrollPosition() async {
    debouncer.run(() async {
      if (this.scrollController.hasClients) {
        await ScrollPositionStorage.setOffset(
          this.type,
          this.scrollController.position.pixels,
          listView: this.listView,
        );
      }
    });
  }

  void restoreScrollPosition() async {
    final scrollValue = await ScrollPositionStorage.getOffset(
      this.type,
      listView: this.listView,
    );
    final double? offset = double.tryParse(scrollValue.toString());
    if (offset != null && offset > 0) {
      // Wait for layout rendering to complete before scrolling
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (this.scrollController.hasClients) {
          this.scrollController.jumpTo(offset);
        }
      });
    }
  }
}
