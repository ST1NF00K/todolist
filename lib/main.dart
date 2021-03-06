import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/home/home_page.dart';
import 'package:todolist/home/store/note_store.dart';
import 'package:todolist/shared/database/database_factory.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseProvider = DatabaseProvider();
  await databaseProvider.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NoteStore>(
          create: (_) => NoteStoreFactory.create(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
