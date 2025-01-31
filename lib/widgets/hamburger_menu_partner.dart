import 'package:flutter/material.dart';

class HamburgerMenuWidgetPartner extends StatelessWidget {
  const HamburgerMenuWidgetPartner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != '/partner') {
                Navigator.pushNamed(context, '/partner');
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Planner'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != '/calendar') {
                Navigator.pushNamed(context, '/calendar');
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Messages'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != '/messages_partner') {
                Navigator.pushNamed(context, '/messages_partner');
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}