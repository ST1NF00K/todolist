import 'package:mobx/mobx.dart';
import 'package:todolist/home/data/dao/note_dao.dart';
import 'package:todolist/home/data/model/note.dart';
import 'package:todolist/shared/database/database_factory.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  final NoteDao _noteDao;

  _NoteStoreBase(this._noteDao);

  @observable
  ObservableFuture<List<Note>> notes = ObservableFuture.value(null);

  @observable
  ObservableFuture saveFuture = ObservableFuture.value(null);

  @action
  void check(bool isChecked, Note note) {
    note.isChecked = isChecked;
    DatabaseProvider().appDatabase.noteDao.updateNote(note).asObservable();
  }

  @action
  void findAll() {
    notes = _noteDao.findAllNotes().asObservable();
  }

  @action
  void save(Note note) {
    saveFuture = _noteDao.saveNote(note).asObservable();
  }

  @action
  void remove(Note note) {
    _noteDao.deleteNote(note).asObservable();
  }
}

class NoteStoreFactory {
  static NoteStore create() {
    return NoteStore(
      DatabaseProvider().appDatabase.noteDao,
    );
  }
}
