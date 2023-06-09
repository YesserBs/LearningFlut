import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/dashboard/dashboard_controller.dart';
import '../auth/auth.dart';

class DashboardPage extends StatelessWidget {
  DashboardController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: config.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(100.h, 100.h, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ElevatedButton(onPressed: (){
                logOut();
              },
                  child: Text("Log out"))],
            ),
          ),
        ),
      ),
    );
  }
}
