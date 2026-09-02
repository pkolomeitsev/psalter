import 'package:flutter/material.dart';
import 'package:orth_psalter/models/dto/simple_dto.dart';

class SegmentedSelectorButton extends StatefulWidget {
  final List<SimpleDto> segments;
  final int defaultItemId;
  final String identifier;
  final Function(dynamic)? callback;

  const SegmentedSelectorButton({
    super.key,
    required this.segments,
    this.defaultItemId = 0,
    this.identifier = 'segment_button',
    this.callback,
  });

  @override
  State<SegmentedSelectorButton> createState() => _SegmentedSelectorButtonState();
}

class _SegmentedSelectorButtonState extends State<SegmentedSelectorButton> {
  SimpleDto? selectedItem;

  @override
  Widget build(BuildContext context) {
    List<ButtonSegment<SimpleDto>> segments = [];
    for (var segmentData in widget.segments) {
      segments.add(
        ButtonSegment<SimpleDto>(
          value: segmentData,
          label: Text(segmentData.getLabel(), overflow: TextOverflow.ellipsis),
          icon: (segmentData.getIcon() != null)
            ? Icon(segmentData.getIcon() as IconData?)
            : null,
        ),
      );
    }

    return Semantics(
      identifier: widget.identifier,
      child: SegmentedButton(
        segments: segments,
        selected: <SimpleDto>{this.selectedItem ?? widget.segments[widget.defaultItemId]},
        onSelectionChanged: (Set<dynamic> newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            this.selectedItem = newSelection.first;
            widget.callback?.call(this.selectedItem?.getValue().index);
          });
        },
      ),
    );
  }
}
