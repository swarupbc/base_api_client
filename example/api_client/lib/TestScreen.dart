import 'package:api_client/TestAPi.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _controller = TestApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _controller.getData();
              },
              child: Text('Test get'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _controller.postData();
              },
              child: Text('Test post'),
            ),
          ),
        ],
      )),
    );
  }
}
