import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/strings.dart';

import '../../core/colors.dart';

var _borderTextFiled = ({Color color = ColorsManager.borderTextFieldColor}) =>
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: color, width: 1.sp));

class AppTextFieldProfileWidget extends StatefulWidget {
  AppTextFieldProfileWidget(
      {Key? key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.iconData,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.autofocus = false,
      this.readOnly = false,
      this.isMultiLine = false,
      this.maxLine = 1,
      this.minLine = 1,
      // this.hintColor = ColorManager.hintTextColor,
      // this.textColor = ColorManager.blackColor,
      this.filteringTextFormatterList,
      this.iconDataImage})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? iconData;
  final String? iconDataImage;
  final String? hintText;

  // final Color? hintColor;
  // final Color? textColor;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  bool isMultiLine;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxLine;
  final int? minLine;
  final List<FilteringTextInputFormatter>? filteringTextFormatterList;

  @override
  State<AppTextFieldProfileWidget> createState() => _AppTextFieldProfileWidgetState();
}

class _AppTextFieldProfileWidgetState extends State<AppTextFieldProfileWidget> {
  void showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onTapOutside: (v) {
        _focusNode.unfocus();
      },
      inputFormatters: widget.filteringTextFormatterList,
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
          (String? val) {
            if (val!.trim().isEmpty) return Strings.requiredFieldText;
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      cursorColor: ColorsManager.blackColor,
      decoration: InputDecoration(
        focusedBorder: _borderTextFiled(),
        border: _borderTextFiled(color: ColorsManager.borderTextFieldColor),
        enabledBorder:
            _borderTextFiled(color: ColorsManager.borderTextFieldColor),
        errorBorder: _borderTextFiled(color: ColorsManager.errorColor),
        focusedErrorBorder: _borderTextFiled(color: ColorsManager.errorColor),
        // iconColor: ColorManager.grayColor,
        filled: true,
        fillColor: ColorsManager.whiteColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: ColorsManager.hintTextFieldColor
        ),
        errorMaxLines: 2,
        suffixIcon: widget.suffixIcon
            ? IconButton(
                onPressed: () {
                  showPassword();
                },
                icon: Icon(
                  !widget.obscureText
                      ? Icons.remove_red_eye
                      : Icons.visibility_off_sharp,
                  // color: ColorManager.hintTextColor,
                ))
            : null,
      ),
    );
  }
}
