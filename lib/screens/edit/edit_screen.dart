import 'package:festivalpost/screens/festival_factory/festival_factory.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    FestivalModel data = ModalRoute.of(context)!.settings.arguments as FestivalModel;
    return Scaffold(

    );
  }
}
