import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeGridBuilderView extends GetView {
  const HomeGridBuilderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 06,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      clipBehavior: Clip.antiAlias,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: Get.height * 0.28,
          decoration: BoxDecoration(
            color: Colors.blue[100 * (index % 9 + 1)],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text('$index'),
          ),
        );
      },
    );
  }
}
