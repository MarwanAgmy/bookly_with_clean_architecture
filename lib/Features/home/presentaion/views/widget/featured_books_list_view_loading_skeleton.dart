import 'package:flutter/cupertino.dart';

import 'custom_book_image_item__loading_skeleton.dart';

class FeaturedBooksListViewLoadingSkeleton extends StatelessWidget {
  const FeaturedBooksListViewLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 14),
            child: CustomBookImageItemLoadingSkeleton(),
          );
        },
      ),
    );
  }
}
