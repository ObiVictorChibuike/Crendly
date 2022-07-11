import 'dart:convert';
import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/src/intro_screens/widgets/custom_carousel_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DummyData {
  DummyData._();

  static final optionButton = [
    {
      "asset": "assets/svg_assets/orange_head.svg",
      "title": "Give Loan",
      "description": "Finance the needs of real people and earn.",
      "color": orangeGradient,
    },
    {
      "asset": "assets/svg_assets/melon_head.svg",
      "title": "Take Loan",
      "description": "Get support for what you need at an incredible speed. ",
      "color": greenGradient
    },
  ];

  static final signUpOptions = [
    {
      "asset": "assets/svg_assets/orange_head.svg",
      "title": "Individual",
      "description": "Invest in the needs of real people and earn interests monthly.",
      "color": orangeGradient,
    },
    {
      "asset": "assets/svg_assets/melon_head.svg",
      "title": "Business",
      "description": "Get money for what you need at an incredible speed. ",
      "color": greenGradient
    },
  ];

  static final browseOptions = [
    {
      "asset": "assets/png_assets/category_image1.png",
      "description": "Quick Loans to take care of your needs",
    },
    {
    "asset": "assets/png_assets/category_image2.png",
      "description": "Loan you can repay in no time.",
    },
    {
      "asset": "assets/png_assets/category_image3.png",
      "description": "Best Loan rate offerings",
    },
    {
      "asset": "assets/png_assets/category_image4.png",
      "description": "Easy Loan Repayments",
    },
  ];

  static final rowButtonIcon = [
    {
      "icon": const Icon(Icons.add, color: kWhite, size: 28,),
      "Text": "Top-Up"
    },
    {
      "icon": const Icon(Icons.print_outlined, color: kWhite, size: 28,),
      "Text": "Withdraw"
    },
    {
      "icon": const Icon(Icons.more_horiz, color: kWhite, size: 28,),
      "Text": "More"
    }
  ];
  static final achievementDetails = [
    {
      "title": "32,000",
      "subTitle": "Users",
    },
    {
      "title": "15,000",
      "subTitle": "Loans",
    },
    {
      "title": "₦78M",
      "subTitle": "In Loans",
    },
    {
      "title": "99%",
      "subTitle": "Repayment rate",
    },
  ];

  static final  stackImages = [
    "assets/png_assets/orange_head.png",
    "assets/png_assets/melon_head.png",
    "assets/png_assets/orange_head.png",
    "assets/png_assets/melon_head.png",
    "assets/png_assets/orange_head.png",
  ];

  static final List<Widget> onBoardingViews = [
    const CarouselPage(
      image: AssetPath.onBoardingImage1,
      firstText: 'A place for ',
      secondText: 'social lending',
      thirdText: 'A Platform where real people can lend money to real people',
    ),
    const CarouselPage(
        image: AssetPath.onBoardingImage2,
        firstText: 'We turn up ',
        secondText: 'safety',
        thirdText: 'You worked hard for your money.Crendly makes it come back with you for more'
    ),
    const CarouselPage(
        image: AssetPath.onBoardingImage3,
        firstText: 'You\'re in ',
        secondText: 'control',
        thirdText: 'Control your profit on what you lend out'
    ),
  ];

  static final crendlyCommunity = [
    {
      "asset": "assets/png_assets/community_image1.png",
      "title": "Looking for ways to cut your monthly spend? ",
      "buttonLabel": "Stories"
    },
    {
      "asset": "assets/png_assets/community_image2.png",
      "title": "Not sure how to travel for summer?",
      "buttonLabel": "Guide"
    },
    {
      "asset": "assets/png_assets/community_image3.png",
      "title": "Proofing her business idea with Crendly",
      "buttonLabel": "Interview"
    },
  ];


  static final reportDataList = [
    ReportData(
        reportText: "Vital Signs", reportData: ReportDataIndex.vitalSigns),
    ReportData(
        reportText: "Medical Conditions",
        reportData: ReportDataIndex.medicalConditions),
    ReportData(
        reportText: "Pregnancy Details",
        reportData: ReportDataIndex.pregnancyDetails),
    ReportData(
        reportText: "Routine Investigations",
        reportData: ReportDataIndex.routineInvestigations),
    ReportData(
        reportText: "Medications", reportData: ReportDataIndex.medications),
    ReportData(
        reportText: "Follow-up Appointment",
        reportData: ReportDataIndex.followUpAppointment),
    ReportData(
        reportText: "Doctor’s Comment",
        reportData: ReportDataIndex.doctorComment),
  ];
}

enum ReportDataIndex {
  vitalSigns,
  medicalConditions,
  pregnancyDetails,
  routineInvestigations,
  medications,
  followUpAppointment,
  doctorComment
}

class ReportData {
  String reportText;
  ReportDataIndex reportData;

  ReportData({required this.reportText, required this.reportData});
}
class BabiesRedAlertModel{
  BabiesRedAlertModel({required this.alertType, required this.alertDesc});

  String alertType;
  String alertDesc;
  bool selected = false;
}

class PregnancyRedAlertModel{
  PregnancyRedAlertModel({required this.alertType, required this.alertDesc});

  String alertType;
  String alertDesc;
  bool selected = false;
}