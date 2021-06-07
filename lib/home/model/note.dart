import 'package:floor/floor.dart';

@entity
class Note {

  @primaryKey
  final int id;
  
  final String title;

  bool isChecked;

  Note(this.id, this.title, this.isChecked);
  

  @override
  bool operator == (Object other) => other is Note && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
