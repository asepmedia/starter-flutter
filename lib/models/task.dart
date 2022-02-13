class Task {
  int id;
  String title;
  bool isChecklist;

  Task({required this.id, required this.title, required this.isChecklist});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['sku'],
      isChecklist: false,
    );
  }
}
