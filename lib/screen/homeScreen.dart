import 'package:chat_app/auth/authServices.dart';
import 'package:chat_app/constant/color.dart';
import 'package:chat_app/widget/category.dart';
import 'package:chat_app/widget/homeScreenDoctorCart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  // void pushScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const AllDoctors(),
  //     ),
  //   );
  // }

  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        //Image.asset('assets/icons/menu.png'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/icons/person.png'),
          ),
        ],
        backgroundColor: backGroundColor,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: backGroundColor),
              accountName: Text(
                user!.email.toString(),
              ),
              accountEmail: Text(
                user!.email.toString(),
              ),
            ),
            ListTile(
              subtitle: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    signOut();
                  },
                  icon: const Icon(Icons.logout),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: backGroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: Colors.white,
                          //  fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      'Lets find \nyour top doctors!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Doctor inn',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: CategoryList(),
          ),
          const Expanded(
            flex: 3,
            child: HomeScreenDoctorCart(),
          ),
        ],
      ),
    );
  }
}
