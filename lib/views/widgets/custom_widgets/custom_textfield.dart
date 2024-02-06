import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    TextEditingController? controller,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.hint = '',
    this.color,
    this.contentPadding,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.showSuffixIcon = true,
    this.suffixIcon,
    this.readOnly = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.border,
    this.starticon,
    this.prefixICon,
    this.boardercolor,
    this.hintColor,
    this.isBorder,
    this.startetWidget,
    this.borderRadius,
    this.startIconWithDivider = false,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController? _controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final bool showSuffixIcon;
  final Widget? suffixIcon;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Color? color;
  final Color? boardercolor;
  final String? initialValue;
  final String? hint;
  final bool readOnly;
  final bool autoFocus;
  final TextAlign textAlign;
  final InputBorder? border;
  final Icon? prefixICon;
  final TextStyle? style;
  final IconData? starticon;
  final Color? hintColor;
  final bool? isBorder;
  final bool? startIconWithDivider;
  final String? startetWidget;
  final BorderRadiusGeometry? borderRadius;
  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListen() => setState(() {});

  @override
  void initState() {
    widget._controller!.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller!.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding:
      widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        color: widget.color ?? Theme.of(context).secondaryHeaderColor,
        border: Border.all(color: widget.boardercolor ?? Colors.transparent),
      ),
      child: TextFormField(
        initialValue: widget.initialValue,
        controller: widget._controller,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType == TextInputType.number
            ? const TextInputType.numberWithOptions(signed: true, decimal: true)
            : widget.maxLines! > 1
            ? TextInputType.multiline
            : widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.maxLines! > 1
            ? TextInputAction.newline
            : widget.textInputAction ?? TextInputAction.next,
        autofocus: widget.autoFocus,
        textAlign: widget.textAlign,
        onChanged: widget.onChanged,
        minLines: widget.minLines,
        maxLines: (widget._controller!.text.isEmpty) ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        style: widget.style,
        validator: widget.validator == null
            ? null
            : (String? value) => widget.validator!(value),
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          fillColor: widget.color ??
              Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
          hintText: widget.hint,
          hintStyle: widget.hint!.length > 15
              ? GoogleFonts.inter(
              fontSize: 14, color: widget.hintColor ?? Colors.black)
              : GoogleFonts.inter(
              fontSize: 15, color: widget.hintColor ?? Colors.black),
          suffixIcon: (widget.suffixIcon != null)
              ? widget.suffixIcon
              : (widget._controller!.text.isEmpty ||
              !widget.showSuffixIcon ||
              widget.showSuffixIcon == false)
              ? null
              : IconButton(
            splashRadius: 16,
            onPressed: () => setState(() {
              widget._controller!.clear();
            }),
            icon: Icon(
              CupertinoIcons.clear,
              size: 18,
              color: Theme.of(context).splashColor,
            ),
          ),
          prefixIcon: widget.starticon == null
              ? widget.startetWidget == null
              ? null
              : widget.startIconWithDivider == false
              ? SizedBox(
            height: 25,
            width: 25,
            child: Image.asset(widget.startetWidget!),
          )
              : SizedBox(
            width: 40,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(widget.startetWidget!),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          )
              : widget.startIconWithDivider == false
              ? Icon(
            widget.starticon,
            color: Colors.grey,
          )
              : SizedBox(
            width: 40,
            child: Row(
              children: <Widget>[
                Icon(
                  widget.starticon,
                  color: Theme.of(context).splashColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Theme.of(context).splashColor,
                ),
              ],
            ),
          ),
          focusColor: Theme.of(context).primaryColor,
          border: widget.border ?? InputBorder.none,
        ),
      ),
    );
  }
}
