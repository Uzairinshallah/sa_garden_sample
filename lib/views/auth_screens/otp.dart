import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../res/functions/constant.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_textfield.dart';


class RegisterThree extends StatelessWidget {
  final String email; // Add this

  RegisterThree({super.key, required this.email}); // Modify the constructor
  final TextEditingController _otp = TextEditingController();


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
              CustomTextFormField(controller: _otp, hint: "ENTER OTP", keyboardType: TextInputType.number, maxLength: 8),

              getSpace(h: 30),
          CustomElevatedButton(
            title: 'Verify',
            onTap: () async {
              // Call the OTP verification API
              // You need to implement this method in your AuthProvider
              bool success = await Provider.of<AuthProvider>(context, listen: false)
                  .verifyOTP(email: email, otp: _otp.text);

              if (success) {
                // OTP verified, navigate to the next screen or show success message
              } else {
                // Show error message
              }
            },
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),

              getSpace(h: 20),
            ],
          ),
        ),
      ),
    );
  }
}
