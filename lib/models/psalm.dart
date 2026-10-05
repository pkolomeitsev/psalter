import 'package:orth_psalter/models/dto/verse_dto.dart';

class Psalm {
  int num;
  String? title;
  String description;
  List<VerseDto> verses;
  String? text;

  Psalm({
    required this.num,
    this.title,
    required this.description,
    required this.verses
  });

  setTitle(String title) {
    this.title = title;
  }

  getNumber() {
    return this.num;
  }

  getTitle() {
    return this.title;
  }

  getDescription() {
    return this.description;
  }

  getPsalmVerses() {
    return this.verses;
  }

  getText() {
    return this.text;
  }
}
