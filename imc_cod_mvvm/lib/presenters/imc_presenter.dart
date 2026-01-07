import '../models/pessoa_model.dart';

abstract class ImcView{
  void update();
}

class ImcPresenter {

  final ImcView view;

  var resultado = 0.0;

  final PessoaModel pessoa = PessoaModel();

  ImcPresenter(this.view);

  void calcularImc() {
    resultado = pessoa.massa / (pessoa.altura * pessoa.altura);
    view.update();
  }


}