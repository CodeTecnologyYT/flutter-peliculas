import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
  

class PeliculasProvider{

  String _apikey     = '61ff36e74d8fcd663f82ccaec719afcf';
  String _url        = 'api.themoviedb.org';
  String _language   = 'es-Es';

  Future <List<Pelicula>> getEnCines ()async{
    final url  =Uri.https(_url, '3/movie/now_playing',{
      'api_key': _apikey,
      'language' : _language
    });
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async{
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key':_apikey,
      'language':_language
    });
    final resp= await http.get(url);
    final decodeData = json.decode(resp.body);
    
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);
    return peliculas.items;
  }

}