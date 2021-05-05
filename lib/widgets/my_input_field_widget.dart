import 'package:flutter/material.dart';
import 'package:my_flutter_project/constants/sizes.dart';
import 'package:my_flutter_project/theme/my_colors.dart';

class MyInputFormFieldWidget extends StatefulWidget {
  // set/get
  const MyInputFormFieldWidget({
    Key key,
    @required this.inputText,
    @required this.showIcon,
    @required this.onChanged,
    @required this.textInputType,
    this.obSecure = false,
    this.hintText,
  }) : super(key: key);

  final TextEditingController inputText;
  final Function(String) onChanged;
  final bool showIcon;
  final TextInputType textInputType;
  final String hintText;
  final bool obSecure;

  @override
  _MyInputFormFieldWidgetState createState() => _MyInputFormFieldWidgetState();
}

class _MyInputFormFieldWidgetState extends State<MyInputFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputText,
      keyboardType: widget.textInputType,
      style: Theme.of(context).textTheme.bodyText1,
      onChanged: widget.onChanged,
      // validator: Validator().validateEmail,
      obscureText: widget.obSecure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        fillColor: whiteColor,
        filled: true,
        suffixIcon: widget.showIcon
            ? Icon(Icons.check_circle, color: btnColor)
            : SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_8),
          borderSide: BorderSide(
            color: Color(0xFFB5B5B6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_8),
          borderSide: BorderSide(
            color: Color(0xFFB5B5B6),
          ),
        ),
      ),
    );
  }
}
