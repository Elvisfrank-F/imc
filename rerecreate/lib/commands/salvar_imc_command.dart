
import 'package:imc/repositories/imc_history_repository.dart';
import 'package:imc/models/imc_history_model.dart';

class SalvarImcCommand{

final ImcHistoryRepository repository;

SalvarImcCommand(this.repository);

Future<void>execute({required double massa, required double altura, required double imc, }) async {

 final model = ImcHistoryModel(
  massa: massa,
  altura: altura,
  imc: imc,
  data: DateTime.now()
 );

 await repository.salvar(model);

}



}