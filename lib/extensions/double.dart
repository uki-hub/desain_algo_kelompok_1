extension doubleExtension on double? {
  String toPlainString() => this.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), '');
}