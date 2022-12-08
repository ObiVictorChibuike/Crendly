import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_outlined_button.dart';
import 'package:crendly/presentation/modules/intro_screens/crendly_registration_options/registration_options.dart';
import 'package:crendly/presentation/modules/intro_screens/onboarding/widgets/custom_carousel_page.dart';
import 'package:crendly/src/playground/views/playground_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crendly/presentation/modules/sign_in/pages/sign_in.dart';



class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CarouselPage(
                      height: 20,
                      image: AssetPath.landPageImage,
                      firstText: 'Ready? ',
                      secondText: 'let\'s go!',
                      thirdText: "Just a few more details and you'll be set to experience the future of loans.",
                    ),
                    const SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ButtonWidget(
                          onPressed: (){
                            Get.to(()=> const SignUpOption());
                          },
                          buttonColor: kGreen,
                          buttonText: "Sign Up", borderRadius: 8,
                          height: 50, width: double.maxFinite
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomOutlineButton(text: 'Sign In',
                          onPressed: () {
                            Get.to(()=> const SignIn());
                          }),
                    ),
                    const SizedBox(height: 49,),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=> const PlayGroundHomeScreen());
                      },
                      child: Text('Do this later', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}