import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imc/view_model/pessoa_view_model.dart';
import 'package:imc/views/widgets/card_hystory.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controllerWeight = new TextEditingController();
  TextEditingController _controllerHeight = new TextEditingController();

  final _keyForm = GlobalKey<FormState>();


  // função de limpar valores

  void ClearValues(BuildContext context){
    _controllerHeight.clear();
    _controllerWeight.clear();
    context.read<PessoaViewModel>().reset();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final viewmodel = context.watch<PessoaViewModel>();


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
            IconButton(onPressed: () => ClearValues(context), icon: Icon(Icons.refresh))
          ],
        ),

        body: Center(
          child: LayoutBuilder(

            builder:(BuildContext context, BoxConstraints constraints) {

              return SingleChildScrollView(
                child: Form(
                  key: _keyForm,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                    children: [

                      Expanded(
                        flex:3,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                        
                            children: [

                              //icone 

                              SizedBox(
                                  width: constraints.maxWidth < 400? constraints.maxWidth * 0.7 : 400,
                                  child: viewmodel.init?

                                   Icon(Icons.account_box_outlined, size: 200, color: Colors.green)
                                  
                                  : 
                                  
                                  CachedNetworkImage(imageUrl: viewmodel.pessoaModel.image,
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  ))
                                  ,


                                  //textfileds
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
                        
                                           
                            viewmodel.calcularImc(massa: _controllerWeight.text, 
                            altura: _controllerHeight.text);
                        
                        
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
                        
                              Text(viewmodel.pessoaModel.imc== 0? viewmodel.isError? "INSIRA APENAS NÚMEROS": "Informe seus dados" :
                              "Seu IMC é ${viewmodel.pessoaModel.imc.toStringAsFixed(2)}",
                                  style: TextStyle(fontSize: 25, color: viewmodel.isError? Colors.red:Colors.green))
                        
                        ,
                        
                         SizedBox(height: 20,),
                        
                                     
                        
                        
                        
                            ]
                        
                        ),
                      ),

                     // SizedBox(width: 200),

                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                       Text("HISTÓRICO", style: TextStyle(fontWeight: FontWeight.bold)),
                                      Container(
                                                              width: 300,
                                                              height: 300,
                                                               child: ListView.builder(
                                                                 shrinkWrap: true,
                                                                 itemCount: viewmodel.historico.length,
                                                                 itemBuilder: (_, index) {
                                                                   
                                                                   final item = viewmodel.historico[index];
                                                               
                                                                   return GestureDetector(
                                                                     child: CardHystory(model: item, onDelete: () async {
                                                                       if(item.id != null) await viewmodel.deletarId(item.id!);
                                                                     },),
                                                                     onTap: (){
                                                                      viewmodel.trocarPessoa(item);
                                                                      _controllerHeight.text = (viewmodel.pessoaModel.altura * 100).toString();
                                                                      _controllerWeight.text = viewmodel.pessoaModel.massa.toString();
                                                                      print(viewmodel.pessoaModel.image);
                                                                     },
                                                                   );
                                                                 },
                                                               ),
                                                             ),
                                    ],
                                  ),
                                )
                      

                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}