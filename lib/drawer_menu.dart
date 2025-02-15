import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/ecoute.jpeg',
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 10),
                Text(
                  'RADIO ECOUTE FM',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.facebook, color: Colors.blue),
            title: Text('FACEBOOK'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.video_library, color: Colors.red),
            title: Text('YOUTUBE'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.web, color: Colors.green),
            title: Text('Website'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.orange),
            title: Text('radioecoutefm201826@gmail.com'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.purple),
            title: Text('+1 514-217-3553'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.brown),
            title: Text('4058, rue Monselet bureau 106 Montréal QC, Montréal-Nord, QC, Canada, Quebec'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
