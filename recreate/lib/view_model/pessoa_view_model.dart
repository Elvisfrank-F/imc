import 'package:flutter/material.dart';
import 'package:imc/models/pessoa_model.dart';
import '../commands/calcularImcCommand.dart';
import '../core/Result.dart';

class PessoaViewModel extends ChangeNotifier {

  final CalcularImcCommand _command;

  double resultado = 0;
  String? error;

  PessoaViewModel(this._command);

  void reset(){
    resultado = 0;
    error = null;
    notifyListeners();
  }
  

  bool get isError => error != null;


  void calculateIMC({required String massa, required String altura}) {

    final result = _command.execute(altura: altura, massa: massa);

    if(result.isSuccess){
      resultado = result.data!;
      error = null;
    }

    if(result.isFailure){
      resultado = 0;
      error = result.error;
    }

    notifyListeners();
  }

}

