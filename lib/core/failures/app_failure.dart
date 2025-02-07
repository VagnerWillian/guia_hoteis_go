import 'failure.dart';

class AppFailure extends Failure {
  final Object? exception;
  final StackTrace? stack;

  AppFailure({
    this.exception,
    this.stack,
    super.title = 'Tivemos um problema',
    super.message = 'Estamos trabalhando para resolver. Tente novamente mais tarde!',
  }){
    // TODO PODE SER CRIADO AQUI RELATORIOS DE ERRO
  }
}
