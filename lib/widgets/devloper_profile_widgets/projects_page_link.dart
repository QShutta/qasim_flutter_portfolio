import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectsPageLink extends StatelessWidget {
  const ProjectsPageLink({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/MyProjects");
      },
      child: Row(
        children: [
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 20, right: 20),

            child: Text(
              "29".tr,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
                color: Theme.of(context).textTheme.bodyLarge!.color,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.folder_copy_rounded),
        ],
      ),
    );
  }
}
