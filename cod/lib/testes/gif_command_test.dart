// import 'dart:io';
// import 'package:imc/commands/buscar_gif_command.dart';
// import 'package:imc/repositories/gif_imc_repository_impl.dart';
//
// void main() async {
//
//  print("Insira a pesquisa: ");
//
//  String? pesquisa = stdin.readLineSync();
//
//  if(pesquisa == null) return;
//
//  final repository =  GifImcRepositoryImpl();
//  final command = GifImcCommand(repository);
//
//  final result = await command.execute('fat');
//
//
//  if(result.isSuccess){
//   print(result.data);
//  }
//
//
//
//
// }