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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: .4,

                // colorFilter: new ColorFilter.mode(Colors.red.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/icons/bg.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: kSecondaryColor),
              ),
              if (_qnController.numOfCorrectAns !=
                  _qnController.questions.length)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "You don't seem completely suitable for donating blood, you can talk to a doctor about this.",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: kSecondaryColor),
                    ),
                  ),
                ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
