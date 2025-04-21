import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/dev_info_controller.dart';
import 'package:qasim_profile_info/services/settings_services.dart';
import 'package:qasim_profile_info/view/welcome.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/change_lang_button.dart';

class DeveloperInfoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DeveloperInfoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final DevInfoController devCont = Get.find();
    final SettingsServices settingsServices = Get.find();
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.offAll(() => Welcome());
          settingsServices.sharePref!.clear();
        },
        icon: Icon(Icons.exit_to_app),
      ),
      actions: [
        IconButton(
          onPressed: () {
            devCont.changeTheme();
          },
          icon: Icon(Icons.dark_mode_outlined),
        ),

        ChangeLangButton(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
