import 'package:todolist/home/model/note.dart';

abstract class NoteDao {
  Stream<List<Note>> findAllNotesAsStream();

  Future<List<Note>> findAllNotes();

  Stream<Note> findByIdAsStream(int id);

  Future<Note> findById(int id);

  Future<void> saveNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deleteNote(Note note);
}