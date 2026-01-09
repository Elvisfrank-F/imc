import 'package:flutter/material.dart';
import 'package:imc/commands/buscar_historico_command.dart';
import 'package:imc/commands/imc_calculator.dart';
import 'package:imc/commands/salvar_imc_command.dart';
import 'package:imc/models/imc_history_model.dart';
import 'package:imc/models/pessoa_model.dart';

class PessoaViewModel extends ChangeNotifier {

final CalcularImcCommand commandCalcularImc;
final BuscarHistoricoCommand BuscarCommand;
final SalvarImcCommand salvarImc;

PessoaViewModel(this.commandCalcularImc, this.salvarImc, this.BuscarCommand);

double resultado = 0;
String? error;
List<ImcHistoryModel> historico = [];

bool get isError => error != null;

Future<void> calcularImc({required String massa, required String altura}) async{

  final result = commandCalcularImc.calcularImc(massa: massa, altura: altura);

  if(result.isSuccess){
    resultado = result.data!;
    error = null;

      await salvarImc.execute(
        massa: double.parse(massa),
        altura: double.parse(altura),
        imc: resultado!
      );

      await carregarHistorico();

  }
  if(result.isFailure){
    error = result.error;
    resultado = 0;
  }

  notifyListeners();

 }

 Future<void> carregarHistorico() async {
  historico = await BuscarCommand.execute();
  notifyListeners();
 }

  

}

