import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Calculator'),
            onTap: () => Navigator.pushNamed(context, '/simplecalc'),
          ),
          ListTile(
            title: const Text('Temperature Conversion'),
            onTap: () => Navigator.pushNamed(context, '/tempconversion'),
          ),
        ],
      ),
    );
  }
}
