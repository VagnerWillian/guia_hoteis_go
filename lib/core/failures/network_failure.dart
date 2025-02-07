import 'failure.dart';

class NetworkFailure extends Failure {
  final int? statusCode;
  final String? error;
  NetworkFailure({
    super.title = 'Não possível obter dados',
    super.message = 'Falha ao obter dados da internet. Verifique sua conexão ou'
        ' tente novamente mais tarde.',
    this.error,
    this.statusCode,
  }) {
    // TODO PODE SER CRIADO AQUI RELATORIOS DE ERRO
  }
}
