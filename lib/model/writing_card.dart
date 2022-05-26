class WritingCard {
  String taskDescription;
  List<WritingTask> tasks;

  WritingCard({
    required this.taskDescription,
    required this.tasks,
  });
}

class WritingTask {
  String question;
  String answer;
  WritingTask({required this.question, required this.answer});
}
