import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/modules/home/views/home_grid_builder_view.dart';

import '../controllers/home_controller.dart';
import 'home_custom_app_bar_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarView(),
      body: const SafeArea(
        child: HomeGridBuilderView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
