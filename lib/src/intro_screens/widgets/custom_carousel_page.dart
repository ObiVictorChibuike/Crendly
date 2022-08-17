import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/color_palette.dart';

class CarouselPage extends StatelessWidget {
  final String image;
  final String firstText;
  final String secondText;
  final String thirdText;

  const CarouselPage({Key? key, required this.image, required this.firstText, required this.secondText, required this.thirdText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 50,),
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: SvgPicture.asset(image, width: double.maxFinite, height: MediaQuery.of(context).size.height/2.1,),),
      Container(
        margin: const EdgeInsets.only(top: 20, left: 30, right: 162), width: 198,
        child: RichText(
          text: TextSpan(text: firstText, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 27,color: Colors.white,fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: secondText, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 27, color: kOrange, fontWeight: FontWeight.bold),)
              ]),
        ),
      ),
      Container(width: 257, height: 70, margin: const EdgeInsets.only(top: 8, left: 30, right: 103),
          child: Text(thirdText, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w400, color: kWhite, fontSize: 16))),
    ]);
  }
}
