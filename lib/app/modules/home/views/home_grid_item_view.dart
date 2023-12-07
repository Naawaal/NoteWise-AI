import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_wise_ai/app/modules/home/controllers/home_controller.dart';

class HomeGridItemView extends GetView<HomeController> {
  final int index;

  const HomeGridItemView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data![index].category,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    fontSize: 16,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  data[index].title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  data[index].note,
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: Get.height * 0.01),
              ],
            ),
            Positioned(
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () async =>
                      controller.deleteNoteById(data[index].id),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ).marginAll(05),
    );
  }
}
