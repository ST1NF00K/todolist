import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todolist/home/data/dao/floor_note_dao.dart';
import 'package:todolist/home/data/model/note.dart';
import 'package:todolist/home/view/components/checkbox_list_tile.dart';
import 'package:todolist/home/view/store/note_store.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NoteStore _noteStore;
  final _noteContent = TextEditingController();
  ReactionDisposer _disposer;

  @override
  void didChangeDependencies() {
    _initStore();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _noteContent.dispose();
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
      ),
      body: Observer(builder: (_) {
        var value = _noteStore.notes;
        if (value.status == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (value.status == FutureStatus.rejected) {
          return Center(
            child: Text("Sem itens"),
          );
        } else {
          return Observer(builder: (_) {
            return _listItems();
          });
        }
      }),
      floatingActionButton: _floatingActionButton(),
    );
  }

  void _initStore() {
    if (_noteStore == null) {
      _noteStore = NoteStoreFactory.create();
      _noteStore.findAll();
      _disposer =
          reaction((_) => _noteStore.saveFuture.status, (FutureStatus status) {
        if (status == FutureStatus.fulfilled) {
          _noteContent.clear();
          Navigator.of(context).pop();
        }
      });
    }
  }

  Widget _listItems() {
    return ListView.separated(
      itemBuilder: (context, index) {
        var item = _noteStore.notes.value[index];
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) => _noteStore.remove(item),
          child: CheckBoxListTile(
            onChanged: (b) {
              _noteStore.check(b, item);
            },
            isChecked: item.isChecked,
            title: Text(item.title),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.0),
      itemCount: _noteStore.notes.value.length,
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Add Note"),
              content: TextField(
                controller: _noteContent,
              ),
              actions: [
                RaisedButton(
                    child: Text("Add"),
                    onPressed: () {
                      _noteStore.save(
                        Note(
                          _noteContent.text,
                          false,
                        ),
                      );
                    })
              ],
            ));
      },
      tooltip: 'Add Task',
      child: Icon(Icons.add),
    );
  }
}
