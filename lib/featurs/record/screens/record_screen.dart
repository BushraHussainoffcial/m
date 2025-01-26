import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/constants.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/core/theme_manager.dart';

import '../widgets/record_item_widget.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        title: Text(
          Strings.logText,
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context,index)=>RecordItemWidget(
            title: Constants.recordItems[index].title,
            date: Constants.recordItems[index].date,
          ),
          itemCount: Constants.recordItems.length
      ),
    );
  }
}
