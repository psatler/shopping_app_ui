import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for the LengthLimitingTextInputFormatter

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

// issue with backspace of keyboard: https://github.com/flutter/flutter/issues/14809
// a package that could so this: https://pub.dev/packages/pin_code_text_field
// and perhaps changing the textfield value: https://stackoverflow.com/questions/51127241/how-do-you-change-the-value-inside-of-a-textfield-flutter

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin1FocusNode;
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  final pin1Controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();

    pin1Controller.dispose();

    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    // automatically focus next field when current field has a value inserted in
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  focusNode: pin1FocusNode,
                  // showCursor: false,
                  // textInputAction: TextInputAction.next,
                  controller: pin1Controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    debugPrint("value 1 $value");
                    nextField(value: value, focusNode: pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  // textInputAction: TextInputAction.previous,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onTap: () {
                    print("tapped");
                  },
                  onChanged: (value) {
                    debugPrint("value 2 $value");

                    nextField(value: value, focusNode: pin3FocusNode);

                    if (value.length < 1) {
                      pin1FocusNode.requestFocus();
                    } else {
                      nextField(value: value, focusNode: pin3FocusNode);
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    debugPrint("value 3 $value");

                    if (value.length < 1) {
                      pin2FocusNode.requestFocus();
                    } else {
                      nextField(value: value, focusNode: pin4FocusNode);
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    debugPrint("value 4 $value");
                    debugPrint("value 4 ${value.length}");

                    if (value.length < 1) {
                      pin3FocusNode.requestFocus();
                      // FocusScope.of(context).requestFocus(pin3FocusNode);
                    } else {
                      pin4FocusNode.unfocus();
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          DefaultButton(
            text: "Continue",
            press: () {},
          ),
        ],
      ),
    );
  }
}
