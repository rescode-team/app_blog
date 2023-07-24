import 'package:app_blog/View/inicio/populares_page.dart';
import 'package:app_blog/View/inicio/topicos_page.dart';
import 'package:app_blog/View/resources/color_manager.dart';
import 'package:app_blog/ViewModel/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:line_icons/line_icons.dart';

import 'header.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.branco,
          body: Column(
            children: [
              Header(),
              Obx(
                      (){
                    return Get.find<NavigationController>().tab.value == 'Populares'
                        ? PopularesPage() : TopicosPage();
                  }
              )
            ],
          )
      )
    );
  }
}
