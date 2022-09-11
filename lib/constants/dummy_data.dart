import 'package:crendly/constants/asset_path.dart';
import 'package:crendly/constants/color_palette.dart';
import 'package:crendly/shared_widgets/shared_questionnaire_screens.dart';
import 'package:crendly/src/intro_screens/widgets/custom_carousel_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  static final todayNotification = [
    {
      "title": "Loan Request has been approved",
      "msg": "Amet rhoncus habitant amet quis egestas morbi tempus. Bibendum proin facilisi mattis sem qual.",
      "btnText": "Finish Loan process",
      "time": "10 hours ago"
    },
    {
      "title": "Loan Request has been approved",
      "msg": "Amet rhoncus habitant amet quis egestas morbi tempus. Bibendum proin facilisi mattis sem qual.",
      "btnText": "Finish Loan process",
      "time": "10 hours ago"
    },
  ];

  static final yesterdayNotification = [
    {
      "title": "Loan negotiation request",
      "msg": "Et id tellus, ultrices tellus praesent tempus mauris est dolor. Feugiat porttitor nisl lorem libero blandit ut mauris amet.",
      "btnText": "View negotiation request",
      "time": "10 hours ago"
    },
    {
      "title": "Few days to Loan repayment",
      "msg": "Et id tellus, ultrices tellus praesent tempus mauris est dolor. Feugiat porttitor nisl lorem libero blandit ut mauris amet.",
      "btnText": "Topup Wallet",
      "time": "10 hours ago"
    },
    {
      "title": "Loan request from a Borrower",
      "msg": "Et id tellus, ultrices tellus praesent tempus mauris est dolor. Feugiat porttitor nisl lorem libero blandit ut mauris amet.",
      "btnText": "View Request",
      "time": "10 hours ago"
    },
  ];

  static final appMaintenanceNotification = [
    {
      "title": "Application Maintenance",
      "msg": "We are currently maintaining our app and you won’t be able to make transactions from 20 Feb 2020, 12:00am to 20 Feb 2020, 11:59pm",
      "time": "10 hours ago"
    },
    {
      "title": "Application Maintenance",
      "msg": "We are currently maintaining our app and you won’t be able to make transactions from 20 Feb 2020, 12:00am to 20 Feb 2020, 11:59pm",
      "time": "10 hours ago"
    },
    {
      "title": "Application Maintenance",
      "msg": "We are currently maintaining our app and you won’t be able to make transactions from 20 Feb 2020, 12:00am to 20 Feb 2020, 11:59pm",
      "time": "10 hours ago"
    },
  ];

  static final oldTransaction = [
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Funds Withdrawal",
      "amount": "₦70,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Funded Wallet",
      "amount": "₦750,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Credit",
      "time": "3:33pm"
    },
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
  ];

  static final List <PopupMenuItem> transactionFilterOption = [
    PopupMenuItem(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All transactions", style: TextStyle(color: kWhite, fontSize: 16)),
                Icon(Icons.check, color: kOrange,),
              ],
            ),
            Divider(color: kDivider,)
          ],
        )
    ),
    PopupMenuItem(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Loan disbursed", style: TextStyle(color: kWhite, fontSize: 16)),
                Icon(Icons.check, color: kOrange,),
              ],
            ),
            Divider(color: kDivider,)
          ],
        )
    ),
    PopupMenuItem(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Portfolio created", style: TextStyle(color: kWhite, fontSize: 16)),
                Icon(Icons.check, color: kOrange,),
              ],
            ),
            Divider(color: kDivider,)
          ],
        )
    ),
    PopupMenuItem(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Withdrawals", style: TextStyle(color: kWhite, fontSize: 16)),
                Icon(Icons.check, color: kOrange,),
              ],
            ),
            Divider(color: kDivider,)
          ],
        )
    ),
    PopupMenuItem(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TopUps", style: TextStyle(color: kWhite, fontSize: 16)),
                Icon(Icons.check, color: kOrange,),
              ],
            ),
            Divider(color: kDivider,)
          ],
        )
    )
  ];
  static final todayTransaction = [
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Funds Withdrawal",
      "amount": "₦70,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Funded Wallet",
      "amount": "₦750,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Credit",
      "time": "3:33pm"
    },
    {
      "status": "Loan Disbursed",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
    {
      "status": "Loan Repayment",
      "amount": "₦50,000",
      "date": "20 Jan 2022, 3:33 pm",
      "type": "Debit",
      "loanType": "Payday Loan",
      "time": "3:33pm"
    },
  ];

  static final crendlyOption = [
    {
      "asset": "assets/svg_assets/orange_head.svg",
      "title": "Give Loan",
      "description":
          "Invest in the needs of real people and earn interests monthly.",
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
      "amount": "N50,000",
      "percentage": "2%p.a",
      "duration": "6 Months",
      "rating": "4.7",
      "paymentType" : "Installment"
    },
    {
      "amount": "N50,000",
      "percentage": "2%p.a",
      "duration": "6 Months",
      "rating": "4.0",
      "paymentType" : "Installment"
    },
    {
      "amount": "N50,000",
      "percentage": "2%p.a",
      "duration": "6 Months",
      "rating": "4.0",
      "paymentType" : "Installment"
    },
    {
      "amount": "N50,000",
      "percentage": "2%p.a",
      "duration": "6 Months",
      "rating": "3.9",
      "paymentType" : "Installment"
    },
    {
      "amount": "N50,000",
      "percentage": "2%p.a",
      "duration": "6 Months",
      "rating": "2.1",
      "paymentType" : "Installment"
    },
  ];

  static final lenderLoans = [
    {
      "asset": "assets/png_assets/category_image1.png",
      "title": "Payday Loans",
      "description": "See borrowers requesting for payday loans \non crendly."
    },
    {
      "asset": "assets/png_assets/category_image2.png",
      "title": "Personal Loans",
      "description": "See borrowers requesting for loans to sort \npersonal business on crendly.",
    },
    {
      "asset": "assets/png_assets/category_image3.png",
      "title": "Rent Loans",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
    {
      "asset": "assets/png_assets/category_image4.png",
      "title": "Gadget Loans",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
  ];

  static final lenderLoans1 = [
    {
      "asset": "assets/png_assets/category_image5.png",
      "title": "School Fees Loan",
      "description": "See borrowers requesting for payday loans \non crendly."
    },
    {
      "asset": "assets/png_assets/category_image6.png",
      "title": "Medical Loans",
      "description": "See borrowers requesting for loans to sort \npersonal business on crendly.",
    },
    {
      "asset": "assets/png_assets/category_image7.png",
      "title": "Grants",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
    {
      "asset": "assets/png_assets/category_image8.png",
      "title": "Travel Loans",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
  ];


  static final borrowLoans = [
    {
      "asset": "assets/png_assets/borrower_1.png",
      "title": "Payday Loans",
      "description": "See borrowers requesting for payday loans \non crendly."
    },
    {
      "asset": "assets/png_assets/borrower_2.png",
      "title": "Personal Loans",
      "description": "See borrowers requesting for loans to sort \npersonal business on crendly.",
    },
    {
      "asset": "assets/png_assets/borrower_3.png",
      "title": "Rent Loans",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
    {
      "asset": "assets/png_assets/borrower_4.png",
      "title": "Gadget Loans",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
  ];

  static final loanOfferDetails = [
    {
      "loan_type": "Payday",
      "loan_amount": "₦50,000 - ₦125,000",
      "interest_rate": "3%",
      "interest_type": "Monthly",
      "loan_tenor": "180 days",
      "repayment_amount": " ₦35,000 - ₦35,500",
      "total_repayment_amount": "₦55,000 - ₦130,000",
      "repayment_type": "Installments",
      "repayment_occurance": "Installments",
      "repayment_start_date": "21 Mar 2021",
      "repayment_end_date": "21 Jun 2021",
      "negotiation": "YES",
      "loan_extension": "YES",
      "loan_extension_time": "30 days",
      "status": "Pending Approval"
    }
  ];

  static final borrowerLoans1 = [
    {
      "asset": "assets/png_assets/borrower_5.png",
      "title": "School Fees Loan",
      "description": "See borrowers requesting for payday loans \non crendly."
    },
    {
      "asset": "assets/png_assets/borrower_6.png",
      "title": "Medical Loans",
      "description": "See borrowers requesting for loans to sort \npersonal business on crendly.",
    },
    {
      "asset": "assets/png_assets/borrower_7.png",
      "title": "Grants",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
    {
      "asset": "assets/png_assets/borrower_8.png",
      "title": "Travel Loans",
      "description": "See borrowers requesting for loans for \nrent on crendly.",
    },
  ];

  static final conditions = [
    {
      "nos": "1.",
      "conditions": "Acceptance of loan offer from the lender"
    },
    {
      "nos": "2.",
      "conditions": "Receipt of the Offer Letter duly signed by the Borrower;"
    },
    {
      "nos": "3.",
      "conditions": "Receipt of the Loan Agreement duly signed by the Borrower"
    },
    {
      "nos": "4.",
      "conditions": "Payment of the upfront fee and any other applicable fee."
    }
  ];

  static final requestReceived = [
    {
      "titleName": "Loan request From",
      "body": "You have 59 minutes and 23 seconds to attend to this loan request. Please try to attend to this request as soon as possible.",
      "date": "21/02/2021 3:45pm",
      "time": "00:59:23",
      "timeout": false,
    },
    {
      "titleName": "Loan request From",
      "body": "You have 59 minutes and 23 seconds to attend to this loan request. Please try to attend to this request as soon as possible.",
      "date": "21/02/2021 3:45pm",
      "time": "00:30:23",
      "timeout": false,
    },
    {
      "titleName": "Loan request From",
      "body": "You have 59 minutes and 23 seconds to attend to this loan request. Please try to attend to this request as soon as possible.",
      "date": "21/02/2021 3:45pm",
      "time": "00:30:23",
      "timeout": false,
    },
    {
      "titleName": "Loan request From",
      "body": "You have 59 minutes and 23 seconds to attend to this loan request. Please try to attend to this request as soon as possible.",
      "date": "21/02/2021 3:45pm",
      "time":"00:9:23",
      "timeout": true,
    },
  ];


  static final offerRequests = [
    {
      "title": "You showed interesting in a Loan offer",
      "body": "You showed interest in this loan offer. Offer will expire if no action is taken on your request.",
      "date": "21/02/2021 3:45pm",
      "action": "Pending Approval",
    },
    {
      "title": "You showed interesting in a Loan offer",
      "body": "You showed interest in this loan offer. Offer will expire if no action is taken on your request.",
      "date": "21/02/2021 3:45pm",
      "action": "Pending Approval",
    },
    {
      "title": "You showed interesting in a Loan offer",
      "body": "You showed interest in this loan offer. Offer will expire if no action is taken on your request.",
      "date": "21/02/2021 3:45pm",
      "action": "Pending Approval",
    },
    {
      "title": "You showed interesting in a Loan offer",
      "body": "You showed interest in this loan offer. Offer will expire if no action is taken on your request.",
      "date": "21/02/2021 3:45pm",
      "action": "Pending Approval",
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

  static final portfolioGraphs = [
    AssetPath.portfolioBarChart,
    AssetPath.portfolioLineGraph
  ];

}



