import 'package:feirapp/utils/dimensions.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  RatingWidget({
    Key? key,
    this.maximumRating = 5,
    required this.onRatingSelected,
  }) : super(key: key);

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(
        Icons.star,
        color: Colors.orange,
        size: Dimensions.height30,
      );
    } else {
      return Icon(
        Icons.star_border_outlined,
        size: Dimensions.height30,
      );
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });
          widget.onRatingSelected(_currentRating);
        },
      );
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: stars,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
