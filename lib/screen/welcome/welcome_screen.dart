import 'package:donor_hub/screen/Drawer_screen/donor_drawer.dart';
import 'package:donor_hub/utils/constants.dart';
import 'package:flutter/material.dart';

class TestStartingScreen extends StatelessWidget {
  const TestStartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DonorDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black38,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.5,
                image: const AssetImage('assets/icons/bg.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2), //2/6
                  Text(
                    "Blood Donation Eligibility Test",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "A small preliminary test on whether it is suitable for donating blood for you, of course, other necessary procedures will be completed in the hospital. This is a test to speed up the process and keep you informed."),
                  const Spacer(), // 1/6
                  InkWell(
                    //    onTap: () => Get.to(() => QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Start ",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
