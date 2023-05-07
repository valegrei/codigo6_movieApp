import 'dart:convert';

import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/pages/detail_page.dart';
import 'package:codigo6_movieapp/services/api_service.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:codigo6_movieapp/widgets/item_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> moviesModel = [];

  getDataInternet() async {
    ApiService apiService = ApiService();
    moviesModel = await apiService.getMovies();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "TotalCinema",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(12.0),
                itemCount: moviesModel.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ItemHomeWidget(
                    model: moviesModel[index],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                idMovie: moviesModel[index].id,
                              )));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
