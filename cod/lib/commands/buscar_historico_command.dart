
import 'package:imc/repositories/imc_history_repository.dart';
import 'package:imc/models/imc_history_model.dart';

class BuscarHistoricoCommand {

  final ImcHistoryRepository repository;

  BuscarHistoricoCommand(this.repository);

  Future<List<ImcHistoryModel>> execute() {
    return repository.buscarTodos();
  }

}