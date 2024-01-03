import 'package:donor_hub/controllers/question_controller.dart';
import 'package:donor_hub/screen/Drawer_screen/donor_drawer.dart';
import 'package:donor_hub/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      drawer: const DonorDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black38,
      ),
    );
  }
}
