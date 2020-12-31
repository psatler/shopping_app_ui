import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(
            errors: errors,
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // go to OTP (one time password) screen
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Text(
            "By continuing your confirm that you agree \nwith our Terms and Conditions",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          removeError(error: kAddressNullError);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          addError(error: kAddressNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        // the majority of the input decoration comes from what's defined in the theme
        labelText: "Address",
        hintText: "Enter your address",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Location point.svg",
        ),
        errorStyle: TextStyle(height: 0),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          removeError(error: kPhoneNumberNullError);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          addError(error: kPhoneNumberNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        // the majority of the input decoration comes from what's defined in the theme
        labelText: "Phone number",
        hintText: "Enter your phone number",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
        errorStyle: TextStyle(height: 0),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          removeError(error: kLastNamelNullError);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          addError(error: kLastNamelNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        // the majority of the input decoration comes from what's defined in the theme
        labelText: "Last name",
        hintText: "Enter your last name",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
        errorStyle: TextStyle(height: 0),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          removeError(error: kNamelNullError);
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          // update state and add error to the list of errors if such error is not in the list yet
          addError(error: kNamelNullError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        // the majority of the input decoration comes from what's defined in the theme
        labelText: "First name",
        hintText: "Enter your first name",
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
        errorStyle: TextStyle(height: 0),
      ),
    );
  }
}
