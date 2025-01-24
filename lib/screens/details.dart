import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_challenge5/dummy_data.dart';
import 'package:ui_challenge5/theme/colors.dart';
import 'package:ui_challenge5/theme/font_cnst.dart';
import 'package:ui_challenge5/theme/style_text.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myText(
                'Place an Order',
                weight: FontWeight.w600,
                size: 18,
              ),
              Icon(
                Icons.chevron_right,
                size: 20,
                color: AppColor.black,
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: AppColor.lighterGray,
                        ),
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.star,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 130,
                child: Text(
                  popularFoodList[index]["name"]!,
                  maxLines: 2,
                  style:
                      TextStyle(fontSize: 40, fontWeight: FontManager.semiBold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/dollar.svg",
                    width: 15,
                    color: AppColor.third,
                  ),
                  myText(
                    "5.99",
                    size: 40,
                    weight: FontManager.bold,
                    color: AppColor.third,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myText(
                        "Size",
                        color: AppColor.lighterGray,
                        size: FontSize.small,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      myText(
                        "Medium 14",
                        color: AppColor.black,
                        weight: FontManager.medium,
                        size: FontSize.regular,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      myText(
                        "Crust",
                        color: AppColor.lighterGray,
                        size: FontSize.small,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      myText(
                        "Thin Crust",
                        color: AppColor.black,
                        weight: FontManager.medium,
                        size: FontSize.regular,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      myText(
                        "Delivery in",
                        color: AppColor.lighterGray,
                        size: FontSize.small,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      myText(
                        "30 min",
                        color: AppColor.black,
                        weight: FontManager.medium,
                        size: FontSize.regular,
                      ),
                    ],
                  ),
                  Container(
                    transform: Matrix4.translationValues(15, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: ValueKey(
                        popularFoodList[index]["imagePath"]!,
                      ),
                      child: Image.asset(
                        popularFoodList[index]["imagePath"]!,
                        width: MediaQuery.of(context).size.width / 1.8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              myText(
                "Ingredients",
                color: AppColor.black,
                weight: FontManager.semiBold,
                size: FontSize.medium,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.only(
                      bottom: 15,
                      right: 10,
                      top: 20,
                    ),
                    color: AppColor.white,
                    child: Image.asset(
                      ingredients[index],
                      width: 80,
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //   margin: EdgeInsets.only(
                  //       left: 20, bottom: 15, right: 20, top: 10),
                  //   decoration: BoxDecoration(
                  //     color: AppColor.white,
                  //     borderRadius: BorderRadius.circular(15),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           blurRadius: 4,
                  //           offset: Offset(0, 4),
                  //           color: AppColor.lighterGray),
                  //     ],
                  //   ),
                  //   child: Image.asset(
                  //     ingredients[index],
                  //   ),
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
