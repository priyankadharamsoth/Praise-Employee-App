enum ColorCode {
  pink(1, "0xFFF1FBFF"),
  blue(2, "0xFFFCE8F3"),
  green(3, "0xFFFEF8E8"),
  yellow(4, "0xFFF3F7EB");

  final int id;
  final String color;
  const ColorCode(this.id, this.color);
}
