import 'failure.dart';

class ApiFailure extends Failure{
  ApiFailure(List<String> messages) : super(title: '', message: '') {
    super.title = 'Houve um problema na solicitação';
    super.message = messages.map((e)=>'• $e').join('\n');
  }

}