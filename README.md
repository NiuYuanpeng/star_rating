# rating_star

用flutter实现的星星评分控件

```
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
    this.maxRating = 10,//默认最大分数
    this.size = 20,// 默认size
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    Widget? unselectedImage,
    Widget? selectedImage,
    this.count = 5,//默认5颗星，可以更改
  }): unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
  selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor,);


```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# star_rating
