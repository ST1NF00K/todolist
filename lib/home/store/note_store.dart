import 'package:mobx/mobx.dart';
import 'package:todolist/home/dao/note_dao.dart';
import 'package:todolist/home/model/note.dart';
import 'package:todolist/shared/database/database_factory.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  final NoteDao _noteDao;

  _NoteStoreBase(this._noteDao);

  @observable
  ObservableFuture<List<Note>> notes = ObservableFuture.value(null);

  @action
  void check(Note note) {
    note.isChecked = !note.isChecked;
    _noteDao.updateNote(note);
  }

  @action
  void findAll() {
    notes = _noteDao.findAllNotes().asObservable();
  }

  @observable
  ObservableFuture saveFuture = ObservableFuture.value(null);

  @observable
  ObservableFuture deleteFuture = ObservableFuture.value(null);

  @action
  void save(Note note) {
    saveFuture = _noteDao.saveNote(note).asObservable();
  }

  @action
  void remove(Note note) {
    deleteFuture = _noteDao.deleteNote(note).asObservable();
  }
}

class NoteStoreFactory {
  static NoteStore create() {
    return NoteStore(
      DatabaseProvider().appDatabase.noteDao,
    );
  }
}
