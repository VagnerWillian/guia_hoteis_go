class Failure implements Exception{
  late String title;
  late String message;

  Failure({required this.title, required this.message});
}