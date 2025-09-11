import 'package:awesome_icons/awesome_icons.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start, required this.reating, required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num reating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        // icon star
        Icon(FontAwesomeIcons.solidStar, size: 14, color: Color(0xffFFDD4F)),
        Gap(6),
        // rating
        Text(reating.toString(), style: Styles.textStyle16),
        Gap(5),
        // reviews
        Opacity(
          opacity: 0.5,
          child: Text(
            '($count)',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
