import 'package:chat_app/data/data.dart';
import 'package:chat_app/screen/allDocDataScreen.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List categoryListData = catList;

  void func() {
    for (var i = 0; i < categoryListData.length;) {}
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: categoryListData.length,
      itemBuilder: (context, index) {
        final item = categoryListData[index];
        return GestureDetector(
          onTap: () {
            // Handle the tap event and navigate to the corresponding screen.
            String title = catList[index]['title'];
            // You can use Navigator to navigate to different screens based on 'title'.
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllDoctorScreen(title: title),
                ));
          },
          child: GridTile(
            footer: Container(
              alignment: Alignment.center,
              child: Text(
                item['title'],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Image.asset(
                    item['itemImage'],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
