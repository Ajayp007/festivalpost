import 'dart:io';
import 'dart:typed_data';

import 'package:festivalpost/screens/festival_factory/festival_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/global.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  List<Color> bgcolors = [Colors.white, Colors.black, ...Colors.primaries];
  GlobalKey globalKey = GlobalKey();
  String image = "";
  Color fontColor = Colors.black;
  Color bgColor = Colors.yellow;
  bool isFont = true;
  bool box = false;

  @override
  Widget build(BuildContext context) {
    FestivalModel data =
        ModalRoute.of(context)!.settings.arguments as FestivalModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data.name}",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () async {
              RenderRepaintBoundary boundry = globalKey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await boundry.toImage();
              ByteData? byteData =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List pngBytes = byteData!.buffer.asUint8List();

              Directory appDocument = await getApplicationDocumentsDirectory();
              File f1 = await File("${appDocument.path}/image.jpg")
                  .writeAsBytes(pngBytes);
              await ImageGallerySaver.saveFile(f1.path);

              Share.shareXFiles([XFile(f1.path)]);
            },
            child: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                RenderRepaintBoundary boundry = globalKey.currentContext!
                    .findRenderObject() as RenderRepaintBoundary;
                ui.Image image = await boundry.toImage();
                ByteData? byteData =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                Uint8List pngBytes = byteData!.buffer.asUint8List();

                await ImageGallerySaver.saveImage(pngBytes);
              },
              child: const Icon(
                Icons.save_alt_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/screen_main.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
            ),
            child: Container(),
          ),
          Column(
            children: [
              RepaintBoundary(
                key: globalKey,
                child: Container(
                  height: MediaQuery.sizeOf(context).width,
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.all(10),
                  color: bgColor,
                  child: Stack(
                    children: [
                      Visibility(
                        visible: box,
                        child: Image.asset(
                          image,
                          height: MediaQuery.sizeOf(context).width,
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundImage: FileImage(
                                  File("${g1.profileImage}"),
                                ),
                                maxRadius: 30,
                              ),
                            ),
                            Text(
                              "${data.disc}",
                              style: TextStyle(
                                color: fontColor,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                      backgroundColor: Colors.grey.shade200,
                      heroTag: "a1",
                      onPressed: () {
                        setState(() {
                          isFont = true;
                        });
                      },
                      label: const Text("Text")),
                  FloatingActionButton.extended(
                      backgroundColor: Colors.grey.shade200,
                      heroTag: "a2",
                      onPressed: () {
                        setState(() {
                          isFont = false;
                        });
                      },
                      label: const Text("Images")),
                ],
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: isFont,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bgcolors.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    fontColor = bgcolors[index];
                                  },
                                );
                              },
                              child: Container(
                                width: 50,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                ),
                                decoration: BoxDecoration(
                                    color: bgcolors[index],
                                    shape: BoxShape.circle),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !isFont,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Change Background Color ",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: bgcolors.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      box = false;
                                      bgColor = bgcolors[index];
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    margin: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: bgcolors[index],
                                      border: Border.all(width: 1),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.imageList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      box = true;
                                      image = data.imageList[index];
                                    });
                                  },
                                  child: Container(
                                    width: 80,
                                    margin: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: Image.asset(
                                      data.imageList[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
