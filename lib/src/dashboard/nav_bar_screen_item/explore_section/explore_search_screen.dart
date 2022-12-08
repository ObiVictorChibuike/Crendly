
import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class ExploreSearchScreen extends StatefulWidget {
  const ExploreSearchScreen({Key? key}) : super(key: key);

  @override
  State<ExploreSearchScreen> createState() => _ExploreSearchScreenState();
}

class _ExploreSearchScreenState extends State<ExploreSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kDarkBackGroundColor, elevation: 0.0,
            title: Text("Search", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 20),),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(onPressed: (){
                  Get.back();
                },
                    icon: Icon(Icons.clear, size: 35, color: kOrange,)),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(25.0,25.0,25.0,0.0),
            child: Column(
              children: [
                FormFieldWidget(
                  onTap: (){},
                  hintText: "Search",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AssetPath.search),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
