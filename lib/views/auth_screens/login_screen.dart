import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sa_garden_sample/provider/auth_provider.dart';
import 'package:sa_garden_sample/views/auth_screens/resgister_one.dart';
import '../../repositories/api_services.dart';
import '../../res/functions/constant.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_textfield.dart';
import '../widgets/custom_widgets/password_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  ApiService apiService = ApiService();
  late AuthProvider authPro;
  @override
  Widget build(BuildContext context) {
    authPro =  Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
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
              CustomTextFormField(controller: _email, hint: "Email"),
              getSpace(h: 15),
              PasswordTextFormField(
                controller: _password,
              ),
              getSpace(h: 15),
              CustomElevatedButton(
                title: 'Login',
                onTap: () async {
                  if(_email.text.trim() == "" || _password.text.trim() == ""){
                    Constants.showSnackBar(context, "All fields are required");
                  }
                  authPro.login(context, _email.text, _password.text);
                },
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              getSpace(h: getMobileMaxheight(context) * .03),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(color: Colors.grey),
                  children: <TextSpan>[
                    const TextSpan(text: '''Don't Have Any Account? '''),
                    TextSpan(
                      text: "SIGN UP",
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterOne(),),);
                      },
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
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
