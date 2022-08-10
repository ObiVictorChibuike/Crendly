
import 'package:crendly/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../../constants/color_palette.dart';

class QuickLoanDetailsTile extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget? bottomWidget;
  const QuickLoanDetailsTile({Key? key, this.title, this.description, this.bottomWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(height: 150, width: double.maxFinite,
        padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xff081952), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),),
                SvgPicture.asset(AssetPath.carbonMoney),
              ],
            ),
            const SizedBox(height: 8,),
            Text(description!, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kWhite, fontSize: 16),),
            const Spacer(),
            bottomWidget ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
