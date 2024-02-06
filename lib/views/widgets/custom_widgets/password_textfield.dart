import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    required TextEditingController controller,
    this.headerText,
    this.textInputAction = TextInputAction.done,
    this.hint = 'Password',
    this.style,
    this.gradientBorder,
    this.hStyle,
    this.color,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  final String hint;
  final String? headerText;
  final TextStyle? style;
  final bool? gradientBorder;
  final TextStyle? hStyle;
  final TextInputAction? textInputAction;
  final Color? color;

  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _notVisible = true;

  void _onListener() => setState(() {});

  @override
  void initState() {
    widget._controller.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.headerText != null)
            ? Text(
          widget.headerText ?? "",
          style: GoogleFonts.inter(
              color: Theme.of(context).splashColor, fontSize: 18),
        )
            : const SizedBox(),
        SizedBox(
          height: (widget.headerText != null) ? 5 : 0,
        ),
        Container(
          decoration: (widget.gradientBorder == true)
              ? BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(11.8)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.transparent,
                    Colors.grey.withOpacity(.4),
                    Colors.grey.withOpacity(.4),
                  ]))
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1.4),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.color ?? Theme.of(context).secondaryHeaderColor,
              border: Border.all(color: Colors.grey.withOpacity(.1)),
            ),
            child: TextFormField(
              controller: widget._controller,
              obscureText: _notVisible,
              style: widget.style,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: widget.textInputAction,
              cursorColor: Theme.of(context).colorScheme.secondary,
              // validator: (String? value) => CustomValidator.password(value),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: widget.hStyle,
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _notVisible = !_notVisible;
                  }),
                  splashRadius: 16,
                  icon: (_notVisible == true)
                      ? Icon(
                    CupertinoIcons.eye,
                    color: Theme.of(context).splashColor,
                    size: 38,
                  )
                      : Icon(
                    CupertinoIcons.eye_slash,
                    color: Theme.of(context).splashColor,
                    size: 38,
                  ),
                ),
                focusColor: Theme.of(context).primaryColor,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
