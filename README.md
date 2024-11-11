# rating_star

用flutter实现的星星评分控件，支持星星个数、分数、size，选中颜色，未选择颜色等属性修改

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

使用起来非常简单
```  
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('评价星星'),
      ),
      body: Center(
        child: StarRating(
          rating: 3.3,
          size: 25,
        ),
      ),
    );
  }
  ```
[效果图][https://github.com/NiuYuanpeng/star_rating/blob/main/assets/snapshots/star.png]
