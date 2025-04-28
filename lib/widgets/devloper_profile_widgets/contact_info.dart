import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  // استخدمت
                  //Directionality
                  //عشان أضمن إن رقم التلفون يظهر من اليسار لليمين
                  //(LTR)
                  // حتى لو لغة التطبيق عربية
                  //RTL،
                  // لأن الأرقام شكلها بكون غير مقروء لو ما عملنا كدة
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      "+249 909 054 928",
                      style: TextStyle(
                        fontSize: 16,

                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                  Text(
                    "abolkasm11@gmail.com",
                    style: TextStyle(
                      fontSize: 16,

                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  final Uri facebookUri = Uri.parse(
                    "https://www.facebook.com/profile.php?id=100091674515795",
                  );
                  if (await canLaunchUrl(facebookUri)) {
                    await launchUrl(facebookUri);
                  } else {
                    throw 'Could not launch $facebookUri';
                  }
                },
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.facebook),
                    SizedBox(width: 10),
                    Text(
                      "33".tr,
                      style: TextStyle(
                        fontSize: 16,

                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  final Uri facebookUri = Uri.parse(
                    "https://www.linkedin.com/in/abualqasim-mohamed/",
                  );
                  if (await canLaunchUrl(facebookUri)) {
                    await launchUrl(facebookUri);
                  } else {
                    throw 'Could not launch $facebookUri';
                  }
                },
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.linkedin),
                    SizedBox(width: 10),
                    Text(
                      "34".tr,
                      style: TextStyle(
                        fontSize: 16,

                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  final Uri facebookUri = Uri.parse(
                    "https://github.com/QShutta",
                  );
                  if (await canLaunchUrl(facebookUri)) {
                    await launchUrl(facebookUri);
                  } else {
                    throw 'Could not launch $facebookUri';
                  }
                },
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.github),
                    SizedBox(width: 10),
                    Text(
                      "35".tr,
                      style: TextStyle(
                        fontSize: 16,

                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(FontAwesomeIcons.locationDot),
                  SizedBox(width: 10),
                  Text(
                    "36".tr,
                    style: TextStyle(
                      fontSize: 16,

                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
