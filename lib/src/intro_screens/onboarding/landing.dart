import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/src/auth/auth_screens/sign_in/sign_in.dart';
import 'package:crendly/src/auth/auth_screens/crendly_registration_options/registration_options.dart';
import 'package:crendly/src/playground/views/playground_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared_widgets/custom_outlined_button.dart';
import '../widgets/custom_carousel_page.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const CarouselPage(
                          image: AssetPath.landPageImage,
                          firstText: 'Ready? ',
                          secondText: 'let\'s go!',
                          thirdText: "Just a few more details and you'll be set to experience the future of loans.",
                        ),
                        const SizedBox(height: 10,),
                        ButtonWidget(
                            onPressed: (){
                              Get.to(()=> const SignUpOption());
                            },
                            buttonColor: kGreen,
                            buttonText: "Sign Up", borderRadius: 8,
                            height: 50, width: double.maxFinite
                        ),
                        const SizedBox(height: 8,),
                        CustomOutlineButton(text: 'Sign in',
                            onPressed: () {
                              Get.to(()=> const SignIn());
                            }),
                        const SizedBox(height: 20,),
                        TextButton(
                          onPressed: () {
                            Get.to(()=> const PlayGroundHomeScreen());
                          },
                          child: Text('Do this later', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
