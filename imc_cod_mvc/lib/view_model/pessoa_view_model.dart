import 'package:flutter/material.dart';
import 'package:imc/models/pessoa_model.dart';

class PessoaViewModel extends ChangeNotifier {

  double calculateIMC({required String peso, required String altura}) {

    try{
      double weight = double.parse(peso);
      double height = double.parse(altura);
      return weight / (height * height);
    }
    catch(e){
      print(e);
      return -1;
    }



  }

}

