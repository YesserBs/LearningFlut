import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/cart/cart_controller.dart';
import 'package:myproj/view/dashboard/dashboard_controller.dart';
import 'package:myproj/view/details/details_page.dart';
import 'package:myproj/view/home/home_controller.dart';
import 'package:myproj/view/save/save_controller.dart';
import '../../custom/cText.dart';
import '../../objects/user.dart';

class HomePage extends StatelessWidget {
  UserController userController = UserController();
  DashboardController DC = Get.find();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/soldes.jpeg"),
                  Positioned(
                    top: 52,
                      left: 5,
                      right: 5,
                      height: 34,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 50,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                border: Border.all(
                                  color: config.lightGrey, // Specify the border color
                                  width: 2.0, // Specify the border width
                                ),
                                borderRadius: BorderRadius.circular(10), // Adjust the value as per your desired border radius
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.filter_alt,
                                  color: config.lightGrey,
                                  size: 20,
                                ),
                              ),
                            ),
                            50.0.w.horizontalSpace,
                            buildTextContainer("promotions"),
                            50.0.w.horizontalSpace,
                            buildTextContainer("recommanded"),
                            50.0.w.horizontalSpace,
                            buildTextContainer("shoes"),
                            50.0.w.horizontalSpace,
                            buildTextContainer("hats"),
                            50.0.w.horizontalSpace,
                            buildTextContainer("pants")
                          ],
                      )
                  ),
                  Positioned(
                    child: _SearchFormField(),
                  ),
                  Positioned(
                    top: 12.0,
                    right: 8.0,
                    child: GestureDetector(
                        onTap: (){
                          DC.changeTabIndex(4);
                        },
                        child: Icon(CupertinoIcons.cart, size: 32, color: Colors.grey[800],
                        )
                    ),
                  ),
                  Positioned(
                      top: 122,
                      left: 20.0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10), // Adjust the value as per your desired border radius
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("-30%",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                            10.h.verticalSpace,
                            Container(
                              height: 30,
                              width: 110,
                              decoration: BoxDecoration(
                                  border: Border.all(color: config.secondaryColor, width: 1.4),
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Check out",
                                    style: TextStyle(color: config.secondaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  Positioned(
                    top: 12.0,
                    right: 56.0,
                    child: GestureDetector(
                      onTap: (){
                        DC.changeTabIndex(5);
                      },
                        child: Icon(CupertinoIcons.heart, size: 32, color: Colors.grey[800])),
                  ),

                  Positioned(
                    bottom: -20,
                      child:
                      Container(
                        height: 30.0,
                          width: 412.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40.0)),
                      )
                  )
                ],
              ),
              _ListItems()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _SearchFormField() {
  HomeController _controller = Get.find();
  return Container(
    height: 32.0,
    margin: EdgeInsets.fromLTRB(25.0, 12.0, 110.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(9),
      border: Border.all(
        color: config.lightGrey, // Set the color of the border
        width: 2.0, // Set the width of the border
      ),
    ),
    child: TextFormField(
      onChanged: _controller.filterList,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
      style: TextStyle(color: Colors.black), // Set the text color of the TextFormField
    ),
  );
}
Widget _ListItems() {
  HomeController _controller = Get.find();
  CartController CC = Get.find();
  SaveController SC = Get.find();

  return Expanded(
    child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.7.h,
              children: List.generate(_controller.filteredArticles.length, (index) {
            final item = _controller.filteredArticles[index];
            return Stack(
              children: [
                Card(
                  //color: Colors.blue,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(DetailsPage(), arguments: item);
                    },
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(item.image[0]),
                        50.h.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cText(
                                text: item.nom,
                                changeFont: true,
                                size: 65,
                              ),
                              cText(text: item.marque, size: 35,),
                              10.h.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${item.prix.toString()}\$",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: config.primaryColor, fontSize: 19),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          int CartIndex = CC.addedArticles.indexOf(item);
                                          if (!CC.addedArticles.contains(item))
                                          {
                                            CC.addToCart(item);
                                          }
                                          else {
                                            CC.removeCartItem(item, CartIndex);
                                          }
                                        },
                                        child: Container(
                                            child: CC.addedArticles.contains(item) ? Icon(
                                              CupertinoIcons.xmark,
                                              size: 20,
                                              color: config.primaryColor,
                                            )
                                                : Icon(
                                              CupertinoIcons.cart,
                                              size: 25,
                                              color: Colors.grey[500],
                                            )
                                        ),
                                      ),
                                      75.w.horizontalSpace
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 17,
                  right: 10,
                  child: Icon(CupertinoIcons.heart_fill, size: 25, color: SC.SavedArticles.contains(item) ? Colors.red[300] : Colors.transparent),
                ),

                Positioned(
                  top: 17,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (!SC.SavedArticles.contains(item))
                      {
                        SC.addToSave(item);
                      }
                      else {
                        SC.removeCartItem(item);
                      }
                    },
                    child: Icon(CupertinoIcons.heart, size: 25, color: SC.SavedArticles.contains(item) ? Colors.red[300] : config.secondaryColor),
                  ),
                ),
              ],
            );
        }),
      ),
          ),
    ),
  );
}


OutlinedButton createBorderedButton(Widget child, VoidCallback onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      backgroundColor: config.lightGrey,
      //side: BorderSide(width: 1, color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: child,
  );
}

class DropdownButtonWidget extends StatefulWidget {
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  // List of items for the dropdown menu
  List<String> _items = ['All', 'Gadgets', 'Clothes', 'Others'];

  // The currently selected item
  String _selectedItem = 'All';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue!;
        });
      },
      items: _items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}


Container buildTextContainer(String text) {
  return Container(
    width: 100,
    height: 36,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      border: Border.all(
        color: config.lightGrey,
        width: 2.0, // Specify the border width
      ),
      borderRadius: BorderRadius.circular(10), // Adjust the value as per your desired border radius
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: config.lightGrey
        ),
      ),
    ),
  );
}
