// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoteStore on _NoteStoreBase, Store {
  final _$notesAtom = Atom(name: '_NoteStoreBase.notes');

  @override
  ObservableFuture<List<Note>> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableFuture<List<Note>> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
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
notes: ${notes},
saveFuture: ${saveFuture}
    ''';
  }
}
