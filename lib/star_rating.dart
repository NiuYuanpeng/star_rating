import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  // const StarRating({super.key, this.rating, required this.maxRating, required this.unselectedImage, required this.selectedImage, required this.count, required this.size, required this.unselectedColor, required this.selectedColor});

  final double rating;
  final double maxRating;
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  StarRating({
    required this.rating,
    this.maxRating = 10,
    this.size = 20,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    Widget? unselectedImage,
    Widget? selectedImage,
    this.count = 5,
  }): unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
  selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor,);


  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(children: getUnSelectImage(), mainAxisSize: MainAxisSize.min,),
          Row(children: getSelectImage(), mainAxisSize: MainAxisSize.min,),
        ],
      ),
    );
  }

  // 获取评星
  List<Widget> getUnSelectImage() {
    return List.generate(widget.count, (index) => widget.unselectedImage);
  }

  List<Widget> getSelectImage() {

    // 1.计算Start个数和剩余比例等 rating = 5.7  maxRating = 10 count = 5
    double oneValue = widget.maxRating / widget.count;
    // print('oneValue:$oneValue');//一个星代表 10/5 = 2分
    int entireCount = (widget.rating / oneValue).floor();
    // print('entireCount:$entireCount');// 5.7/2 评分占据星的个数取整 2颗星
    double leftValue = widget.rating - entireCount * oneValue;
    // print('leftValue:$leftValue');// 5.7-2*2 = 1.7
    double leftRatio = leftValue/oneValue;
    // print('leftRatio:$leftRatio');// 1.7占据一颗星的比例

    // 2.获取整数的start
    List<Widget> selectdImages = [];
    for (int i = 0; i < entireCount; i++) {
      selectdImages.add(widget.selectedImage);
    }

    // 3.计算不足以占据一颗星的star
    Widget leftStar = ClipRect(
      clipper: MyRectClipper(width: leftRatio * widget.size),
      child: widget.selectedImage,
    );
    selectdImages.add(leftStar);
    return  selectdImages;
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  final double width;

  @override
  Rect getClip(Size size) {
      return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
      return width != oldClipper.width;
  }

  MyRectClipper({this.width = 100});
}
