import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/modules/home/views/home_grid_builder_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'home_custom_app_bar_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarView(),
      body: SafeArea(
        child: controller.obx(
          (data) => const HomeGridBuilderView(),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text(error.toString())),
          onEmpty: const Center(child: Text('Add Your First Note')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.antiAlias,
        onPressed: () async => Get.toNamed(Routes.ADD_NOTE),
        child: const Icon(Icons.add),
      ),
    );
  }
}
