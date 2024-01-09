import 'package:hive_flutter/hive_flutter.dart';
import '../note.dart';

class NoteAdopter extends TypeAdapter<Note> {
  @override
  Note read(BinaryReader reader) {
    Note book = reader.read(typeId);
    return book;
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.write(obj.toMap());
  }
}
