class Node<T> {
  Node? previous;
  Node? next;
  T value;

  Node({this.previous, this.next, required this.value});
}