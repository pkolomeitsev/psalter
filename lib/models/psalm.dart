import 'package:orth_psalter/models/dto/verse_dto.dart';

class Psalm {
  int num;
  String? title;
  String description;
  List<VerseDto> verses;

  Psalm({
    required this.num,
    this.title,
    required this.description,
    required this.verses
  });

  void setTitle(String title) {
    this.title = title;
  }

  int getNumber() {
    return this.num;
  }

  String? getTitle() {
    return this.title;
  }

  String getDescription() {
    return this.description;
  }

  List<VerseDto> getPsalmVerses() {
    return this.verses;
  }
}
