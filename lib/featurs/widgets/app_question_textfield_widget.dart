import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';

import '../../core/colors.dart';

var _borderTextFiled =
    ({Color color = ColorsManager.borderTextFieldColor}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: BorderSide(
          color: color,
          width: 4.sp,
        ));

class AppQuestionTextfieldWidget extends StatefulWidget {
  AppQuestionTextfieldWidget({
    Key? key,
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
    this.showSendButton = false,
    this.maxLine = 1,
    this.minLine = 1,
    // this.hintColor = ColorManager.hintTextColor,
    // this.textColor = ColorManager.blackColor,
    this.filteringTextFormatterList,
    this.iconDataImage,
    this.onFieldSubmitted,
    this.onTapSendButton,
  }) : super(key: key);

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
  bool showSendButton;
  bool isMultiLine;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onTapSendButton;
  final int? maxLine;
  final int? minLine;
  final List<FilteringTextInputFormatter>? filteringTextFormatterList;

  @override
  State<AppQuestionTextfieldWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppQuestionTextfieldWidget> {
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
      onFieldSubmitted: widget.onFieldSubmitted,
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
      style: TextStyle(color: ColorsManager.whiteColor),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      cursorColor: ColorsManager.whiteColor,
      decoration: InputDecoration(
        focusedBorder: _borderTextFiled(color: ColorsManager.transparentColor),
        border: _borderTextFiled(color: ColorsManager.transparentColor),
        enabledBorder: _borderTextFiled(color: ColorsManager.transparentColor),
        errorBorder: _borderTextFiled(color: ColorsManager.transparentColor),
        focusedErrorBorder:
            _borderTextFiled(color: ColorsManager.transparentColor),
        // iconColor: ColorManager.grayColor,
        filled: true,

        fillColor: ColorsManager.backgroundQuestionTextFiledColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 14.sp, color: ColorsManager.whiteColor),
        errorMaxLines: 2,
        prefixIcon: widget.iconData == null
            ? null
            : AppPaddingWidget(
                horizontalPadding: 10.w,
                verticalPadding: 10.h,
                child: Image.asset(
                  widget.iconData!,
                  width: 10.sp,
                  height: 10.sp,
                ),
              ),
        suffixIcon: widget.showSendButton
            ? IconButton(
            onPressed: widget.onTapSendButton,
            icon: Image.asset(
              AssetsManager.sendIconIMG,
              width: 28.sp,
              height: 28.sp,

            ))
            : null,
      ),
    );
  }
}
