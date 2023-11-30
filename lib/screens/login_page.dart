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
  String nameMessage = 'Please Enter Your Name';
  String emailMessage = 'Please Enter Your Email';
  String phoneNoMessage = 'Please Enter Your PhoneNo';
  String passwordMessage = 'Please Enter Your Password';
  String confirmPassMessage = 'Please Enter Same Password';

  bool? isNameValid = true;
  bool? isEmailValid = true;
  bool? isPhoneNoValid = true;
  bool? isPasswordValid = true;
  bool? isConfirmPassValid = true;

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
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),

            color: Colors.blue,
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
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  hinttext: StringConstant.hintName,
                  images: Icons.abc_outlined,
                  obscuretext: false,
                  controller: nameController,
                  errorColor:
                      isNameValid == true ? Colors.transparent : Colors.amber,
                  focusedBorder:
                      isNameValid == true ? Colors.transparent : Colors.amber,
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
                ),
                isNameValid == false
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          nameMessage,
                          style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    errorColor: isEmailValid == true
                        ? Colors.transparent
                        : Colors.amber,
                    focusedBorder: isEmailValid == true
                        ? Colors.transparent
                        : Colors.amber,
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
                    images: (Icons.mail)),
                const SizedBox(height: 10),
                isEmailValid == false
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          emailMessage,
                          style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  errorColor: isPhoneNoValid == true
                      ? Colors.transparent
                      : Colors.amber,
                  focusedBorder: isPhoneNoValid == true
                      ? Colors.transparent
                      : Colors.amber,
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
                ),
                isPhoneNoValid == false
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          phoneNoMessage,
                          style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  errorColor: isPasswordValid == true
                      ? Colors.transparent
                      : Colors.amber,
                  focusedBorder: isPasswordValid == true
                      ? Colors.transparent
                      : Colors.amber,
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
                  obscuretext: true,
                  hinttext: StringConstant.hintPass,
                  images: (Icons.lock),
                ),
                const SizedBox(height: 10),
                isPasswordValid == false
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          passwordMessage,
                          style: const TextStyle(
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
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  errorColor: isConfirmPassValid == true
                      ? Colors.transparent
                      : Colors.amber,
                  focusedBorder: isConfirmPassValid == true
                      ? Colors.transparent
                      : Colors.amber,
                  hinttext: StringConstant.hintConfirmPass,
                  images: Icons.lock,
                  obscuretext: true,
                  controller: confirmPassController,
                  onChange: (val) {
                    if (!InputValidation.isConfirmPassValid(val)) {
                      setState(() {
                        isConfirmPassValid = false;
                      });
                    } else if (passController.text != val) {
                      isConfirmPassValid = false;
                    }
                    return true;
                  },
                ),
                isConfirmPassValid == false
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          confirmPassMessage,
                          style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 15),
                Container(
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      StringConstant.forgetPass,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    child: const Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: null,
                          side: BorderSide(color: Colors.white, width: 2),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
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
                    ElevatedButton(
                      onPressed: null,
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          elevation: MaterialStatePropertyAll(15),
                          shadowColor: MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(CircleBorder())),
                      child: Image.network(
                        'https://www.freepnglogos.com/uploads/aqua-blue-f-facebook-logo-png-22.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: null,
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          elevation: MaterialStatePropertyAll(15),
                          shadowColor: MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(CircleBorder())),
                      child: Image.network(
                        'https://www.freepnglogos.com/uploads/google-favicon-logo-20.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
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
                MyInheritedWidget(
                  message: 'Hellloooo',
                  child: Builder(builder: (BuildContext innerContext) {
                    return Center(
                      child: Text(
                        MyInheritedWidget.of(innerContext).message,
                        style: const TextStyle(color: Colors.amber),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ]),
      ),
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
        } else if (isPasswordValid == true &&
            isEmailValid == true &&
            isNameValid == true &&
            isPhoneNoValid == true &&
            isConfirmPassValid == true) {
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



// const MyCustomForm(),
                // Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 30),
                //     child: Material(
                //       elevation: 20,
                //       shadowColor: Colors.black,
                //       child: TextField(
                //         style: const TextStyle(color: Colors.white),
                //         obscureText: true,
                //         decoration: InputDecoration(
                //           prefixIcon: const Icon(
                //             Icons.lock,
                //           ),
                //           prefixIconColor: Colors.white,
                //           hintText: 'Enter Your Password',
                //           hintStyle: const TextStyle(color: Colors.white),
                //           filled: true,
                //           fillColor: Colors.blue,
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(0),
                //               borderSide: BorderSide.none),
                //         ),
                //       ),
                //     )),
                // Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 30),
                //     child: Material(
                //       elevation: 20,
                //       shadowColor: Colors.black,

                //       child: TextField(
                //         style: const TextStyle(color: Colors.white),
                //         decoration: InputDecoration(
                //             prefixIcon: const Icon(Icons.mail),
                //             prefixIconColor: Colors.white,
                //             hintText: 'Enter Your Mail',
                //             hintStyle: const TextStyle(color: Colors.white),
                //             fillColor: Colors.blue,
                //             filled: true,
                //             border: OutlineInputBorder(
                //                  borderRadius: BorderRadius.circular(0),
                //                 borderSide: BorderSide.none)),
                //       ),
                //     )),
                // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please Enter Email id';
                    //   }
                    //   if (value.length < 4) {
                    //     return 'Too Short';
                    //   }
                    //   if (!value.contains('@')) {
                    //     return '@ is required';
                    //   }
                    //   return null;
                    // },
                     // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some value';
                  //   }
                  //   if (value.length < 4) {
                  //     return 'Too Short';
                  //   }
                  //   return null;
                  // },
                 

