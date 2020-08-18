import 'package:flutter/material.dart';
import 'package:gojek/providers/drawer_provider.dart';
import 'package:gojek/widgets/menu_label.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  final TextStyle menuStyle =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('John Doe',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              'john.doe@gmail.com',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1567664910455-331af21955d5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    MenuLabel(
                      label: 'Home',
                      icon: Icons.home,
                    ),
                    GestureDetector(
                      onTap: () {
                        //check if open then close drawer
                        if (value.isDrawerOpen) {
                          value.toggleDrawer();
                        }
                        Navigator.of(context).pushNamed('/cart');
                      },
                      child: MenuLabel(
                        label: 'Cart',
                        icon: Icons.shopping_basket,
                      ),
                    ),
                    MenuLabel(
                      label: 'Settings',
                      icon: Icons.settings,
                    ),
                  ],
                ),
                MenuLabel(
                  label: 'Logout',
                  icon: Icons.exit_to_app,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
