import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproj/config/configuration.dart';

import '../../../custom/cText.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: cText(text: "Cart page", size: config.FontSizeTitle, changeFont: true),
          ),
        ),
      ),
    );
  }
}
