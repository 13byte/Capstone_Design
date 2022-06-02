import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authentication = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String userId = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Image.asset('asset/img/howon.png'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                    //color: Colors.black,
                    child: Column(
                      children: [
                        Text('자리예약 로그인'),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  key: ValueKey(1),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userId = value!;
                                  },
                                  onChanged: (value) {
                                    userId = value;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.school_outlined,
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: '사번 / 학번',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                                SizedBox(height: 8.0),
                                TextFormField(
                                  obscureText: true,
                                  key: ValueKey(2),
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.school_outlined,
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: '비밀번호',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: PRIMARY_COLOR,
                            ),
                            onPressed: () async {
                              _tryValidation();
                              print(
                                  'userId : ${userId + '@aaa.com'}, userPassword : $userPassword');
                              try {
                                final newUser = await _authentication
                                    .signInWithEmailAndPassword(
                                  email: userId + '@aaa.com',
                                  password: userPassword,
                                  //email: '11913005@aaa.com',
                                  //password: '11913005',
                                );
                                print(
                                    'userId : $userId, userPassword : $userPassword');

                                if (newUser.user != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return HomeScreen();
                                      },
                                    ),
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text('로그인'),
                          ),
                        ),
                        Text('아이디 : 11913005, 비밀번호 : 11913005'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
