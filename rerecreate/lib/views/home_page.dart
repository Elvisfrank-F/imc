import 'package:flutter/material.dart';
import 'package:imc/view_model/pessoa_view_model.dart';
import 'package:provider/provider.dart';
import '../models/pessoa_model.dart';



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

  void ClearValues(){
    setState(() {
      _controllerHeight.text = "";
      _controllerWeight.text = "";

    });
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
            IconButton(onPressed: ClearValues, icon: Icon(Icons.refresh))
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

                //      SizedBox(width:300,),
                      Expanded(
                        flex:3,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                        
                            children: [

                              //icone 

                              SizedBox(
                                  width: constraints.maxWidth < 400? constraints.maxWidth * 0.7 : 400,
                                  child: Icon(Icons.account_box_outlined, size: 200, color: Colors.green)),


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
                        
                              Text(viewmodel.resultado== 0? viewmodel.isError? "INSIRA APENAS NÚMEROS": "Informe seus dados" :
                              "Seu IMC é ${viewmodel.resultado.toStringAsFixed(2)}",
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
                                                               
                                                                   return ListTile(
                                                                     title: Text('IMC : ${item.imc.toStringAsFixed(2)}'),
                                                                     subtitle: Text('${item.data.day} / ${item.data.month} / ${item.data.year}')
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