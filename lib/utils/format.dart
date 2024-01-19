extension NumberFormatter on int {
  String formatK() {
    if (this > 1000) {
      return '${(this / 1000).floor()}k';
    }
    return toString();
  }
}
