import '../repositories/gif_imc_repository.dart';
import '../core/result.dart';
import 'dart:math';

class GifImcCommand {

  final random = new Random();

  final GifImcRepository repository;

  GifImcCommand(this.repository);

  Future<Result<String>> execute(double imc) async {

  Map<String, dynamic> retorno = {};

  if(imc < 25 && imc >=0) {
    retorno = await repository.search(pesquisa: 'slim body');
  } else if(imc>= 25 && imc <= 30) {
   retorno =  await repository.search(pesquisa: 'fat');
  }else if(imc > 30) {
    retorno = await repository.search(pesquisa: 'obese');
  }


final List data = retorno['data'];

  int index = random.nextInt(data.length);

  String image = data[index]["images"]["fixed_height"]["url"];

  return Result.success(image);

  }

}