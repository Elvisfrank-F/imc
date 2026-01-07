import 'package:flutter/material.dart';
import 'package:imc/models/pessoa_model.dart';
import '../commands/calcular_imc_command.dart';

class PessoaViewModel extends ChangeNotifier {

  final CalcularImcCommand command;

  PessoaViewModel(this.command);

 double resultado = 0.0;
 String? erro;

 void reset() {

   resultado = 0;
   erro = null;
   notifyListeners();
 }

 bool get temErro => erro != null;

 void calcularImc({required String peso, required String altura}){

   final result = command.execute(peso: peso, altura: altura);

   if(result.isSuccess){
     resultado = result.data!;
     erro = null;
   } else if(result.isFailure){
     resultado = 0;
     erro = result.error;
   }


    notifyListeners();
 }







}

