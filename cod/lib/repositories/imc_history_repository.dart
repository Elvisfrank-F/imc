import 'package:imc/models/imc_history_model.dart';

abstract class ImcHistoryRepository {
  Future<void> salvar( ImcHistoryModel model);
  Future<List<ImcHistoryModel>> buscarTodos();
  Future<int> delete(int id);
}