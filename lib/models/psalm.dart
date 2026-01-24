class Psalm {
  int num;
  String? title;
  String description;
  String text;

  Psalm({
    required this.num,
    this.title,
    required this.description,
    required this.text
  });

  getNumber() {
    return this.num;
  }

  getTitle() {
    return this.title;
  }

  getDescription() {
    return this.description;
  }

  getText() {
    return this.text;
  }
}
