import '../repositories/gif_imc_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class GifImcRepositoryImpl implements GifImcRepository {


  @override
  Future<Map<String, dynamic>> search({required String pesquisa}) async{

    http.Response response =
    await http.get(
        Uri.parse
          ('https://api.giphy.com/v1/gifs/search?api_key=fE32klrG2b2FNVw9pWJdUSgupPtP4AdE&q=$pesquisa&limit=100&offset=100&rating=g&lang=en&bundle=messaging_non_clips')
    );

    Map<String, dynamic> dados = json.decode(response.body);

    return dados;


  }


}

