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

  // @observable
  // ObservableList<Note> notes = ObservableList();

  // @observable
  // ObservableSet<Note> checkedNotes = ObservableSet();

  @action
  void check(Note note) {
    // checkedNotes.add(note);
    note.isChecked = true;
    _noteDao.updateNote(note);
  }

  @action
  void uncheck(Note note) {
    note.isChecked = false;
    // checkedNotes.remove(note);
    _noteDao.updateNote(note);
  }

  bool isChecked(Note note) => notes.value[note.id].isChecked;
  // bool isChecked(Note note) => checkedNotes.contains(note);

  @action
  void findAll() {
    notes = _noteDao
        .findAllNotes()
        // .then((value) => notes = value.asObservable())
        .asObservable();
  }

  @observable
  ObservableFuture saveFuture = ObservableFuture.value(null);

  @action
  void save(Note note) {
    saveFuture = _noteDao.saveNote(note).asObservable();
    // notes.add(note);
  }
}

class NoteStoreFactory {
  static NoteStore create() {
    return NoteStore(
      DatabaseProvider().appDatabase.noteDao,
    );
  }
}
