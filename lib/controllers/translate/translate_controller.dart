import 'package:aspen_explore_application/controllers/home/home_controller.dart';
import 'package:aspen_explore_application/data/common/common.dart';
import 'package:aspen_explore_application/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslateController extends GetxController {
  bool isEnglish = GetStorage(CommonDataBase.boxName)
                  .read(CommonDataBase.localeBoxName) !=
              null &&
          GetStorage(CommonDataBase.boxName)
                  .read(CommonDataBase.localeBoxName) ==
              'en'
      ? true
      : GetStorage(CommonDataBase.boxName).read(CommonDataBase.localeBoxName) !=
                  null &&
              GetStorage(CommonDataBase.boxName)
                      .read(CommonDataBase.localeBoxName) ==
                  'fa'
          ? false
          : true;
  void changeTrasnlate() async {
    isEnglish = !isEnglish;
    await Get.updateLocale(Locale(isEnglish ? 'en' : 'fa'));
    Get.find<HomeController>().addEvent(HomeRefresh(isEnglish: isEnglish));
  }
}
