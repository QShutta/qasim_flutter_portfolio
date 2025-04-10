import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/widgets/my_projects_page_widgets/page_title.dart';
import 'package:qasim_profile_info/widgets/my_projects_page_widgets/project_card.dart';

class MyProjectsPage extends StatelessWidget {
  const MyProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          PageTitle(),
          SizedBox(height: 10),
          ProjectCard(
            title: '22'.tr,
            imagePath: 'assets/note_taking_app.png',
            description: '23'.tr,
            githubUrl: 'https://github.com/QShutta/NoteTakingApp',
          ),

          SizedBox(height: 100),
          ProjectCard(
            title: '24'.tr,
            imagePath: 'assets/news_app.png',
            description: '25'.tr,
            githubUrl: 'https://github.com/QShutta/NewsApp',
          ),
          SizedBox(height: 100),
          ProjectCard(
            title: '26'.tr,
            imagePath: 'assets/q_a_app.png',
            description: '27'.tr,
            githubUrl: 'https://github.com/QShutta/Q-A',
          ),
        ],
      ),
    );
  }
}
