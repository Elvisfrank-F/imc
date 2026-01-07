
class PessoaModel {
  double altura = 0.0;
  double massa = 0.0;
  double imc =0;

  double calcularIMC(){
    imc = massa / (altura * altura);
    return imc;
  }

}
