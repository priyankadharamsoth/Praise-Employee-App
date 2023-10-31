enum Gender {
  male(1, "Male"),
  female(2, "Female");

  final int id;
  final String name;
  const Gender(this.id, this.name);
}
