import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../res/functions/constant.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_textfield.dart';
import '../widgets/custom_widgets/password_textfield.dart';
import 'otp.dart';


class RegisterTwo extends StatelessWidget {
  final String fName;
  final String lName;
  final String phoneNo;
  final String email;
  RegisterTwo({super.key, required this.fName, required this.lName, required this.phoneNo, required this.email});
  final TextEditingController _cnic = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _cPass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              getSpace(h: getMobileMaxheight(context) * .2),
              const Image(
                  image: AssetImage('assets/images/sa_garden.png'),
                  fit: BoxFit.contain,
                  height: 80),
              getSpace(h: getMobileMaxheight(context) * .06),
              CustomTextFormField(controller: _cnic, hint: "Enter your CNIC"),
              getSpace(h: 15),
              PasswordTextFormField(
                controller: _pass,
              ),
              getSpace(h: 15),
              PasswordTextFormField(
                controller: _cPass,
                hint: "Confirm Password",
              ),
              getSpace(h: 30),
              CustomElevatedButton(
                title: 'Next',
                onTap: () async {
                  String responseMessage = await Provider.of<AuthProvider>(context, listen: false).register(
                    firstName: fName,
                    lastName: lName,
                    mobileNumber: phoneNo,
                    email: email,
                    cnic: _cnic.text,
                    password: _pass.text,
                    privacyPolicy: true, // Assuming you have user's consent
                  );

                  // Handle the response based on the message
                  if (responseMessage == "OTPsent") {
                    // Navigate to OTP screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterThree(email: email)),
                    );
                  } else {
                    // Display the error message
                    // You can use a Snackbar, AlertDialog, or another method
                    print('Registration failed: $responseMessage');
                  }
                },
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
              ),


              getSpace(h: 20),
            ],
          ),
        ),
      ),
    );
  }
}
