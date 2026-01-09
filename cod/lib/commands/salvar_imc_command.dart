
import 'package:imc/repositories/imc_history_repository.dart';
import 'package:imc/models/imc_history_model.dart';
import 'package:imc/models/pessoa_model.dart';

class SalvarImcCommand{

final ImcHistoryRepository repository;

SalvarImcCommand(this.repository);

Future<void>execute({required PessoaModel pessoa}) async {

 final model = ImcHistoryModel(
  massa: pessoa.massa,
  altura: pessoa.altura,
  imc: pessoa.imc,
  data: DateTime.now(),
  image: pessoa.image
 );

 await repository.salvar(model);

}



}