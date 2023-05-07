import 'package:codigo6_movieapp/models/movie_det_model.dart';
import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<MovieModel>> getMovies() async{
    Uri url = Uri.parse(
        "$apiUrl/discover/movie?api_key=$apiKey&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate&language=en-US");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List movies = data["results"];
    List<MovieModel> moviesModel = [];
    moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    return moviesModel;
  }

  Future<MovieDetModel> getMovieDetails(int idMovie) async{
    Uri url = Uri.parse(
        "$apiUrl/movie/$idMovie?api_key=$apiKey&language=en-US");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    MovieDetModel movieDetModel = MovieDetModel.fromJson(data);
    return movieDetModel;
  }
}