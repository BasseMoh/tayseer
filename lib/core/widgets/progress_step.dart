import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tayseer/core/utils/size_config.dart';

class ProgressStep extends StatelessWidget {
  final String title;
  final bool isLast;

  const ProgressStep({super.key, required this.title, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final words = title.split(' '); // Split title into words
    SizeConfig.init(context);
    return IntrinsicWidth(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/tick_circle_icon.svg',
                height: 22.h,
                width: 22.w,
              ),
              // Text label - each word in separate line
              Padding(
                padding:   EdgeInsets.only(top: 4.h),
                child: Column(
                  children:
                      words
                          .map(
                            (word) => Text(
                              word,
                              textAlign: TextAlign.center,
                              style:   TextStyle(
                                fontSize: 11.h,
                                height: 1.4,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
          if (!isLast) ...[
            Expanded(
              child: Padding(
                padding:   EdgeInsets.only(top: 10.h,),
                child: Container(
                  width: 35.w,
                  height: 2.h,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
