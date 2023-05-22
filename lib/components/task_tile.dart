import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.title,
    required this.isChecked,
    required this.checkboxCallback,
    required this.onLongPressCallback,
    super.key,
  });

  final String title;
  final bool isChecked;
  final Function checkboxCallback;
  final VoidCallback onLongPressCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressCallback,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (bool? newValue) {
            checkboxCallback();
          },
        ),
      ),
    );
  }
}
