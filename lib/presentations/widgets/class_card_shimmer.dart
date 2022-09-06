/* import 'package:flutter/material.dart';

class ClassCardShimmer extends StatelessWidget {
  ClassCardShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onPrimary,
      highlightColor: Theme.of(context).secondaryHeaderColor,
      //highlightColor: kShimmerBaseColor,
      child: GridView.custom(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).secondaryHeaderColor),
                elevation: MaterialStateProperty.all(1),
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
          childCount: 3,
        ),
      ),
    );
  }
}
 */