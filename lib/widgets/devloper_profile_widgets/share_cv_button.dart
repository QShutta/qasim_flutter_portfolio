import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/main.dart';
import 'package:share_plus/share_plus.dart';

class ShareCvButton extends StatelessWidget {
  const ShareCvButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 300,
      width: sharePref!.getString("lang") == "ar" ? 300 : 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: () async {
          await Share.share(
            "https://drive.google.com/file/d/1eK7208NOpc3EOYuFkEzVRESgmaWbR5-j/view?usp=drive_link",
          );
        },
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center both icon and text
          children: [
            Text(
              "31".tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              size: 20.0,
              Icons.share, // Or try Icons.picture_as_pdf to represent a CV
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
