import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  const ItemCastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                "https://scontent-lim1-1.xx.fbcdn.net/v/t31.18172-8/22136866_701632713377113_2972623809009988879_o.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeF7Z81QY6knkuVq3O8xUwneF2DOZGH6kDoXYM5kYfqQOm2923pdmwD8aD1xJSihiOC3AEOjql-UAAGSpkBfimWa&_nc_ohc=epVUX9HVYbYAX8c3iZ_&_nc_ht=scontent-lim1-1.xx&oh=00_AfA21VIti-DO2ZKnE2Su2Ff_4Hh6YdOJJCiBS9yenEJeHw&oe=647F4507"),
          ),
          const SizedBox(height: 10,),
          Text(
            "Aikyan Kobayashi",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
