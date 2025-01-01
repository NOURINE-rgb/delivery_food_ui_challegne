import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_challenge5/screens/home.dart';
import 'package:ui_challenge5/theme/colors.dart';
import 'package:ui_challenge5/theme/font_cnst.dart';
import 'package:ui_challenge5/theme/style_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {required this.title,
      required this.imagePath,
      required this.onClick,
      required this.index,
      super.key});
  final String title;
  final String imagePath;
  final int index;
  final void Function(int i) onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(index),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20, right: 10),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index == globalIndex ? AppColor.primary : Colors.white,
          boxShadow: [
            BoxShadow(color: AppColor.lighterGray, blurRadius: 15),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            myText(title, color: AppColor.black, size: FontSize.small),
            SvgPicture.asset(
              imagePath,
              width: 40,
            ),
            RawMaterialButton(
              onPressed: () {},
              fillColor: index == globalIndex ? AppColor.white : AppColor.third,
              shape: CircleBorder(),
              child: Icon(
                Icons.chevron_right_rounded,
                color: index == globalIndex ? AppColor.black : AppColor.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
