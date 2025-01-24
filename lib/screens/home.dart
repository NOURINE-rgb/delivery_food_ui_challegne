import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_challenge5/dummy_data.dart';
import 'package:ui_challenge5/theme/colors.dart';
import 'package:ui_challenge5/theme/font_cnst.dart';
import 'package:ui_challenge5/theme/style_text.dart';
import 'package:ui_challenge5/widget/category_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int globalIndex = -1;

class _HomeState extends State<Home> {
  void onTap(int i) {
    setState(() {
      globalIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage("assets/pfp.jpg"),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8),
              child: SvgPicture.asset(
                "assets/menu.svg",
                color: AppColor.black,
                width: 35,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            myText("Food",
                color: AppColor.secondary,
                size: FontSize.semiBig,
                weight: FontManager.regular),
            myText("Delivery",
                color: AppColor.black,
                size: FontSize.large,
                weight: FontManager.medium),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.search,
                    size: 30,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search ...",
                        hintStyle: TextStyle(
                          color: AppColor.grey,
                          fontSize: FontSize.regular,
                          fontWeight: FontManager.regular,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            myText("Catetgories",
                color: AppColor.black,
                size: FontSize.semiBig,
                weight: FontManager.medium),
            SizedBox(
              height: 240,
              child: ListView.builder(
                itemCount: foodCategoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CategoryItem(
                    onClick: onTap,
                    index: index,
                    title: foodCategoryList[index]["name"]!,
                    imagePath: foodCategoryList[index]["imagePath"]!),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            myText("Popular",
                color: AppColor.black,
                size: FontSize.semiBig,
                weight: FontManager.medium),
            Column(
              children: List.generate(
                popularFoodList.length,
                (index) => popularItem(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container popularItem(int index) {
    return Container(
      // margin: EdgeInsets.only(right: 25, left: 20, top: 25),
      margin: EdgeInsets.only(right: 25, top: 25),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: Offset(10, 8),
              blurRadius: 10,
              color: AppColor.lighterGray)
        ],
        color: AppColor.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColor.primary,
                      size: 20,
                    ),
                    myText("Top of the week", size: 13),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                myText(popularFoodList[index]["name"]!,
                    weight: FontManager.semiBold, size: FontSize.medium),
                myText(popularFoodList[index]["weight"]!,
                    color: AppColor.lighterGray,
                    weight: FontManager.regular,
                    size: FontSize.small),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  spacing: 15,
                  children: [
                    Container(
                      width: 90,
                      height: 45,
                      transform: Matrix4.translationValues(-16, 0, 0),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColor.black,
                            size: 12,
                          ),
                          myText(popularFoodList[index]["star"]!,
                              size: FontSize.small,
                              weight: FontManager.semiBold)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(30.0, 0.0, 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(color: Colors.grey[400]!, blurRadius: 20)
                ]),
            child: Image.asset(popularFoodList[index]["imagePath"]!,
                width: MediaQuery.of(context).size.width / 2.9),
          ),
        ],
      ),
    );
  }
}


/// douk min nji nakhdem b translator and the shadow effect of container 
///  ya nsaghar hight of image or maximasze hte hight of container