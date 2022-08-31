import 'package:flutter/material.dart';
import '../../../../../constants/color_palette.dart';

class TransactionDetailWidget extends StatelessWidget {
  final String? transactionType;
  final String? loanType;
  final String? amount;
  final String? date;
  final String? time;
  final String? status;
  const TransactionDetailWidget({Key? key, this.transactionType, this.loanType, this.amount, this.date, this.time, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.maxFinite, height: MediaQuery.of(context).size.height / 2.8,
         decoration: BoxDecoration(color: kLightBackGroundColor, borderRadius: BorderRadius.circular(12)), padding: EdgeInsets.all(20),
         child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const SizedBox(height: 20,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Transaction Type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                 Text(transactionType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
               ],
             ),
             loanType!.isEmpty ? const SizedBox() : const SizedBox(height: 10,),
             loanType!.isEmpty ? const SizedBox() : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Loan type", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                 Text(loanType!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
               ],
             ),
             const SizedBox(height: 10,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Amount", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                 Text(amount!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
               ],
             ),
             const SizedBox(height: 10,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Date", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                 Text(date!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
               ],
             ),
             const SizedBox(height: 10,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Time", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                 Text(time!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.w700),)
               ],
             ),
             const SizedBox(height: 10,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Status", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhite, fontSize: 16),),
                 Text(status!, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: status == "Debit" ? Color(0xffFF0062) : status == "Credit" ?
                 kGreen : null , fontSize: 16, fontWeight: FontWeight.w700),)
               ],
             ),
             const SizedBox(height: 20,),
             const Divider(color: kLightPurple,)
           ],
         ),
      ),
    );
  }
}
