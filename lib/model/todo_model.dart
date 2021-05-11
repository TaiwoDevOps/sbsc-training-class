class TodoModelClass {
  final String title;
  final String description;
  final DateTime dateTime;
  final bool doneState;

  TodoModelClass({
    this.title,
    this.description,
    this.dateTime,
    this.doneState = false,
  });
}
