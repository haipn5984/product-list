import 'package:flutter/material.dart';

import '../../core/constants/resources/dimens.dart';
import '../../core/constants/resources/styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.hintText = '',
    this.onChange,
    this.keyBoardType,
    this.onChangeMoney,
    this.inputStyle,
    this.inputBorder,
    this.prefix,
    this.padding,
    this.focusNode,
    this.initText,
    this.maxLength,
    this.maxLine,
    this.validator,
  });
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChange;
  final TextInputType? keyBoardType;
  final Function(double)? onChangeMoney;
  final TextStyle? inputStyle;
  final InputBorder? inputBorder;
  final Widget? prefix;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final String? initText;
  final int? maxLength;
  final int? maxLine;
  final String? Function(String? text)? validator;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.initText != null) {
      _controller.text = widget.initText ?? '';
    }
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: Dimens.d12,
            vertical: Dimens.d10,
          ),
      child: TextFormField(
        validator: widget.validator,
        textAlignVertical: TextAlignVertical.center,
        focusNode: _focusNode,
        controller: _controller,
        maxLength: widget.maxLength,
        maxLines: widget.maxLine,
        onChanged: (value) {
          widget.onChange?.call(value);
        },
        style: widget.inputStyle ?? AppTextStyle.regularText,
        keyboardType: widget.keyBoardType,
        decoration: InputDecoration(
          // border: widget.inputBorder ?? InputBorder.none,
          isDense: true,
          counterText: '',
          hintText: widget.hintText,
          hintStyle: (widget.inputStyle ?? AppTextStyle.regularText).copyWith(
            color: Colors.grey.withOpacity(0.5),
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.clear();
                      widget.onChange?.call('');
                      widget.onChangeMoney?.call(0);
                    });
                  },
                  behavior: HitTestBehavior.translucent,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.d8,
                    ),
                    child: Icon(
                      Icons.clear,
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 2,
            minHeight: 2,
          ),
          contentPadding: const EdgeInsets.only(
            left: Dimens.d8,
            right: Dimens.d8,
            bottom: Dimens.d4,
          ),
          // border: InputBorder.none,
        ),
      ),
    );
  }
}
