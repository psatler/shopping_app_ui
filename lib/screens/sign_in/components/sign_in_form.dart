import 'package:flutter/material.dart';
import 'package:shopping_app/screens/login_success/login_success_screen.dart';

import '../../../screens/forgot_password/forgot_password_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/form_error.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String email;
  String password;
  bool remember = false;

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          // SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () {
              // TODO: form is not validation after pressing continue two times in a row without filling out textfields with text

              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                // if all are valid, then go to the success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          // if regex doesn't match with a valid email, add to error's list
          removeError(error: kPassNullError);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          // if regex doesn't match with a valid email, add to error's list
          addError(error: kPassNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        errorStyle: TextStyle(height: 0),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kEmailNullError);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          // if regex doesn't match with a valid email, add to error's list
          addError(error: kEmailNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        // the majority of the input decoration comes from what's defined in the theme
        labelText: "Email",
        hintText: "Enter your email",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
        errorStyle: TextStyle(height: 0),
      ),
    );
  }
}
