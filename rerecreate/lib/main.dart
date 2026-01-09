import 'package:flutter/material.dart';
import 'package:imc/commands/buscar_historico_command.dart';
import 'package:imc/commands/imc_calculator.dart';
import 'package:imc/commands/salvar_imc_command.dart';
import 'package:imc/repositories/imc_history_repository_impl.dart';
import 'package:imc/repositories/pessoa_repository_impl.dart';
import 'package:imc/view_model/pessoa_view_model.dart';
import 'package:imc/views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'core/database.dart';
import 'dart:io';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isWindows || Platform.isLinux || Platform.isMacOS){

    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

  }

final repository = PessoaRepositoryImpl();

final commandCalcularImc = CalcularImcCommand(repository);

final database = await AppDatabase.open();

final repositoryImcHistory = ImcHistoryRepositoryImpl(database);

final commandBuscarHistory = BuscarHistoricoCommand(repositoryImcHistory);
final commandSalvarHistory = SalvarImcCommand(repositoryImcHistory);

final pessoa = PessoaViewModel(
  commandCalcularImc,
  commandSalvarHistory,
  commandBuscarHistory
);

pessoa.carregarHistorico();

  runApp(
   MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => pessoa
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

