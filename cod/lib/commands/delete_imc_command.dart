import '../core/result.dart';
import '../repositories/imc_history_repository.dart';

class DeleteImcCommand {

  ImcHistoryRepository repository;

  DeleteImcCommand(this.repository);

  Future<Result<int>> execute(int id) async {

    final  result = await repository.delete(id);

   if(result <= 0){
     return Result.failure("ID não existe");
   }
   else {
     return Result.success(result);
   }


  }

}