class UtilsHelper {
  static String capitalize(String str) =>
      '${str[0].toUpperCase()}${str.substring(1)}';

  static List<int> stringListToInt(List<String> stringList) =>
      stringList.map((i) => int.parse(i)).toList();

  static List<String> intListToString(List<int> intList) =>
      intList.map((i) => i.toString()).toList();
}
