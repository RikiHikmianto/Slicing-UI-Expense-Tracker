import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/style.dart';

class MoneyBalance extends StatelessWidget {
  final color;
  String title, image;
  num monney;

  MoneyBalance(
      {Key? key,
      required this.color,
      required this.image,
      required this.title,
      required this.monney})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(image)),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: textPrimary.copyWith(color: whiteColor),
                ),
                SizedBox(
                  height: 5,
                ),
                FittedBox(
                  child: Text(
                    "\$" + monney.toString(),
                    style: textBold.copyWith(color: whiteColor, fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
