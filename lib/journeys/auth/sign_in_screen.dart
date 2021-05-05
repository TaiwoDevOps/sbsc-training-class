import 'package:flutter/material.dart';
import 'package:my_flutter_project/constants/sizes.dart';
import 'package:my_flutter_project/theme/my_colors.dart';
import 'package:my_flutter_project/utils/validator.dart';
import 'package:my_flutter_project/widgets/my_input_field_widget.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
//Text controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //bool value for show or don't show icon
  bool emailVal = false;
  bool passWVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_40),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              SizedBox(height: Sizes.dimen_70),
              Text(
                "WELCOME BACK",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: Sizes.dimen_24),

              //Email Text form field
              MyInputFormFieldWidget(
                inputText: email,
                showIcon: emailVal,
                textInputType: TextInputType.emailAddress,
                hintText: 'Email Address',
                onChanged: (val) {
                  String res = Validator().validateEmail(val);
                  if (res == null) {
                    setState(() {
                      emailVal = true;
                    });
                  } else {
                    setState(() {
                      emailVal = false;
                    });
                  }
                },
              ),
              SizedBox(height: Sizes.dimen_20),
              //Password Text form field
              MyInputFormFieldWidget(
                inputText: password,
                showIcon: passWVal,
                textInputType: TextInputType.text,
                hintText: 'Password',
                obSecure: true,
                onChanged: (val) {
                  String res = Validator().validatePassword(val);
                  if (res == null) {
                    setState(() {
                      passWVal = true;
                    });
                  } else {
                    setState(() {
                      passWVal = false;
                    });
                  }
                },
              ),
              SizedBox(height: Sizes.dimen_40),

//Button for Sign in
              InkWell(
                onTap: emailVal
                    ? () {
                        print("You want top submit your fomr ???");
                      }
                    : null,
                splashColor: whiteColor.withOpacity(0.4),
                child: Container(
                  height: Sizes.dimen_60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: emailVal ? btnColor : btnColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Sizes.dimen_8),
                  ),
                  child: Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              SizedBox(height: Sizes.dimen_30),

//RichText
              RichText(
                text: TextSpan(
                    text: "Forgot Password?\n",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(fontSize: Sizes.dimen_10),
                    children: [
                      TextSpan(
                        text: "Reset Password",
                        style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: Sizes.dimen_10,
                              fontFamily: 'Raleway',
                              color: btnColor,
                            ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
