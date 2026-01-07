import 'package:flutter/material.dart';
import 'package:imc/view_model/pessoa_view_model.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{



 final TextEditingController _controllerWeight = new TextEditingController();
  final TextEditingController _controllerHeight = new TextEditingController();
  bool cond = false; //condição para verificar de é double

  final _keyForm = GlobalKey<FormState>();


  // função de limpar valores

  void ClearValues(BuildContext context){
    _controllerHeight.clear();
    _controllerWeight.clear();
    context.read<PessoaViewModel>().reset();
  }

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<PessoaViewModel>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Calculadora de IMC",
              style: TextStyle(color: Colors.white, fontSize: 25)),
          centerTitle: true,
          // leading: IconButton(
          //   icon: Icon(Icons.settings),
          //   onPressed: () {},
          // ),
          actions: [
            IconButton(icon: Icon(Icons.settings), onPressed: (){}),
            IconButton(onPressed: (){
              ClearValues(context);
            }, icon: Icon(Icons.refresh))
          ],
        ),

        body: Center(
          child: LayoutBuilder(

            builder:(BuildContext context, BoxConstraints constraints) {

              return SingleChildScrollView(
                child: Form(
                  key: _keyForm,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        SizedBox(
                            width: constraints.maxWidth < 400? constraints.maxWidth * 0.7 : 400,
                            // height: constraints.maxWidth < 400? constraints.maxWidth * 0.2 : 40,
                            child: Icon(Icons.account_box_outlined, size: 200, color: Colors.green)),
                        SizedBox(
                          width: constraints.maxWidth < 400? constraints.maxWidth * 0.8 : 400,

                          //  height: constraints.maxWidth < 400? constraints.maxWidth * 0.2 : 40,
                          child: TextFormField(
                              validator: (value){

                                if(value == null || value.isEmpty){
                                  return "Insira os valores";
                                }
                              },
                              controller: _controllerWeight,
                              style: TextStyle(fontSize: 25, color: Colors.green),
                              decoration: InputDecoration(fillColor: Colors.green,
                                labelText: "Peso(kg)",
                                labelStyle: TextStyle(fontSize: 20, color: Colors.green),
                              )
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth < 400? constraints.maxWidth * 0.8 : 400,

                          //  height: constraints.maxWidth < 400? constraints.maxWidth * 0.2 : 40,

                          child: TextFormField(
                              validator: (value){

                                if(value == null || value.isEmpty){
                                  return "Insira os valores";
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _controllerHeight,


                              style: TextStyle(fontSize: 25, color: Colors.green),
                              decoration: InputDecoration(fillColor: Colors.green,
                                labelText: "Altura(cm)",
                                labelStyle: TextStyle(fontSize: 20, color: Colors.green),
                              )
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: (){

                            if(_keyForm.currentState!.validate() ?? false){
                              viewModel.calcularImc(peso: _controllerWeight.text, altura: _controllerHeight.text);
                            }},
                          child: SizedBox(
                            width: constraints.maxWidth < 400? constraints.maxWidth * 0.9 : 400,
                            height: 20,
                            child: Center(
                              child: Text("Calcular",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.all(20),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              )

                          ),

                        ),

                        Text( (viewModel.resultado == 0 || viewModel.temErro)? viewModel.temErro? "INSIRA APENAS NÚMEROS": "Informe seus dados" :
                        "Seu IMC é ${viewModel.resultado.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 25, color: viewModel.temErro? Colors.red:Colors.green))
                      ]

                  ),
                ),
              );
            },
          ),
        )
    );
  }

}