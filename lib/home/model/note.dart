import 'package:floor/floor.dart';

@entity
class Note {

  @PrimaryKey(autoGenerate: true)
  int id;
  
  String title;

  bool isChecked;

  Note(this.title, this.isChecked);
  

  @override
  bool operator == (Object other) => other is Note && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
