//ignore_for_file:  --no-tree-shake-icons, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_element

import 'package:easytodo1/constant.dart';
import 'package:easytodo1/widgets/home_widgets/appbar_home_widget.dart';
import 'package:easytodo1/widgets/home_widgets/drawer_home_widget.dart';
import 'package:easytodo1/widgets/home_widgets/floating_button_home_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/home_widgets/grid_view_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: MyAppBarHome(),
      drawer: drawerHome(),
      floatingActionButton: const MyFloatingActionButtonHome(
        fabColor: KBlackColor,
      ),
      body: MyGridView(),
    );
  }
}
