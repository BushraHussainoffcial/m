import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import '../../core/strings.dart';
import 'general_dialog_shape_widget.dart';




class ConstantsWidgets {

  static circularProgress()  {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
    static showLoading() async {
    return
    //   showDialog(
    //       context: context,
    //       barrierDismissible: false, // Prevents dialog from being dismissed by tapping outside
    //       builder: (BuildContext context) {
    //   return PopScope(
    //     canPop:true
    //     ,
    //     child: Center(
    //       child: Container(
    //         width: 80,
    //         height: 80,
    //         padding: const EdgeInsets.all(10.0),
    //         decoration: BoxDecoration(
    //           color: ColorsManager.whiteColor,
    //           borderRadius: BorderRadius.circular(8.0),
    //         ),
    //         child:
    //
    //         Center(
    //             child:  CircularProgressIndicator(
    //               color: ColorsManager.primaryColor,
    //             )),
    //       ),
    //     ),
    //   );});



      await Get.dialog(
        PopScope(
          canPop:true
          ,
          child:
          GeneralDialogShapeWidget()??
          Center(
            child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: ColorsManager.whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:

              Center(
                  child:  CircularProgressIndicator(
                    color: ColorsManager.primaryColor,
                  )),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }

  static closeDialog() async {
    Get.close(1);
    // context.pop();

  }
  static showProgress(double progress)  {
    return
      // await Get.dialog(
      PopScope(
        canPop:true
        ,
        child: Center(
          child: Container(
             width: 100,
             height: 100,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child:  CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    )),
                SizedBox(height:10.h,),
                Text('${(progress*100).toInt()}%',style: TextStyle(fontSize: 14,
                    // color:
                // ColorsManager.textFieldColor
                ),)
              ],
            ),
          ),
        ),
      );
    //   barrierDismissible: false,
    // );
  }
  static TOAST(BuildContext? context, {String? title,String textToast = "This Is Toast",bool? state}) {
    title??=state==null?Strings.message_success:state?Strings.message_success:Strings.message_failure;
    Get.snackbar(title, textToast,
        backgroundColor: state==null?null:state?ColorsManager.successColor:ColorsManager.errorColor,
        colorText:  ColorsManager.whiteColor);
    // showToast(
    //     textToast,
    //     context: context,
    //     animation: StyledToastAnimation.fadeScale,
    //     position: StyledToastPosition.top,
    //     textStyle: TextStyle(color: ColorsManager.whiteColor)
    // );
  }

  static emptyWidget(context,{text='No Data Yet!'})=>Center(
    child: Text(text,style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.06,
        fontWeight: FontWeight.bold
    ),),
  );
}
