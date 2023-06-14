import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class TextController extends GetxController {
  // Create an observable string using RxString
  var message = ''.obs;
  var xInt = 0.obs;
  var xCh = ''.obs;
  var somme = 0.obs;

  // Function to update the message
  void updateMessage(String newMessage) {
    message.value =  message.value + newMessage;
    xCh.value = xCh.value + newMessage;
  }
  void updateXandSomme() {
    if (xCh.value.length > 1) {
      String result = xCh.substring(0, xCh.value.length - 1);
      print(result);

      //xInt.value = int.tryParse(result.value) ?? 0;
      int? number = int.tryParse(result);
      somme.value = somme.value + number!;
      xCh.value = '';
      print(somme);
    }
  }
}

class MyApp extends StatelessWidget {
  final TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX String Observable',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX String Observable'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                textController.message.value,
                style: TextStyle(fontSize: 24),
              )),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        textController.updateMessage('5');
                      },
                      child: Text('5'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        textController.updateMessage('+');
                        textController.updateXandSomme();
                      },
                      child: Text('+'),
                    ),
                    ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
