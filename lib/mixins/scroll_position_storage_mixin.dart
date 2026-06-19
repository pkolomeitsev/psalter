import 'package:flutter/material.dart';
import 'package:orth_psalter/helpers/debouncer_helper.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/storage/scroll_position_storage.dart';

mixin ScrollPositionStorageMixin {
  final ScrollController scrollController = ScrollController();
  final debouncer = DebouncerHelper(milliseconds: 1000);
  late EntityType type = EntityType.none;

  void initScrollPositionStorageMixin(EntityType type) {
    this.type = type;
    this.scrollController.addListener(this.saveScrollPosition);
    this.restoreScrollPosition();
  }

  ScrollController getScrollController() => this.scrollController;

  void saveScrollPosition() async {
    debouncer.run(() async {
      await ScrollPositionStorage.setOffset(
        this.type,
        this.scrollController.position.pixels,
        listView: true,
      );
    });
  }

  void restoreScrollPosition() async {
    final scrollValue = await ScrollPositionStorage.getOffset(
      this.type,
      listView: true,
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