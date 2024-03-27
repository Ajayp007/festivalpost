import 'dart:io';

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
          title: const Text(
            "User Information",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
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
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black45,
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.black12, fontSize: 20),
                    ),
                    controller: txtname,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        size: 40,
                        color: Colors.black45,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black12, fontSize: 20),
                    ),
                    controller: txtemail,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.call,
                        size: 40,
                        color: Colors.black45,
                      ),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.black12, fontSize: 20),
                    ),
                    controller: txtphone,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.black45,
                      ),
                      hintText: "Address",
                      helperMaxLines: 4,
                      hintStyle: TextStyle(color: Colors.black12, fontSize: 20),
                    ),
                    controller: txtaddr,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                          g1.contactName = txtname.text;
                          g1.contactEmail = txtemail.text;
                          g1.contactPhone = txtphone.text;
                          g1.contactAdd = txtaddr.text;
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
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
      ),
    );
  }
}
