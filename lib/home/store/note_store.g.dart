// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoteStore on _NoteStoreBase, Store {
  final _$findAllFutureAtom = Atom(name: '_NoteStoreBase.findAllFuture');

  @override
  ObservableFuture<List<Note>> get findAllFuture {
    _$findAllFutureAtom.reportRead();
    return super.findAllFuture;
  }

  @override
  set findAllFuture(ObservableFuture<List<Note>> value) {
    _$findAllFutureAtom.reportWrite(value, super.findAllFuture, () {
      super.findAllFuture = value;
    });
  }

  final _$notesAtom = Atom(name: '_NoteStoreBase.notes');

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  final _$checkedNotesAtom = Atom(name: '_NoteStoreBase.checkedNotes');

  @override
  ObservableSet<Note> get checkedNotes {
    _$checkedNotesAtom.reportRead();
    return super.checkedNotes;
  }

  @override
  set checkedNotes(ObservableSet<Note> value) {
    _$checkedNotesAtom.reportWrite(value, super.checkedNotes, () {
      super.checkedNotes = value;
    });
  }

  final _$saveFutureAtom = Atom(name: '_NoteStoreBase.saveFuture');

  @override
  ObservableFuture<dynamic> get saveFuture {
    _$saveFutureAtom.reportRead();
    return super.saveFuture;
  }

  @override
  set saveFuture(ObservableFuture<dynamic> value) {
    _$saveFutureAtom.reportWrite(value, super.saveFuture, () {
      super.saveFuture = value;
    });
  }

  final _$_NoteStoreBaseActionController =
      ActionController(name: '_NoteStoreBase');

  @override
  void check(Note note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.check');
    try {
      return super.check(note);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void uncheck(Note note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.uncheck');
    try {
      return super.uncheck(note);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void findAll() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save(Note note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.save');
    try {
      return super.save(note);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
findAllFuture: ${findAllFuture},
notes: ${notes},
checkedNotes: ${checkedNotes},
saveFuture: ${saveFuture}
    ''';
  }
}
