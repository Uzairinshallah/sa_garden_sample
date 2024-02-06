import 'package:flutter/material.dart';
import 'package:sa_garden_sample/views/auth_screens/register_two.dart';

import '../../res/functions/constant.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_textfield.dart';


class RegisterOne extends StatelessWidget {
  RegisterOne({super.key});
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();


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
              CustomTextFormField(controller: _fName, hint: "First Name"),
              getSpace(h: 15),
              CustomTextFormField(controller: _lName, hint: "Last Name"),
              getSpace(h: 15),
              CustomTextFormField(controller: _phoneNo, hint: "Phone Number", keyboardType: TextInputType.number,),
              getSpace(h: 15),
              CustomTextFormField(controller: _email, hint: "Email"),
              getSpace(h: 30),
              CustomElevatedButton(
                title: 'Next',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterTwo(fName: _fName.text,
                    lName: _lName.text,
                    phoneNo: _phoneNo.text,
                    email: _email.text,),),);
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
