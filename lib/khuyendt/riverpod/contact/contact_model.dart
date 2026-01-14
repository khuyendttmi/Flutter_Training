class Contact {
  final String id;
  final String name;
  final String numberPhone;

  Contact({required this.id, required this.name, required this.numberPhone});

  Contact copyWith({String? id, String? name, String? numberPhone}) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      numberPhone: numberPhone ?? this.numberPhone,
    );
  }
}
