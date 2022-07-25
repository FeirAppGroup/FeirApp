import 'package:feirapp/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingWidget(
              onRatingSelected: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(
                height: 44,
                child: _rating != null && _rating > 0
                    ? Text(
                        "You selected $_rating rating",
                        style: TextStyle(fontSize: 18),
                      )
                    : SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
