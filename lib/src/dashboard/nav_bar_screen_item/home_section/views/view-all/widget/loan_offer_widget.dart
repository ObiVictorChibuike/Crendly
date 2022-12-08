import 'package:crendly/app/constants/color_palette.dart';

import 'package:flutter/material.dart';

class LoanOfferWidget extends StatelessWidget {
  final String? date;
  final String? time;
  final String? body;
  final String? title;
  final bool? timeOut;
  final String? buttonText;
  final String? action;
  final String? titleName;
  final void Function()? onTap;
  const LoanOfferWidget({Key? key, this.date, this.time, this.body, this.title, this.timeOut, this.buttonText, this.action, this.titleName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xffAAAAAA), fontSize: 12,),),
              time == null ? Text(action!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: timeOut == false ? kGreen : Color(0xffF86C44), fontSize: 16,),) :
              Text(time!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: timeOut == false ? kGreen : Color(0xffF86C44), fontSize: 16,),),
            ],
          ),
          const SizedBox(height: 10,),
          title == null ?
          RichText(text: TextSpan(text: titleName!, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),
              children: [TextSpan(text: ' David Emmanuel', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontSize: 14, fontWeight: FontWeight.w700, decoration: TextDecoration.underline))]),) :
          Text(title!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14,),),
          const SizedBox(height: 5,),
          Text(body!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14,),),
          const SizedBox(height: 10,),
          timeOut == true ? Text("You are almost out of time for this request.",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Color(0xff9CACE0), fontSize: 14),) : const SizedBox(),
          const SizedBox(height: 10,),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 35, padding: EdgeInsets.all(10), decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(4)),
              child: Text(buttonText!,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: kDarkBackGroundColor),),
            ),
          )
        ],
      ),
    );
  }
}
