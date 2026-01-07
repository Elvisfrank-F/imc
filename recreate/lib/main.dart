import 'package:flutter/material.dart';
import 'package:imc/commands/calcularImcCommand.dart';
import 'package:imc/repositories/pessoa_repository_impl.dart';
import 'package:imc/view_model/pessoa_view_model.dart';
import 'package:imc/views/home_page.dart';
import 'package:provider/provider.dart';


void main() {

  final repository = PessoaRepositoryImpl();
  final command = CalcularImcCommand(repository);

  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return PessoaViewModel(command);
          },
        )
      ],
      child: MyApp(),

    )
    );

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

