class Todo {
  final String id;
  final String todoTask;
  final bool isDone;

  Todo({
    required this.id,
    required this.todoTask,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoTask: 'Morning Excercise', isDone: true ),
      Todo(id: '02', todoTask: 'Buy Groceries', isDone: true ),
      Todo(id: '03', todoTask: 'Check Emails', ),
      Todo(id: '04', todoTask: 'Team Meeting', ),
      Todo(id: '05', todoTask: 'Dinner with Jenny', ),
      Todo(id: '06', todoTask: 'Work on mobile apps for 2 hour', ),
    ];
  }
}
