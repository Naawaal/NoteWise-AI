import 'package:flutter/material.dart';

class CustomAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarView({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Recent Notes",
        ),
      ),
    );
  }
}
