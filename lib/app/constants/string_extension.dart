

extension StringExtension on String {
  String removeLeadingZero() {
    var regex = RegExp(r"^0+(?!$)");
    return this.replaceAll(regex, "");
  }
}
