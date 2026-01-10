class Psalm {
  int num;
  String description;
  String text;

  Psalm({required this.num, required this.description, required this.text});

  getPsalmNumber() {
    return this.num;
  }

  getPsalmDescription() {
    return this.description;
  }

  getPsalmText() {
    return this.text;
  }
}
