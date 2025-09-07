import 'package:awesome_icons/awesome_icons.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        // icon star
        Icon(FontAwesomeIcons.solidStar, size: 14, color: Color(0xffFFDD4F)),
        Gap(6),
        // rating
        Text('4.8', style: Styles.textStyle16),
        Gap(5),
        // reviews
        Opacity(
          opacity: 0.5,
          child: Text(
            '(245)',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
