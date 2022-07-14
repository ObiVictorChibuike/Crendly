import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/auth/auth_screens/registration/bvn_verifcation.dart';
import 'package:crendly/src/auth/auth_screens/registration/crendly_business_registration_screen.dart';
import 'package:crendly/src/auth/auth_screens/registration/permission_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../constants/dummy_data.dart';
import '../../../../shared_widgets/cutom_appBar.dart';


class CrendlyOption extends StatelessWidget {
  const CrendlyOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void chooseOption(int index){
      index == 0 ? Get.to(()=> const PermissionAccess()) : Get.to(()=> const PermissionAccess());
    }
    List options = DummyData.crendlyOption;
    return SafeArea(top:  false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
        appBar: AppBar(elevation: 0.0,
          leading: const SizedBox(),
          backgroundColor: kDarkBackGroundColor,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AssetPath.logo),
              const Spacer(),
              Align(alignment: Alignment.centerLeft,
                child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5, minHeight: 50),
                    child: Text('What would you like  to do on Crendly?',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 32,color: kOrange, fontWeight: FontWeight.w700),)),
              ),
              const SizedBox(height: 47,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(options.length, (index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            chooseOption(index);
                            //Get.toNamed('/bvn');
                          },
                          child: Container(height: 285,width: MediaQuery.of(context).size.width / 2.3,
                            padding: const EdgeInsets.fromLTRB(15.0, 19.0, 15.0, 20.0),
                            decoration: BoxDecoration(gradient: LinearGradient(
                                colors: options[index]["color"]), borderRadius: BorderRadius.circular(12)),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(height: 70, width: 70,
                                          decoration: const BoxDecoration(shape: BoxShape.circle, color: kDarkBackGroundColor),
                                          child: Center(
                                            child: SvgPicture.asset(options[index]["asset"], height: 50, width: 50, theme: const SvgTheme(fontSize: 25),),
                                          ),
                                        ),
                                        const SizedBox(height: 27.0,),
                                        ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 4, minHeight: 50),
                                            child: Text(options[index]["title"],
                                              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 28, fontWeight: FontWeight.w700),)),
                                        ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 5, minHeight: 50),
                                            child: Text(options[index]["description"],
                                              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),)),
                                      ],
                                    ),
                                  )
                                  ,)
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const Spacer(),
              Text('Either way, we’ll be having a \ngood time together.',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w400),),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
