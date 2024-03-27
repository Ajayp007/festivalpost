import 'package:festivalpost/screens/festival_factory/festival_factory.dart';
import 'package:flutter/material.dart';
import '../../utils/global.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  Widget build(BuildContext context) {
    FestivalModel data =
        ModalRoute.of(context)!.settings.arguments as FestivalModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data.name}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose Anyone ...",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.7,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.imageList.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {

                  Navigator.pushNamed(context, 'edit',arguments: data);
                },
                  child: Container(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      data.imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
