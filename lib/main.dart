import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // For Timer control
import 'package:intl/intl.dart'; // For Date formatting
import 'database_helper.dart';
import 'task_model.dart';

void main() {

  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory to FFI
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MaterialApp(home: StudyBuddyApp()));
}

class StudyBuddyApp extends StatefulWidget {
  const StudyBuddyApp({super.key});

  @override
  State<StudyBuddyApp> createState() => _StudyBuddyAppState();
}

class _StudyBuddyAppState extends State<StudyBuddyApp> {
  // Lecture 06: Variable Scopes
  List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // Timer Control Variables
  Timer? _timer;
  int _start = 60; // 60 seconds study timer
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _refreshTaskList();
  }

  // Subprogram (Lecture 9): Refresh list from DB
  void _refreshTaskList() async {
    final data = await DatabaseHelper.instance.getTasks();
    setState(() {
      _tasks = data;
    });
  }

  // Subprogram (Lecture 9): Add Task with Error Handling & Regex
  void _addTask() async {
    // Requirement: Regular Expression (Validates no special chars)
    // Lecture 8: Control Structures (if/else)
    RegExp validName = RegExp(r'^[a-zA-Z0-9 ]+$');

    if (_taskController.text.isEmpty) {
      _showError("Task name cannot be empty!");
      return;
    } else if (!validName.hasMatch(_taskController.text)) {
      _showError("No special characters allowed (Regex check)!");
      return;
    }

    // Requirement: Error Handling
    try {
      await DatabaseHelper.instance.addTask(Task(
        title: _taskController.text,
        date: DateFormat('yyyy-MM-dd').format(_selectedDate),
      ));
      _taskController.clear();
      _refreshTaskList();
    } catch (e) {
      _showError("Database Error: $e");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  // Requirement: Timer Control
  void _startTimer() {
    if (_timer != null) _timer!.cancel();
    setState(() {
      _start = 60;
      _isTimerRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start < 1) {
          _timer!.cancel();
          _isTimerRunning = false;
          _showError("Study session complete!");
        } else {
          _start--;
        }
      });
    });
  }

  // Lecture 7: Expressions (Calculating progress percentage)
  double _calculateProgress() {
    if (_tasks.isEmpty) return 0.0;
    int completed = _tasks.where((t) => t.isCompleted == 1).length;
    return completed / _tasks.length;
  }

  // Requirement: Calendar (Date Picker)
  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StudyBuddy Planner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Requirement: Progress Bar
            const Text("Study Progress:"),
            LinearProgressIndicator(
              value: _calculateProgress(),
              minHeight: 10,
              color: Colors.green,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 20),

            // Requirement: Timer Control UI
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Timer: $_start s", style: const TextStyle(fontSize: 20)),
                ElevatedButton(
                  onPressed: _isTimerRunning ? null : _startTimer,
                  child: const Text("Start Study Timer"),
                ),
              ],
            ),
            const Divider(),

            // Input Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(hintText: "Enter Task Name"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _pickDate, // Requirement: Calendar trigger
                ),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Requirement: Data Table / List
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Card(
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text("Due: ${task.date}"),
                      trailing: Checkbox(
                        value: task.isCompleted == 1,
                        onChanged: (bool? value) async {
                          await DatabaseHelper.instance.updateTask(Task(
                            id: task.id,
                            title: task.title,
                            date: task.date,
                            isCompleted: value! ? 1 : 0,
                          ));
                          _refreshTaskList();
                        },
                      ),
                      onLongPress: () async {
                        await DatabaseHelper.instance.deleteTask(task.id!);
                        _refreshTaskList();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
