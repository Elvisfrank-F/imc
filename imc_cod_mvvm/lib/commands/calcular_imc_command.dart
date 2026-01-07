import '../core/result.dart';
import '../repositories/pessoa_repository.dart';

class CalcularImcCommand{

  final PessoaRepository repository;

  CalcularImcCommand(this.repository);

  Result<double> execute({required String peso, required String altura}){

    final pesoParse = double.tryParse(peso);
    final alturaParse = double.tryParse(altura);

    if(pesoParse == null || alturaParse == null){
      return Result.failure('Insira apenas números');
    }

    if(pesoParse <= 0 || alturaParse <= 0){
      return Result.failure('Valores inválidos');
    }

    final pessoa = repository.criarPessoa(
      peso: pesoParse,
      alturaCm: alturaParse,
    );

    final imc = pessoa.massa / (pessoa.altura * pessoa.altura);

    return Result.success(imc);

  }

}

