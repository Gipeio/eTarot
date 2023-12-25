  class User {
    final String name;
    final int age;

    User({
      required this.name,
      required this.age,
    });

    Map<String, dynamic> toJson() => {
      'name': name,
      'age': age,
    };
  }