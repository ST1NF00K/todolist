import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:todolist/home/dao/floor_note_dao.dart';
import 'package:todolist/home/model/note.dart';

part 'app_database.g.dart'; 
 @Database(version: 1, entities: [Note])
 abstract class AppDatabase extends FloorDatabase {
   FloorNoteDao get noteDao;
 }