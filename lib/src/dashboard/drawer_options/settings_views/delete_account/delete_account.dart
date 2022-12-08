import 'package:crendly/app/constants/asset_path.dart';
import 'package:crendly/app/constants/color_palette.dart';
import 'package:crendly/app/shared_widgets/customButton.dart';
import 'package:crendly/app/shared_widgets/custom_appBar.dart';
import 'package:crendly/app/shared_widgets/custom_dialog_widget.dart';
import 'package:crendly/app/shared_widgets/custom_form_field_widget.dart';
import 'package:crendly/src/dashboard/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  String? selectedOption;
  List<String> deleteOptions = [
    "I have issues with the platform",
    "Loans are hard to get here",
    "I want to erase my data",
    "I am not using it",
    "Others"
  ];
  showDeleteOptionDialog() {
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height / 2.5,
        MediaQuery.of(context).size.width / 1.3, [
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  ...List.generate(
                    deleteOptions.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedOption = deleteOptions[index];
                            Get.back();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(deleteOptions[index], style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400, fontSize: 16),),
                                  selectedOption == deleteOptions[index]
                                      ? const Icon(
                                          Icons.check,
                                          size: 12,
                                          color: kOrange,
                                        )
                                      : const SizedBox()
                                ],
                              ),
                              const Divider(
                                color: kLighterBackGroundColor,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ]),
          ),
        ),
      )
    ]);
  }


  showAccountNotDeletedDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /2, 1.2, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            Align(alignment: Alignment.centerRight,
              child: IconButton(onPressed: (){
                Get.back();
              },
                  icon: Icon(Icons.clear, color: kOrange,)),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(height: 70, width: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.warning_rounded, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("You can not delete your account at the moment", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("'You have an outstanding loan. You need to repay this before you can proceed with our account deletion.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            ),
            const SizedBox(height: 63,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal:54.0),
                child: InkWell(
                  onTap: (){
                    Get.offAll(()=> const BottomNavigationBarScreen());
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text("Ok", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kDarkBackGroundColor, fontSize: 16, fontWeight: FontWeight.w700),),
                    ),
                  ),
                )
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  showAccountDeletedDialog(){
    MyDialog().showMyDialog(context, MediaQuery.of(context).size.height /1.35, 0.0, [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.centerRight,
              child: IconButton(onPressed: (){
                Get.back();
              },
                  icon: Icon(Icons.clear, color: kOrange,)),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(height: 70, width: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kGreen, width: 2), color: const Color(0xff081952)),
                child: const Center(child: Icon(Icons.delete, color: kOrange, size: 45,)),
              ),
            ),
            Container(height: 45, width:2, color: kGreen,),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("You have requested that your account be deleted.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kOrange, fontWeight: FontWeight.w700, fontSize: 20),),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Your request to delete your account has been "
                  "received. Due to regulations, this may take "
                  "about Fourteen (14) days before all your data "
                  "will be deleted completely.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            ),
            const SizedBox(height: 58,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(" If you wish to hold off deleting your account, "
                  "please contact support on customercare@crendly.com or "
                  "0901234567 for assistance. Thank you for choosing Crendly.", textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w400,fontSize: 16),),
            ),
            const SizedBox(height: 46,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:54.0),
              child: InkWell(
                onTap: (){
                  Get.offAll(()=> const BottomNavigationBarScreen());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text("Ok", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kDarkBackGroundColor, fontSize: 16, fontWeight: FontWeight.w700),),
                  ),
                ),
              )
            ),
            const Spacer(flex: 2,),
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    void deleteAccountBottomSheet(context) {
      Get.bottomSheet(
          FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
                decoration: BoxDecoration(
                    color: kLightBackGroundColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.8,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: StatefulBuilder(builder: (context, mySetState) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(
                                            Icons.clear,
                                            color: kOrange,
                                            size: 25,
                                          )),
                                    ),
                                    Text(
                                      "Delete  My Account",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: kWhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 263, height: 65,
                                      child: Text("Are you sure you want to delete your account?", textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xffE2E2E2), fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 263, height: 65,
                                      child: Text("Please note that this process not reversible", textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xffE2E2E2), fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    ButtonWidget(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      buttonText: "No, Keep Account",
                                      height: 50, width: 347,
                                      buttonTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: kDarkBackGroundColor, fontSize: 16, fontWeight: FontWeight.bold,),
                                      buttonColor: kGreen,
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                        showAccountDeletedDialog();
                                      },
                                      child: Text("Yes, Delete Account", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kDarkRed, fontSize: 16, fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ],
                  );
                })),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          isScrollControlled: true,
          isDismissible: false);
    }



    return Scaffold(
      backgroundColor: kDarkBackGroundColor,
      appBar: CustomAppbar(
        centerTitle: true,
        appBarLabel: Text(
          "Delete My Account",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
        ),
        decorationImagePath: AssetPath.fullTag,
        onBackPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 26,
            ),
            Text("Why do you want to delete your account?", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: kWhite),),
            const SizedBox(
              height: 27,
            ),
            Container(
              height: 50, width: double.maxFinite,
              decoration: BoxDecoration(border: Border.all(color: kWhite, width: 0.7), borderRadius: BorderRadius.circular(8)),
              child: TextButton(style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
                onPressed: () {
                  showDeleteOptionDialog();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedOption ?? "Select an option",
                      style: TextStyle(
                          color: selectedOption == null
                              ? kWhiteWithOpacity
                              : kWhite,
                          fontSize: 18),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: kWhite),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            selectedOption == "Others"
                ? FormFieldWidget(
                    height: 170,
                    expands: false,
                    hintText: "State your reason",
                    maxLines: 20,
                  )
                : Text(
                  "Viverra amet adipiscing magnis in duis orci. Amet maecenas habitasse nunc etiam pellentesque."
                      " Duis volutpat tortor nisl orci mauris viverra sed id mauris. Arcu cursus nec diam quam "
                      "mauris quis. Velit magna sit euismod sit id interdum proin in fusce.  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: kWhite, fontSize: 14),
                ),
            const SizedBox(
              height: 43,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  deleteAccountBottomSheet(context);
                },
                child: Text(
                  "Delete My Account",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kRed, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
