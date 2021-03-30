import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todolist/home/components/checkbox_list_tile.dart';
import 'package:todolist/home/model/note.dart';
import 'package:todolist/home/store/note_store.dart';

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
    if (_noteStore == null) {
      _noteStore = _noteStore = NoteStoreFactory.create();
      _disposer =
          reaction((_) => _noteStore.saveFuture.status, (FutureStatus status) {
        if (status == FutureStatus.fulfilled) {
          _noteContent.clear();
          Navigator.of(context).pop();
        }
      });
    }
  }

  @override
  void dispose() {
    _noteContent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
      ),
      body: Observer(builder: (_) {
        var value = _noteStore.findAllFuture;
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
            return ListView.separated(
                itemBuilder: (context, index) {
                  var item = _noteStore.notes[index];
                  return Observer(builder: (_) {
                    return CheckBoxListTile(
                      onChanged: (b) {
                        if (b) {
                          _noteStore.check(item);
                        } else {
                          _noteStore.uncheck(item);
                        }
                      },
                      isChecked: _noteStore.isChecked(item),
                      title: Text(item.title),
                    );
                  });
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.0),
                itemCount: _noteStore.notes.length);
          });
        }
      }),
      floatingActionButton: FloatingActionButton(
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
                        _noteStore.save(Note(_noteContent.text, false));
                      })
                ],
              ));
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}

