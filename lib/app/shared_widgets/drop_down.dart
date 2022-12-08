import 'package:crendly/app/constants/color_palette.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropList extends StatefulWidget {
  DropList(
      {Key? key,
        required this.valueName,
        required this.iterable,
        this.leading,
        this.onChanged,
        this.label,
        required this.hintText,
        this.validator,
        this.errorMessage,
        this.prefixIcon,
        this.suffixIcon,
        this.obscureText,
        this.controller,
        this.inputFormatters,
        this.textCapitalization})
      : super(key: key);

  final TextEditingController? valueName;
  final List iterable;
  final String? label;
  final Widget? leading;
  final Function? onChanged;
  final String hintText;
  final String? Function(String?)? validator;
  final String? Function()? errorMessage;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  @override
  State<DropList> createState() => _DropListState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('label', label));
    properties
        .add(ObjectFlagProperty<String? Function()>.has('error', errorMessage));
    properties.add(
      IterableProperty<TextInputFormatter>(
        'inputFormatters',
        inputFormatters,
      ),
    );
    properties.add(StringProperty('hintText', hintText));
  }
}

class _DropListState extends State<DropList> {

  String? valueN;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18, color: kWhite,),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: kWhite,),
          selectedItemHighlightColor: Colors.transparent,
          buttonHeight: 53,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kLightBackGroundColor,
            border: Border.all(color: kWhite),
          ),
          dropdownMaxHeight: 200,
          dropdownWidth: MediaQuery.of(context).size.width * 0.8,
          buttonDecoration: BoxDecoration(
            // color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: kWhite
            ),
          ),
          value: valueN,
          onChanged: (value) {
            widget.onChanged != null ? widget.onChanged!(value) : null;
            setState(() {
              valueN = value.toString();
              widget.valueName!.text = valueN!;
            });
          },
          hint: Text(
            "${widget.hintText}",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: const Color(0xff868484), fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          isExpanded: true,
          items: widget.iterable
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              "${item[0].toUpperCase() + item.substring(1)}",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18, color: kWhite,),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}
