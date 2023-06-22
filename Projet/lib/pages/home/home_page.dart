import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myproj/pages/details/details_page.dart';
import 'package:myproj/pages/home/home_controller.dart';


class HomePage extends StatelessWidget {
  final List<String> items = <String>["IPhone A", "IPhone B", "IPhone C"];
  final List<String> pics = <String>[
    'assets/images/IPhone.jpg',
    'assets/images/IPH5.webp',
    'assets/images/IPH4.webp',];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _SearchFormField(),
            _Category(),
            _ListItems(),
            Divider()
          ],
        ),
        //bottomNavigationBar: _BottomNav(),
      ),
    );
  }

  Widget _ListItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            child: Card(
              child: ListTile(
                onTap: (){
                  Get.to(DetailsPage());
                },
                leading: Image.asset(pics[index]),
                title: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Text(items[index],
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OstrichSans',
                          color: Colors.grey[900]
                      ),)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Brand/ Seller',),
                    SizedBox(height: 2.0,),
                    Text('1000 dts'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _Category() {
    return Container(
      padding: EdgeInsets.fromLTRB(13.0, 12.0, 0.0, 12.0),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.chevronDown, size: 15.0,),
          SizedBox(width: 5.0,),
          Text("all"),
        ],
      ),
    );
  }
}

Widget _SearchFormField() {
  return Container(
    margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(40),
    ),
    child: TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search, color: Colors.black,),
      ),
    ),
  );
}