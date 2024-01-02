import 'package:donor_hub/screen/entering_screen/entering_page.dart';
import 'package:donor_hub/screen/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class DonorDrawer extends StatelessWidget {
  const DonorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(250),
        ),
        child: SizedBox(
          width: 250,
          child: Drawer(
            child: ListView(
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF973030),
                  ),
                  accountName: Text(
                    '',
                    style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Profile Page',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer // transaction resuşt should be in profile page
                    //  Navigator.push(context,   MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                  leading: const Icon(
                    Icons.person,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Past Actions ',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer // transaction resuşt should be in profile page
                    //  Navigator.push(context,   MaterialPageRoute(builder: (context) => const TransactionResult()));
                  },
                  leading: const Icon(
                    Icons.pending_actions,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'See Requests ',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer // transaction resuşt should be in profile page
                    //   Navigator.push(context,   MaterialPageRoute(builder: (context) => const ShowRequest()));
                  },
                  leading: const Icon(
                    Icons.bloodtype_outlined,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Testing',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TestStartingScreen()));
                  },
                  leading: const Icon(
                    Icons.check_circle_outline,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'SignOut',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EnteringPage()));
                  },
                  leading: const Icon(
                    Icons.logout,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Colors.black38,
                ),
                ListTile(
                  title: const Text(
                    'Close Menu',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.close,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
