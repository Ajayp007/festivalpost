import 'package:festivalpost/screens/festival_factory/festival_factory.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> allImageList = [
    g1.shankranti,
    g1.holi,
    g1.raksha,
    g1.diwali
  ];

  @override
  void initState() {
    super.initState();
    g1.generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Festival",
          style: TextStyle(fontFamily: "myfonts", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'user');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: g1.festival.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              FestivalModel model = FestivalModel(g1.myfestival[index].name,
                  g1.myfestival[index].image, allImageList[index]);
              Navigator.pushNamed(context, 'view', arguments: model);
            },
            child: Container(
              height: 200,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("${g1.myfestival[index].image}"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${g1.myfestival[index].name}",
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "${g1.myfestival[index].date}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${g1.myfestival[index].disc}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
