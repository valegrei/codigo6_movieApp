import 'package:codigo6_movieapp/models/movie_det_model.dart';
import 'package:codigo6_movieapp/services/api_service.dart';
import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:codigo6_movieapp/utils/constants.dart';
import 'package:codigo6_movieapp/widgets/item_cast_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  int idMovie;
  DetailPage({required this.idMovie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MovieDetModel? movie;

  getData() async{
    ApiService apiService = ApiService();
    movie = await apiService.getMovieDetails(widget.idMovie);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: movie == null ? Center(
        child: CircularProgressIndicator(
          color: kBrandSecondaryColor,
        ),
      ) : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.33,
              width: double.infinity,
              decoration:  BoxDecoration(
                color: Colors.white10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "$apiImageUrl${movie!.backdropPath}",
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: AlignmentDirectional.bottomCenter,
                            end: Alignment.center,
                            colors: [
                          kBrandPrimaryColor,
                          Colors.transparent,
                          Colors.transparent,
                        ])),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                        size: 16,
                      ),
                      Expanded(
                        child: Text(
                          "${movie!.voteAverage} | ${movie!.voteCount}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.messenger_outline,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movie!.originalTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${movie!.runtime} min",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "${movie!.releaseDate.year}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: -4,
                    children: movie!.genres.map((e) => Chip(label: Text(e.name))).toList(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    movie!.overview!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Uri uri = Uri.parse("${movie!.homepage}");
                      launchUrl(uri,
                      mode: LaunchMode.externalApplication);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff5840ee),
                            Color(0xff973fef),
                          ],
                        ),
                      ),
                      child: const Text(
                        "Homepage",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Top Cast",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        ItemCastWidget(),
                        ItemCastWidget(),
                        ItemCastWidget(),
                        ItemCastWidget(),
                        ItemCastWidget(),
                        ItemCastWidget(),
                        ItemCastWidget(),
                        ItemCastWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Images",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: GridView.builder(
                      // padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.35,
                      ),
                      itemCount: 7,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          "https://blog.alltheanime.com/wp-content/uploads/2020/07/v7ha9Qwc5pCAvS5mMVjOPHCQVR5.jpg",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Reviews",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ExpansionTile(
                    iconColor: kBrandSecondaryColor,
                    collapsedIconColor: Colors.white,
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 6.0,
                    ),
                    title: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white10,
                          child: Text(
                            "10.0",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Victor Alegre",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "2022-11-14",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
