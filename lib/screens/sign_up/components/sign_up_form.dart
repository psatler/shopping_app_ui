import 'package:flutter/material.dart';
import 'package:shopping_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../size_config.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../constants.dart';

// fixing error styles height
// removing error height: https://stackoverflow.com/questions/56426262/how-to-remove-error-message-in-textformfield-in-flutter/60208333#60208333
// adding helperText: https://github.com/flutter/flutter/issues/15400#issuecomment-475773473

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String confirmPassword;

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
          buildEmailField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // go to complete profile page
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        confirmPassword = value;

        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }

        return null;
      },
      validator: (value) {
        if (confirmPassword != password) {
          addError(error: kMatchPassError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        // helperText: " ",
        errorStyle: TextStyle(height: 0),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }

        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }

        password = value;

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          // if regex doesn't match with a valid email, add to error's list
          addError(error: kShortPassError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        // helperText: " ",
        errorStyle: TextStyle(height: 0),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
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
        // helperText: " ",
        errorStyle: TextStyle(height: 0),
      ),
    );
  }
}
