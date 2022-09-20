import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardWidgetShimmer extends StatelessWidget {
  CardWidgetShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFF3F485E),
      highlightColor: Color(0xFF424C66),
      //highlightColor: kShimmerBaseColor,
      child: ListView.custom(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 1,
              child: Container(height: 75),
            );
          },
          childCount: 3,
        ),
      ),
    );
  }
}
