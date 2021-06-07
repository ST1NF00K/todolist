import 'package:floor/floor.dart';

@entity
class Note {

  @primaryKey
  @PrimaryKey(autoGenerate: true)//TODO : fix this
  int id;
  
  final String title;

  bool isChecked;

  Note(this.title, this.isChecked);
  

  @override
  bool operator == (Object other) => other is Note && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
