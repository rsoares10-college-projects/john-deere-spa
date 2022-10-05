// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TicketModel {
  final String name;
  final String description;

  TicketModel({
    required this.name,
    required this.description,
  });

  TicketModel copyWith({
    String? name,
    String? description,
  }) {
    return TicketModel(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) => TicketModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TicketModel(name: $name, description: $description)';

  @override
  bool operator ==(covariant TicketModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode;
}
