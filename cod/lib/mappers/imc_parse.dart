import 'package:imc/models/pessoa_model.dart';
import 'package:imc/models/imc_history_model.dart';

class ImcParse {

 static PessoaModel parseToPessoa(ImcHistoryModel model){

  return PessoaModel() 
  ..massa = model.massa
  ..altura = model.altura
  ..image = model.image
  ..imc = model.imc;
 }


//  static PessoaModel parseToHistory(PessoaModel model){

//   return PessoaModel() 
//   ..massa = model.massa
//   ..altura = model.altura
//   ..image = model.image
//   ..imc = model.imc;
//  }

}