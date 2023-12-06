import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeGridBuilderView extends GetView {
  const HomeGridBuilderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      clipBehavior: Clip.antiAlias,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            color: Colors.indigoAccent,
            height: 100,
            width: 100,
          ),
        );
      },
    );
  }
}
