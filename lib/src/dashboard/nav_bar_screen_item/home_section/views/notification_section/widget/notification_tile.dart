import 'package:crendly/shared_widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constants/color_palette.dart';

class NotificationTile extends StatelessWidget {
  final String? title;
  final String? action;
  final String? body;
  final String? btnText;
  final void Function()? onTap;
  const NotificationTile({Key? key, this.title, this.action, this.body, this.btnText, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBackGroundColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 15, width: 15, decoration: BoxDecoration(shape: BoxShape.circle, color: kBlue),
                child: Icon(Icons.notifications_none_rounded, color: kWhite, size: 10,),
              ),
              const SizedBox(width: 15,),
              Text(title!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kOrange, fontSize: 14, fontWeight: FontWeight.w700),),
              const Spacer(),
              Text(action!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 10, fontWeight: FontWeight.w400),),
            ],
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(body!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 14, fontWeight: FontWeight.w400),),
          ),
          btnText == null ? const SizedBox() : const SizedBox(height: 15,),
          btnText == null ? const SizedBox() : Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: GestureDetector(onTap: onTap,
              child: Container(height: 35, padding: EdgeInsets.fromLTRB(10,5,10,5), decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(4)),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(btnText!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
