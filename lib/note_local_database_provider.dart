import '../note.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteProvider {
  Box<Note>? _bookBox;
  static NoteProvider? _bookProvider;

  NoteProvider._internal();

  factory NoteProvider() {
    return _bookProvider ??= NoteProvider._internal();
  }

  String get noteName => 'Books';

  set bookBox(Box<Note> bookBox) {
    _bookBox = bookBox;
  }

  Box<Note> get bookBox => _bookBox!;

  Future<bool> insertBook({required Note note}) async {
    bookBox = await Hive.openBox<Note>(noteName);
    int effectedRows = await bookBox.add(note);
    return effectedRows > 0;
  }

  Future<List<Note>> fetchBook() async {
    List<Note> list = bookBox.values.toList();
    return list;
  }

  Future<void> updateBook({required int index, required Note book}) async {
    await bookBox.putAt(index, book);
  }

  Future<void> deleteBook({required int index}) async {
    await bookBox.deleteAt(index);
  }
}
