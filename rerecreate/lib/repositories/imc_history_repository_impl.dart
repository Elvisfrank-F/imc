
import 'package:imc/repositories/imc_history_repository.dart';
import 'package:imc/models/imc_history_model.dart';
import 'package:sqflite/sqflite.dart';

class ImcHistoryRepositoryImpl implements ImcHistoryRepository{

final Database db;

ImcHistoryRepositoryImpl(this.db);

   @override
   Future<void> salvar(ImcHistoryModel model) async{

     await db.insert('imc_history', model.toMap());

   }

   @override
   Future<List<ImcHistoryModel>> buscarTodos() async{

   final result = await db.query('imc_history');

   return result.map((e) => ImcHistoryModel.fromMap(e)).toList();

   }

}