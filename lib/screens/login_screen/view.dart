import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_prototype/const/colors.dart';
import '../../const/size.dart';
import '../../widgets/submit_button.dart';
import '../../widgets/text_field.dart';
import '../signup_screen/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState>_formKey= GlobalKey<FormState>();
  //final SetData _userData = SetData();
  String? email, passwordUser;
  var checkbox1 = false;

  void checkBoxChange(bool? val) {
    setState(() {
      checkbox1 = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //logo
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: width(context, 2.0),
                    height: height(context, 3.5),
                    child: Image.asset("images/logo.png")),
                //email text field
                SizedBox(
                  height: height(context, 15),
                ),
                CustomTextField(
                  hint: 'Email',
                  icon: Icons.person,
                  secure: false,
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return 'please enter your email ';
                    }
                    return null;
                  },
                  onChange: (val) {
                    email = val;
                  },
                ),
                CustomTextField(
                  hint: 'Password',
                  icon: Icons.lock,
                  secure: false,
                  validator: (val) {
                    if (val
                        .toString()
                        .isEmpty) {
                      return 'please enter your password ';
                    }
                    return null;
                  },
                  onChange: (val) {
                    passwordUser = val;
                  },
                ),
                //password text field
                //remember checkbox and forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: checkbox1,
                              onChanged: checkBoxChange,
                              checkColor: lightPurpule,
                              activeColor: white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.5))),
                          const Text(
                            "Remember me",
                            style: TextStyle(fontSize: 15, color: lightPurpule),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: lightPurpule),
                        ),
                      ),
                    ],
                  ),
                ),
                //login button
                const SizedBox(
                  height: 10,
                ),
                SubmitButton(
                    text: 'Login',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        /**_userData.getData(emailUser: email!,
                            passwordUser: passwordUser!,
                            context: context);**/
                      }
                      // Navigator.push(context,
                      //     MaterialPageRoute(
                      //         builder: (_) => const Instructions()));
                    }),
                SizedBox(
                  width: width(context, 1.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: darkPurpule,
                          child: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: darkPurpule,
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            color: white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.facebook_sharp,
                          color: darkPurpule,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //to sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: GoogleFonts.cairo(
                            fontSize: 16,
                            color: lightPurpule,
                            fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const SignUpScreen())),
                      child: Text(" sign up",
                          style: GoogleFonts.cairo(
                              fontSize: 15,
                              color: darkPurpule,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}


