import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class SelectedLoanDetailsTile extends StatelessWidget {
  final String? requestAvailable;
  final String? loanRange;

  const SelectedLoanDetailsTile({Key? key, this.requestAvailable, this.loanRange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(width: double.maxFinite,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Color(0xff081952), borderRadius: BorderRadius.circular(4)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amount Category", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                Text(loanRange!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
                const SizedBox(height: 15,),
                Text("Requests available", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 12),),
                Text(requestAvailable!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: kWhite, size: 20,)
          ],
        ),
      ),
    );
  }
}
