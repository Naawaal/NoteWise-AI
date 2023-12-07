import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/modules/home/controllers/home_controller.dart';
import 'package:note_wise_ai/app/modules/home/views/home_grid_item_view.dart';

class HomeGridBuilderView extends GetView<HomeController> {
  const HomeGridBuilderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => MasonryGridView.builder(
        itemCount: data!.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return HomeGridItemView(
            index: index,
          );
        },
      ),
    );
  }
}
