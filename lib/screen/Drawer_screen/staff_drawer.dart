import 'package:donor_hub/screen/entering_screen/entering_page.dart';
import 'package:flutter/material.dart';

class StaffDrawer extends StatelessWidget {
  const StaffDrawer({super.key});

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
                  //Color(0xff4367b1)
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
                    'Blood Requests',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.list_alt_outlined,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Contact Donors',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.phone,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Transaction',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {

                  },
                  leading: const Icon(
                    Icons.account_circle_sharp,
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
                    Navigator.push(context,   MaterialPageRoute(builder: (context) => const EnteringPage()));
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
