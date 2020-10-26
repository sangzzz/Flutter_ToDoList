class Task {
  final String task;
  bool status;
  Task({
    this.task,
    this.status = false,
  });
  void toggleStatus() {
    status = !status;
  }
}
