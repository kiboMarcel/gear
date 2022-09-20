import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCardShimmer extends StatelessWidget {
  CategoryCardShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFF3F485E),
      highlightColor: Color(0xFF424C66),
      //highlightColor: kShimmerBaseColor,
      child: GridView.custom(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xFF3F485E),
                ),
                shadowColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: null,
              child: Container(),
            );
          },
          childCount: 6,
        ),
      ),
    );
  }
}
