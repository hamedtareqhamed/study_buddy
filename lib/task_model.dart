class Task {
  final int? id;
  final String title;
  final String date;
  final int isCompleted; // 0 for false, 1 for true

  // Constructor with named parameters
  Task({this.id, required this.title, required this.date, this.isCompleted = 0});

  // Map binding for Database (Subprograms - Lecture 9)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'isCompleted': isCompleted,
    };
  }

  // Factory constructor to create a Task from a Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      isCompleted: map['isCompleted'],
    );
  }
}
