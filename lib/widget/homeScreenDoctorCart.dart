import 'package:chat_app/constant/color.dart';
import 'package:chat_app/data/data.dart';
import 'package:flutter/material.dart';

class HomeScreenDoctorCart extends StatefulWidget {
  const HomeScreenDoctorCart({super.key});

  @override
  State<HomeScreenDoctorCart> createState() => _HomeScreenDoctorCartState();
}

class _HomeScreenDoctorCartState extends State<HomeScreenDoctorCart> {
  List doctData = homeDocCart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctData.length,
      itemBuilder: (context, index) {
        final data = doctData[index];
        return Container(
          margin: const EdgeInsets.all(10),
          width: 362,
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.559999465942383),
              color: Colors.white),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(5),
              child: Badge(
                backgroundColor: ratingColor,
                child: Image.asset(
                  data['itemImage'],
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                data['title'],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['skill'],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(data['app']),
                ),
              ],
            ),
            trailing: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_half_sharp,
                  color: ratingColor,
                ),
                Text(
                  '4.9',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
