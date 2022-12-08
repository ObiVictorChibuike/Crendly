import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselPage extends StatelessWidget {
  final String image;
  final String firstText;
  final String secondText;
  final String thirdText;
  final double? height;
  const CarouselPage({Key? key, required this.image, required this.firstText, required this.secondText, required this.thirdText, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
        children: [
      const SizedBox(height: 80,),
      Align(alignment: Alignment.center, child: SvgPicture.asset(image, width: double.maxFinite, height: MediaQuery.of(context).size.height/2.3,)),
          SizedBox(height: height  ?? 80,),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: RichText(
          text: TextSpan(text: firstText, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: secondText, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 27, color: kOrange, fontWeight: FontWeight.bold),)
              ]),
        ),
      ),
      const SizedBox(height: 5,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(thirdText, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w400, color: kWhite, fontSize: 16)),
      ),
    ]);
  }
}
