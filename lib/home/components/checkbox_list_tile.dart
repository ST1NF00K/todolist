import 'package:flutter/material.dart';

class CheckBoxListTile extends StatelessWidget {
  final Widget title;
  final bool isChecked;
  final Function(bool) onChanged;

  const CheckBoxListTile({Key key, this.title, this.isChecked, this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: Checkbox(value: isChecked, onChanged: onChanged),
    );
  }
}
