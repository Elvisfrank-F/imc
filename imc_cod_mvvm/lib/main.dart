import 'package:flutter/material.dart';
import 'package:imc/repositories/pessoa_repository_impl.dart';
import 'package:imc/view_model/pessoa_view_model.dart';
import 'package:imc/views/home_page.dart';

import 'package:provider/provider.dart';

import 'commands/calcular_imc_command.dart';

void main() {

  //Cria a implementação concreta
  final repository = PessoaRepositoryImpl();

  //Injeto repository bo command
  final command = CalcularImcCommand(repository);

  //Injeta command na viewModel



  //inicia o app entregando tudo pronto
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PessoaViewModel(command)
        )
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   // final controller = ImcController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

