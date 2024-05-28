import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  const EventWidget(
      {super.key,
      required this.communityName,
      required this.description,
      this.onTap});
  final String communityName;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: ColorConstant.white,
        border: Border.all(color: ColorConstant.DefaultBlue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/splash.jpeg"),
                  radius: 25,
                  backgroundColor: Colors.amber,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  communityName,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.green),
                )
              ],
            ),
            Text(
              description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onTap,
                  child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.DefaultBlue),
                    child: Center(
                      child: Text(
                        "Join",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: ColorConstant.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
