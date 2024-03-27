import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/global.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool index = true;
  String path = "";

  TextEditingController txtname = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtaddr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "User Information",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: InkWell(onTap: () {
            Navigator.pop(context);
          },child: const Icon(Icons.arrow_back,color: Colors.white,)),
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
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          path.isEmpty
                              ? CircleAvatar(
                                  backgroundColor: Colors.pink.shade200,
                                  maxRadius: 70,
                                  child: const Text(
                                    "ADD",
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 30),
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.pink.shade200,
                                  backgroundImage: FileImage(
                                    File(path),
                                  ),
                                  maxRadius: 70,
                                ),
                          IconButton.filled(
                            onPressed: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                path = image!.path;
                                g1.profileImage = image.path;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        controller: txtname,
                        validator: (value) {
                          if (value!.isEmpty || value==null) {
                            return "Name is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            size: 40,
                            color: Colors.white,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        controller: txtemail,
                        validator: (value) {
                          if (value!.isEmpty || value==null) {
                            return "email is required";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "please enter email properly";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.call,
                            size: 40,
                            color: Colors.white,
                          ),
                          hintText: "Phone",
                          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        controller: txtphone,
                        validator: (value) {
                          if (value!.isEmpty || value==null) {
                            return "enter the your phone number";
                          } else if (value.length != 10) {
                            return "please enter the 10 digits";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLines: 3,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.location_on,
                            size: 40,
                            color: Colors.white,
                          ),
                          hintText: "Address",
                          helperMaxLines: 4,
                          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        controller: txtaddr,
                        validator: (value) {
                          if (value!.isEmpty || value==null) {
                            return "please enter the address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formkey.currentState!.validate()) {
                              g1.userName = txtname.text;
                              g1.userEmail = txtemail.text;
                              g1.userPhone = txtphone.text;
                              g1.userAdd = txtaddr.text;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Data Save"),
                                  backgroundColor: Colors.indigoAccent,
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
