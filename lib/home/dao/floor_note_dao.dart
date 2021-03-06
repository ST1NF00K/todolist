import 'package:floor/floor.dart';
import 'package:todolist/home/dao/note_dao.dart';
import 'package:todolist/home/model/note.dart';

@dao
abstract class FloorNoteDao implements NoteDao {  
  
  @override
  @Query('SELECT * FROM Note')
  Stream<List<Note>> findAllNotesAsStream();

  @override
  @Query('SELECT * FROM Note')
  Future<List<Note>> findAllNotes();

  @override
  @Query('SELECT * FROM Note WHERE id = :id')
  Stream<Note> findByIdAsStream(int id);

  @override
  @Query('SELECT * FROM Note WHERE id = :id')
  Future<Note> findById(int id);

  @override
  @insert
  Future<void> saveNote(Note note);

  @override
  @update
  Future<void> updateNote(Note note);

  @override
  @delete
  Future<void> deleteNote(Note note);
}
