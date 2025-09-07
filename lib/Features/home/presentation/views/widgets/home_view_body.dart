import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              // listView
              FeaturedBooksListView(),
              Gap(50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
              Gap(20),
            ],
          ),
        ),
        // list under
        SliverFillRemaining(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BestSellerListView(),
        )),

      ],
    );
  }
}

