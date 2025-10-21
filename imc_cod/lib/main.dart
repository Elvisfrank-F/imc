import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controllerWeight = new TextEditingController();
  TextEditingController _controllerHeight = new TextEditingController();
  double IMC = 0;
  String imc = "";
  bool cond = false; //condição para verificar de é double

  final _keyForm = GlobalKey<FormState>();

  //função para calcular o IMC

  double calculateIMC({required double weight, required double height}) {
    return weight / (height * height);
  }

  // função de limpar valores

  void ClearValues(){
    setState(() {
      _controllerHeight.text = "";
      _controllerWeight.text = "";
      IMC= 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
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

                          try{
                        
                        double weight = double.parse(_controllerWeight.text);
                        double height = double.parse(_controllerHeight.text) / 100;

                        setState(() {
                          IMC = calculateIMC(height: height, weight: weight);
                          cond =false;
                        });

                          }
                          catch(e){
                            setState(() {
                               cond = true;
                            });
                            
                          }
                        
              
                        
                        
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
                        
                      Text(IMC== 0? cond? "INSIRA APENAS NÚMEROS": "Informe seus dados" : 
                      "Seu IMC é ${IMC.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 25, color: cond? Colors.red:Colors.green))
                    
              
              
              
              
                    
              
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