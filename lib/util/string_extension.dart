extension StringUtils on String {
  String caseEmpty(String value) {
    if (isEmpty) {
      return value;
    }
    return this;
  }

  String get capitalize {
    return split(" ")
        .map((word) {
          if (word.length > 1) {
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          } else {
            return word;
          }
        })
        .join(" ")
        .trim();
  }
}
