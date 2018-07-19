class Todo {

  String title;
  String description = 'Lorem ipsum dolor sit amet kondektur '
      'aduousdaw dwadwad dawdwadd';

  Todo(this.title);

  @override
  String toString() {
    return 'Todo{title: $title, description: $description}';
  }
}

final List<Todo> todos = [
  Todo('Dominance the world'),
  Todo('Liat bokep'),
  Todo('ehmmmmm....')
];