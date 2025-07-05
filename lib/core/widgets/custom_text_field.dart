import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tayseer/core/utils/size_config.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isRTL;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool isOptional;  

  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.isRTL,
    this.errorText,
    this.onChanged,
    this.isOptional = false,  
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _hasFocus = false;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
   SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (widget.isOptional) ...[
                SizedBox(width: 6.w),
              Text(
                AppLocalizations.of(context)!.optional,
                style: TextStyle(
                  fontSize: 12.h,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]
          ],
        ),
          SizedBox(height: 8.h),
        FocusScope(
          child: Focus(
            onFocusChange: (focused) {
              setState(() => _hasFocus = focused);
            },
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? _obscureText : false,
              keyboardType: widget.keyboardType,
              
              style:   TextStyle(fontSize: 14.h),
              textAlign: widget.isRTL ? TextAlign.right : TextAlign.left,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: widget.hintText,
                contentPadding:   EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: hasError ? Colors.red : const Color(0xFFE3E5E5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: hasError ? Colors.red : const Color(0xFFE3E5E5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: hasError ? Colors.red : theme.primaryColor,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          !_obscureText ? Icons.visibility : Icons.visibility_off,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                        onPressed: () {
                          setState(() => _obscureText = !_obscureText);
                        },
                      )
                    : null,
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding:   EdgeInsets.only(top: 4.h, left: 16.w),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
