import 'package:crendly/src/dashboard/nav_bar_screen_item/transaction_section/widget/transaction_detail_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/asset_path.dart';
import '../../../../../constants/color_palette.dart';
import '../../../../../shared_widgets/custom_appBar.dart';

class TransactionDetails extends StatefulWidget {
  final transaction;
  const TransactionDetails({Key? key, this.transaction}) : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          backgroundColor: kDarkBackGroundColor,
          appBar: CustomAppbar(centerTitle: true,
            appBarLabel:   Text("Transaction Details", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: kWhite, fontWeight: FontWeight.w700, fontSize: 24),),
            onBackPressed: (){
              Get.back();
            },
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              CircleAvatar(backgroundColor: kBlue, radius: 30,
                child: SvgPicture.asset(widget.transaction["status"] == "Loan Disbursed"? AssetPath.loanDisbursed :
                widget.transaction["status"] == "Funds Withdrawal" ? AssetPath.fundsWithdrawal :
                widget.transaction["status"] == "Funded Wallet" ? AssetPath.fundedWallet :
                widget.transaction["status"] == "Loan Repayment" ? AssetPath.loanRepayment : ""),
              ),
              const SizedBox(height: 30,),
              TransactionDetailWidget(
                transactionType: widget.transaction["status"],
                loanType: widget.transaction["loanType"] == null ? "" : widget.transaction["loanType"],
                amount: widget.transaction["amount"],
                time: widget.transaction["time"],
                date: widget.transaction["date"],
                status: widget.transaction["type"],
              )
            ],
          ),
        )
    );
  }
}
