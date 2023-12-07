import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/modules/home/controllers/home_controller.dart';

class HomeGridItemView extends GetView<HomeController> {
  final int index;

  const HomeGridItemView({
    super.key,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => Container(
        height: Get.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100 * (index % 9 + 1)],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(data![index].id.toString()),
        ),
      ),
    );
  }
}
