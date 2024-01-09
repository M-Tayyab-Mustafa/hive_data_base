// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  int id;
  @HiveField(1)
  String bookTitle;
  @HiveField(2)
  String bookAuthor;
  Note({
    required this.id,
    required this.bookTitle,
    required this.bookAuthor,
  });

  Note copyWith({
    int? id,
    String? bookTitle,
    String? bookAuthor,
  }) {
    return Note(
      id: id ?? this.id,
      bookTitle: bookTitle ?? this.bookTitle,
      bookAuthor: bookAuthor ?? this.bookAuthor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bookTitle': bookTitle,
      'bookAuthor': bookAuthor,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      bookTitle: map['bookTitle'] as String,
      bookAuthor: map['bookAuthor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Note(id: $id, bookTitle: $bookTitle, bookAuthor: $bookAuthor)';

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bookTitle == bookTitle &&
        other.bookAuthor == bookAuthor;
  }

  @override
  int get hashCode => id.hashCode ^ bookTitle.hashCode ^ bookAuthor.hashCode;
}
