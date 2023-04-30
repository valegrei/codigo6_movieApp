import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  getData() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=668dfd6ba68b6a7595f5d83a2a683550&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate");
    http.Response response = await http.get(url);
    print(response);
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("GET DATA"),
          onPressed: () {},
        ),
      ),
    );
  }
}
