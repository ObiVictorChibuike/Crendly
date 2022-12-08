import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String initialRangeValue;
  final String finalRangeValue;
  const FilterWidget({Key? key, required this.initialRangeValue, required this.finalRangeValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      padding: EdgeInsets.all(10), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: kWhite)),
      child: Row(
        children: [
          Text(initialRangeValue, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12 ),),
          const SizedBox(width: 5,),
          Container(
            height: 1, width: 8, color: kWhite,
          ),
          const SizedBox(width: 5,),
          Text(finalRangeValue, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12 ),)
        ],
      ),
    );
  }
}
