import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/shared_questionnaire_screens.dart';
import 'package:crendly/src/intro_screens/widgets/custom_carousel_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      "description":
          "Invest in the needs of real people and earn interests monthly.",
      "color": orangeGradient,
    },
    {
      "asset": "assets/svg_assets/melon_head.svg",
      "title": "Business",
      "description": "Get money for what you need at an incredible speed. ",
      "color": greenGradient
    },
  ];

  static final userData = [];
  static final myLoan = [];

  static final oldTransaction = [
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Funds Withdrawal",
      "amount": "₦70,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Funded Wallet",
      "amount": "₦750,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Credit"
    },
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
  ];
  static final todayTransaction = [
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Funds Withdrawal",
      "amount": "₦70,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Funded Wallet",
      "amount": "₦750,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Credit"
    },
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit"
    },
  ];

  static final crendlyOption = [
    {
      "asset": "assets/svg_assets/orange_head.svg",
      "title": "Give Loan",
      "description": "Invest in the needs of real people and earn interests monthly.",
      "color": orangeGradient,
    },
    {
      "asset": "assets/svg_assets/melon_head.svg",
      "title": "Collect Loan",
      "description": "Get money for what you need at an incredible speed. ",
      "color": greenGradient
    },
  ];

  static final selectedLoanDetails = [
    {
      "requestAvailable": "100",
      "loanRange": "₦0 - ₦50,000",
      "date": "Requests 12th Feburary, 2022",
      "amount": "N30,000"
    },
    {
      "requestAvailable": "112",
      "loanRange": "₦50,001 - ₦100,000",
      "date": "Requests 12th Feburary, 2022",
      "amount": "N70,000"
    },
    {
      "requestAvailable": "75",
      "loanRange": "₦100,001 - ₦200,000",
      "date": "Requests 12th Feburary, 2022",
      "amount": "N10,000"
    },
    {
      "requestAvailable": "20",
      "loanRange": "₦200,001 - ₦400,000",
      "date": "Requests 12th Feburary, 2022",
      "amount": "N50,000"
    },
    {
      "requestAvailable": "100",
      "loanRange": "₦400,001 - ₦800,000",
      "date": "Requests 12th Feburary, 2022",
      "amount": "N20,000"
    },
    {
      "requestAvailable": "7",
      "loanRange": "₦800,001 - ₦1,000,000",
      "date": "Requests 12th Feburary, 2022",
      "amount": "N270,000"
    },
    {
      "requestAvailable": "Gadget Loans",
      "loanRange": "₦800,001 - ₦1,000,000",
      "date": "Requests 12th Feburary, 2022",
      "amount": "N200,000"
    },
  ];

  static final quickLoan = [
    {
      "title": "Payday Loans",
      "description": "Nibh cursus eget laoreet in. In justo, cras blandit etiam amet in.",
    },
    {
      "title": "Personal Loans",
      "description": "Nibh cursus eget laoreet in. In justo, cras blandit etiam amet in.",
    },
    {
      "title": "Travel Loans",
      "description": "Nibh cursus eget laoreet in. In justo, cras blandit etiam amet in.",
    },
    {
      "title": "Gadget Loans",
      "description": "Nibh cursus eget laoreet in. In justo, cras blandit etiam amet in.",
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
      "icon": const Icon(
        Icons.add,
        color: kWhite,
        size: 28,
      ),
      "Text": "Top-Up"
    },
    {
      "icon": const Icon(
        Icons.print_outlined,
        color: kWhite,
        size: 28,
      ),
      "Text": "Withdraw"
    },
    {
      "icon": const Icon(
        Icons.more_horiz,
        color: kWhite,
        size: 28,
      ),
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

  static final quickMenu = [
    {
      "title": "Calculator",
      "image": Icons.calculate_outlined,
    },
    {
      "title": "Bank",
      "image": Icons.account_balance_outlined,
    },
    {
      "title": "Cards",
      "image": Icons.credit_card,
    },
    {
      "title": "Statements",
      "image": Icons.feed_outlined,
    },
    {
      "title": "Invite",
      "image": Icons.groups,
    },
    {
      "title": "Support",
      "image": Icons.headset_mic_outlined,
    },
    {
      "title": "Settings",
      "image": Icons.feed_outlined,
    },
  ];

  static final stackImages = [
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
        thirdText:
            'You worked hard for your money.Crendly makes it come back with you for more'),
    const CarouselPage(
        image: AssetPath.onBoardingImage3,
        firstText: 'You\'re in ',
        secondText: 'control',
        thirdText: 'Control your profit on what you lend out'),
  ];

  List<String> trustQuestionsOptions = [
    "Never",
    "Rarely",
    "Sometimes",
    "Often",
    "Always"
  ];
  static final List<Widget> trustQuestionsViews = [
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "People tell me they understand me",
      questionNumber: 1,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question:
          "I empathize with others a lot and I find it easy letting them know",
      questionNumber: 2,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "I enjoy getting the things I want",
      questionNumber: 3,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "People see me as an honest and passionate communicator",
      questionNumber: 4,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "I am quick to praise people",
      questionNumber: 5,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "People say that I'm predictable and consistent",
      questionNumber: 6,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "People easily confide in me",
      questionNumber: 7,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "In interactions with others, I lead with curiosity",
      questionNumber: 8,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "I an not ashamed to say I don't know",
      questionNumber: 9,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "People say that I am dependable",
      questionNumber: 10,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "I am really good at what I do",
      questionNumber: 11,
      totalNumberOfQuestions: 12,
    ),
    SharedQuestionnaire(
      options: DummyData._().trustQuestionsOptions,
      question: "I care less about others",
      questionNumber: 12,
      totalNumberOfQuestions: 12,
    ),
  ];

  static final List<Widget> personalityQuestionsViews = [
    SharedQuestionnaire(
      options: ["calm, quiet and reserved", "friendly, talkative and outgoing"],
      question: "What do people mostly think of you?",
      questionNumber: 1,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Drained and tired even if I had fun",
        "Pumped and can't wait to do it again"
      ],
      question: "How do you feel after a night out",
      questionNumber: 2,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: ["Can't listen enough because you're tired", "Hear them out"],
      question: "You're busy after your nights out nd someone is telling you their life story",
      questionNumber: 3,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: ["You and friends on an enjoyment tour", "Round the city"],
      question: "Pick your typical  night out",
      questionNumber: 4,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "I'm speaking my mind on the spot",
        "Need to process before confronting"
      ],
      question:
          "You just had a disagreement with someone. What's your first reaction?",
      questionNumber: 5,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "No. School is all theories and no practical.",
        "Yes. It’s very important & helpful."
      ],
      question: "If you had the power, would school exist?",
      questionNumber: 1,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Getting things done",
        "Thinking of solutions"
      ],
      question: "You have one choice in an exam. Which would you say you're better at?",
      questionNumber: 2,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Do things one after the other.",
        "Start big, fills in the details later"
      ],
      question: "If you had lots of tasks to do today, how would you begin?",
      questionNumber: 3,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: ["Results. I believe in what I see.", "Process. I believe the results will roll in."],
      question: "What keeps you going in work and life?",
      questionNumber: 4,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Not really. Things change, that’s life.",
        "Absolutely"
      ],
      question: "Can you think of one life goal you will never compromise on?",
      questionNumber: 5,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Look for logical explanations or solutions.",
        "Express what is important at the moment"
      ],
      question: "What’s the key to giving great advice to your friend?",
      questionNumber: 1,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: ["Head, of course.", "Heart wins."],
      question: "In making decisions, which do you go with?Your head or your heart?",
      questionNumber: 2,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Nope. I always follow the standard.",
        "Of course. I adjust to make people happy."
      ],
      question: "Are rules meant to be broken?",
      questionNumber: 3,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "The task-oriented working from an outline",
        "The task oriented who goes with the flow"
      ],
      question: "In your opinion who will win in a competition?",
      questionNumber: 4,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Analyze to make logical decisions.",
        "Consider others points-of-view "
      ],
      question: "Before you make decisions, you?",
      questionNumber: 5,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Detailed, organised & proper planner",
        "Flexible and spontaneous"
      ],
      question: "Which best describes you",
      questionNumber: 1,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Spend time thinking through my decision",
        "Jump to my decisions"
      ],
      question: "How quick do you make decisions?",
      questionNumber: 2,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Proactive – I like to plan ahead",
        "Reactive – We cross when we get there."
      ],
      question: "How do you approach challenges?",
      questionNumber: 3,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "I get work done before a deadline.",
        "Stimulated by an approaching deadline."
      ],
      question: "What's your second superpower?",
      questionNumber: 4,
      totalNumberOfQuestions: 5,
    ),
    SharedQuestionnaire(
      options: [
        "Get my work done before taking a break",
        "Listen to music, work, take small breaks"
      ],
      question: "What’s your routine like, when you’re working",
      questionNumber: 5,
      totalNumberOfQuestions: 5,
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

class BabiesRedAlertModel {
  BabiesRedAlertModel({required this.alertType, required this.alertDesc});

  String alertType;
  String alertDesc;
  bool selected = false;
}

class PregnancyRedAlertModel {
  PregnancyRedAlertModel({required this.alertType, required this.alertDesc});

  String alertType;
  String alertDesc;
  bool selected = false;
}
