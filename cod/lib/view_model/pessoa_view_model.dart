import 'package:flutter/material.dart';
import 'package:imc/commands/buscar_historico_command.dart';
import 'package:imc/commands/delete_imc_command.dart';
import 'package:imc/commands/buscar_gif_command.dart';
import 'package:imc/commands/imc_calculator.dart';
import 'package:imc/commands/salvar_imc_command.dart';
import 'package:imc/mappers/imc_parse.dart';
import 'package:imc/models/imc_history_model.dart';
import 'package:imc/models/pessoa_model.dart';

class PessoaViewModel extends ChangeNotifier {

final CalcularImcCommand commandCalcularImc;
final BuscarHistoricoCommand BuscarCommand;
final SalvarImcCommand salvarImc;
final GifImcCommand commandGifImc;
final DeleteImcCommand deleteImcCommand;

bool init = true; //variavel para saber que o programa iniciou e o usuario não fez nada (nem calculou imc nem clicou em alguma pessoa do histórico)

PessoaViewModel(this.commandCalcularImc, this.salvarImc, this.BuscarCommand, this.commandGifImc, this.deleteImcCommand);

//double resultado = 0;
PessoaModel pessoaModel = new PessoaModel();
String? error;
List<ImcHistoryModel> historico = [];

bool get isError => error != null;

void reset(){
  pessoaModel = new PessoaModel();
  error = null;
  notifyListeners();
}

Future<void> calcularImc({required String massa, required String altura}) async{

init = false;
  final result = commandCalcularImc.calcularImc(massa: massa, altura: altura);

  if(result.isSuccess){

    pessoaModel = result.data!;


   String? image = "";
   final resultGif = await commandGifImc.execute(pessoaModel.imc);

   if(resultGif.isSuccess){
      image = resultGif.data;
      pessoaModel.image = image ?? "";
   }

    
    error = null;

      await salvarImc.execute(
       pessoa: pessoaModel
      );

      await carregarHistorico();

  }
  if(result.isFailure){
    error = result.error;
    pessoaModel = new PessoaModel();
  }

  notifyListeners();

 }

 Future<void> carregarHistorico() async {
  historico = await BuscarCommand.execute();
  notifyListeners();
 }

 void trocarPessoa(ImcHistoryModel model){
  init = false;
   pessoaModel = ImcParse.parseToPessoa(model);
   notifyListeners();
 }

 Future<void> deletarId(int id) async {
  print( await deleteImcCommand.execute(id));
  historico = await BuscarCommand.execute();
  notifyListeners();
 }

  

}

