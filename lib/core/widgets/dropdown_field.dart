import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tayseer/core/utils/size_config.dart';

Widget dropdownField({
  required String title,
  required String? value,
  required String hint,
  required List<String> items,
  required ValueChanged<String?> onChanged,
  required BuildContext context
}) {
 SizeConfig.init(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style:   TextStyle(fontSize: 14.h, fontWeight: FontWeight.w400),
      ),
        SizedBox(height: 8.h),
      Container(
        padding:   EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color:   const Color(0xFFE3E5E5),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: DropdownButton<String>(
          value: value,
          
          hint: Text(
            hint,
            style:   TextStyle(color: Colors.grey,fontSize: 14.h),
          ),
          icon: SvgPicture.asset(
            'assets/icons/arrow_down.svg',
            width: 20.w,
            height: 20.h,
            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null,
            fit: BoxFit.contain,
          ),
          iconSize: 24.h,
          elevation: 16,
          style:   TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white :Colors.black,fontSize: 14),
          underline: Container(height: 0),
          isExpanded: true,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ],
  );
}