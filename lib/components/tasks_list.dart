import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/components/task_tile.dart';
import 'package:to_do_list_app/models/task_data.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        final tasks = taskData.tasks;
        return ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return TaskTile(
              title: tasks[index].name,
              isChecked: tasks[index].isDone,
              checkboxCallback: () {
                taskData.updateTask(tasks[index]);
              },
              onLongPressCallback: () {
                taskData.deleteTask(tasks[index]);
              },
            );
          },
          itemCount: tasks.length,
        );
      },
    );
  }
}
