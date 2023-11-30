import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sign/screens/home_screen.dart';
import 'package:sign/util/input_validation.dart';
import 'package:sign/util/string_constant.dart';
import 'package:sign/widget/inherited_widget.dart';

import 'package:sign/widget/text_field.dart';

class LoginPage extends StatefulWidget {
  final ValueChanged<String>? onSubmit;
  const LoginPage({super.key, this.onSubmit});

  @override
  State<LoginPage> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // final String _name = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool? isNameValid = true;
  bool? isEmailValid = true;
  bool? isPhoneNoValid = true;
  bool? isPasswordValid = true;
  bool? isConfirmPassValid = true;
  bool? isChecked = false;
  bool? isFillColor = false;
  bool passVisible = false;
  bool confirmPassVisible = false;
  @override
  void initState() {
    debugPrint('==Init State==');

    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint('==didChange State==');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LoginPage oldWidget) {
    debugPrint('++++++Widget Updated++++++++++');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    debugPrint("dispose");
    log("message");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: formBuild(context),
    );
  }

  Form formBuild(BuildContext context) {
    return Form(
      key: _formKey,
      child: listViewBuild(context),
    );
  }

  ListView listViewBuild(BuildContext context) {
    return ListView(children: [
      Container(
        // width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),

        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              StringConstant.signIn,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            sizedBoxBuild(),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.blue,
              child: const Text(
                StringConstant.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            sizedBoxBuild(),
            nameTextFieldWidget(),
            isNameValid == false
                ? const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      StringConstant.nameMessage,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            sizedBoxBuild(),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringConstant.email,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            sizedBoxBuild(),
            emailTextFieldWidget(),
            const SizedBox(height: 10),
            isEmailValid == false
                ? const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      StringConstant.emailMessage,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            sizedBoxBuild(),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringConstant.phoneNo,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            sizedBoxBuild(),
            phoneNoTextFieldWidget(),
            isPhoneNoValid == false
                ? const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      StringConstant.phoneNoMessage,
                      style:  TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            sizedBoxBuild(),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                StringConstant.password,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            sizedBoxBuild(),
            passwordTextFieldWidget(),
            const SizedBox(height: 10),
            isPasswordValid == false
                ? const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      StringConstant.passwordMessage,
                      style:  TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringConstant.confirmPass,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            sizedBoxBuild(),
            confirmPassTextFieldWidget(),
            isConfirmPassValid == false
                ? const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      StringConstant.confirmPassMessage,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            sizedBoxBuild(),
            Container(
                alignment: Alignment.bottomRight,
                child: const Text(
                  StringConstant.forgetPass,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
            checkBoxContainer(),
            buildButton(context),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '-OR-',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sign in with',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                facebookElevatedButton(),
                const SizedBox(
                  width: 40,
                ),
                googleElevatedButton(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have a Account? ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            myInheritedWidgetDemo(),
          ],
        ),
      ),
    ]);
  }

  SizedBox sizedBoxBuild() {
    return const SizedBox(
      height: 10,
    );
  }

  MyInheritedWidget myInheritedWidgetDemo() {
    return MyInheritedWidget(
      message: 'Hellloooo',
      child: Builder(builder: (BuildContext innerContext) {
        return Center(
          child: Text(
            MyInheritedWidget.of(innerContext).message,
            style: const TextStyle(color: Colors.amber),
          ),
        );
      }),
    );
  }

  ElevatedButton googleElevatedButton() {
    return ElevatedButton(
      onPressed: null,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          elevation: MaterialStatePropertyAll(15),
          shadowColor: MaterialStatePropertyAll(Colors.black),
          shape: MaterialStatePropertyAll(CircleBorder())),
      child: Image.network(
        'https://www.freepnglogos.com/uploads/google-favicon-logo-20.png',
        height: 60,
        width: 60,
      ),
    );
  }

  ElevatedButton facebookElevatedButton() {
    return ElevatedButton(
      onPressed: null,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          elevation: MaterialStatePropertyAll(15),
          shadowColor: MaterialStatePropertyAll(Colors.black),
          shape: MaterialStatePropertyAll(CircleBorder())),
      child: Image.network(
        'https://www.freepnglogos.com/uploads/aqua-blue-f-facebook-logo-png-22.png',
        height: 60,
        width: 60,
      ),
    );
  }

  Container checkBoxContainer() {
    return Container(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Checkbox(
              fillColor: isFillColor == true
                  ? const MaterialStatePropertyAll(Colors.white)
                  : const MaterialStatePropertyAll(Colors.blue),
              checkColor: Colors.blue,
              overlayColor: const MaterialStatePropertyAll(Colors.white),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                  isFillColor = value ?? false;
                });
              },
              side: const BorderSide(color: Colors.white, width: 2),
            ),
            const Text(
              'Remember me',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  TextFieldWidget confirmPassTextFieldWidget() {
    return TextFieldWidget(
      onhideShowButton: () {
        setState(() {
          confirmPassVisible = !confirmPassVisible;
        });
      },
      suffixImages:
          confirmPassVisible == true ? Icons.visibility : Icons.visibility_off,
      errorColor:
          isConfirmPassValid == true ? Colors.transparent : Colors.amber,
      focusedBorder:
          isConfirmPassValid == true ? Colors.transparent : Colors.amber,
      hinttext: StringConstant.hintConfirmPass,
      images: Icons.lock,
      obscuretext: !confirmPassVisible,
      controller: confirmPassController,
      onChange: (val) {
        if (!InputValidation.isConfirmPassValid(val)) {
          setState(() {
            isConfirmPassValid = false;
          });
        } else {
          setState(() {
            isConfirmPassValid = true;
          });
        }

        return true;
      },
    );
  }

  TextFieldWidget passwordTextFieldWidget() {
    return TextFieldWidget(
      onhideShowButton: () {
        setState(() {
          passVisible = !passVisible;
        });
      },
      suffixImages:
          passVisible == true ? Icons.visibility : Icons.visibility_off,
      errorColor: isPasswordValid == true ? Colors.transparent : Colors.amber,
      focusedBorder:
          isPasswordValid == true ? Colors.transparent : Colors.amber,
      controller: passController,
      onChange: (val) {
        if (!InputValidation.isPasswordValid(val)) {
          setState(() {
            isPasswordValid = false;
            debugPrint('isPasswordValid in if is $isPasswordValid');
          });
        } else {
          setState(() {
            isPasswordValid = true;
            debugPrint('isPasswordValid in if is $isPasswordValid');
          });
        }
      },
      obscuretext: !passVisible,
      hinttext: StringConstant.hintPass,
      images: (Icons.lock),
    );
  }

  TextFieldWidget phoneNoTextFieldWidget() {
    return TextFieldWidget(
      errorColor: isPhoneNoValid == true ? Colors.transparent : Colors.amber,
      focusedBorder: isPhoneNoValid == true ? Colors.transparent : Colors.amber,
      hinttext: StringConstant.hintPhoneNo,
      images: Icons.phone,
      obscuretext: false,
      controller: phoneNoController,
      onChange: (val) {
        if (!InputValidation.isPhoneNoValid(val)) {
          setState(() {
            isPhoneNoValid = false;
          });
        } else {
          setState(() {
            isPhoneNoValid = true;
          });
        }
      },
    );
  }

  TextFieldWidget emailTextFieldWidget() {
    return TextFieldWidget(
        errorColor: isEmailValid == true ? Colors.transparent : Colors.amber,
        focusedBorder: isEmailValid == true ? Colors.transparent : Colors.amber,
        controller: emailController,
        onChange: (val) {
          if (!InputValidation.isEmailValid(val)) {
            setState(() {
              isEmailValid = false;
              debugPrint('isEmailValid in if is $isEmailValid');
            });
          } else {
            setState(() {
              isEmailValid = true;
              debugPrint('isEmailvalid in if is $isEmailValid');
            });
          }
        },
        obscuretext: false,
        hinttext: StringConstant.hintEmail,
        images: (Icons.mail));
  }

  TextFieldWidget nameTextFieldWidget() {
    return TextFieldWidget(
      hinttext: StringConstant.hintName,
      images: Icons.abc_outlined,
      obscuretext: false,
      controller: nameController,
      errorColor: isNameValid == true ? Colors.transparent : Colors.amber,
      focusedBorder: isNameValid == true ? Colors.transparent : Colors.amber,
      onChange: (val) {
        if (!InputValidation.isNameValid(val)) {
          setState(() {
            isNameValid = false;
          });
        } else {
          setState(() {
            isNameValid = true;
          });
        }
      },
    );
  }

  Widget buildButton(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          elevation: MaterialStatePropertyAll(10),
          padding:
              MaterialStatePropertyAll(EdgeInsets.fromLTRB(140, 10, 140, 10)),
          shadowColor: MaterialStatePropertyAll(Colors.black)),
      onPressed: () {
        if (emailController.text.toString().isEmpty) {
          setState(() {
            isEmailValid = false;
          });
        }
        if (passController.text.toString().isEmpty) {
          setState(() {
            isPasswordValid = false;
          });
        }
        if (nameController.text.toString().isEmpty) {
          setState(() {
            isNameValid = false;
          });
        }
        if (phoneNoController.text.toString().isEmpty) {
          setState(() {
            isPhoneNoValid = false;
          });
        }

        if (confirmPassController.text.toString().isEmpty) {
          setState(() {
            isConfirmPassValid = false;
          });
        }
        if (passController.text.toString() !=
            confirmPassController.text.toString()) {
          setState(() {
            isConfirmPassValid = false;
            // isPasswordValid=false;
          });
        } else if (isPasswordValid == true &&
            isEmailValid == true &&
            isNameValid == true &&
            isPhoneNoValid == true &&
            isConfirmPassValid == true &&
            isChecked == true) {
          debugPrint("is password value $isPasswordValid");
          debugPrint('is email value $isEmailValid');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                'Signing In',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )));

          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const HomeScreen())));
        }
      },
      child: const Text(
        'LOGIN',
        style: TextStyle(
            color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
