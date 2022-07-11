import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/customButton.dart';
import 'package:crendly/shared_widgets/cutom_appBar.dart';
import 'package:crendly/shared_widgets/cutom_pincode_field.dart';
import 'package:crendly/src/dashboard/nav_bar_screen_item/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(
            title: Text("Sign In", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
            decorationImagePath: AssetPath.fullTag,
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60,),
                SvgPicture.asset(AssetPath.lemonHead),
                const SizedBox(height: 20,),
                Text('Welcome back Damilare', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 20, fontWeight: FontWeight.w700),),
                const SizedBox(height: 15,),
                ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2, minHeight: 50),
                    child: Text('To keep lending and borrowing, enter passcode', textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16,color: kWhite, fontWeight: FontWeight.w400,),)),
                const Spacer(),
                PinCodeWidget(onChanged: (value){

                }),
                const Spacer(flex: 5,),
                ButtonWidget(
                    onPressed: (){
                      Get.to(()=> const HomeScreen());
                    }, buttonColor: kGreen,
                    buttonText: "Sign In",
                    height: 55, width: double.maxFinite
                ),
                const SizedBox(height: 37,),
                RichText(
                  text: TextSpan(text: 'Do you have an account? ', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(text: 'Sign up',style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kGreen, fontSize: 16, fontWeight: FontWeight.w700, decoration: TextDecoration.underline))
                      ]),
                ),
                const Spacer(),
              ],
            ),
          )),
    );
  }

  Widget otpTextField() {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 50,
      width: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
    );
  }
}


class OnboardingNavigation extends StatelessWidget {
  final String? text;
  final double? value;
  const OnboardingNavigation({Key? key, this.text, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          LinearProgressIndicator(
            value: value,

          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                   
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,

                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 22),
                  width: 230,
                  child: Text(
                    '$text',
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg_assets/lemon_head.svg',
                  height: 49,
                  width: 49,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

