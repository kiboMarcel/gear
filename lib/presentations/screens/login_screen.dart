import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logics/cubits/signin/signin_cubit.dart';
import '../../utils/error_dialog.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_input_field.dart';
import '../widgets/rounded_password_filed.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final Map<String, String> _authData = {
    'username': '',
    'password': '',
  };

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();
    //print(_authData);
    context.read<SigninCubit>().signin(
        username: _authData['username']!, password: _authData['password']!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state.signstatus == SignStatus.error) {
              errorDialog(context, state.error);
            }
            if (state.signstatus == SignStatus.success) {
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Color(0xFF3B4254),
              body: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  children: [
                    SizedBox(height: 150),
                    Center(
                      child: Text(
                        'App Name',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    RoundedInputField(
                      hintText: 'Nom d\'utilisateur',
                      icon: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                      ),
                      onChanged: (value) => {
                        _authData['username'] = value.trim(),
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Veuiller renseigner un nom d\'utilisateur ';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 35),
                    RoundedPasswordFiled(
                      onChanged: (value) => {_authData['password'] = value},
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Veuillez renseigner un mot de passe';
                        }
                        if (value.trim().length < 6) {
                          return 'password doit avoir 6 caractere au minimum';
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, 'ResetPasswordScreen.id');
                        },
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        child: Text(
                          'Mot de passe ounlier ?',
                          style: TextStyle(color: Color(0xFFB81F14)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 40.0, right: 40),
                      child: state.signstatus == SignStatus.submiting
                          ? RoundedButton(
                              onPressed: null,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: CircularProgressIndicator(
                                color: Colors.purple,
                              ),
                            )
                          : RoundedButton(
                              onPressed: _submit,
                              child: Text('Se Connecter'),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
