import 'package:flutter/material.dart';
import 'package:flutter_app/ViewList.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool _rememberMe = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _password = "";
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formkey,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 13),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {//percabangan
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Email"),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 13),
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: password,
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value == null || value.isEmpty) {//percabangan
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      onSaved: (val) => _password = val,
                      obscureText: _obscureText,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 17, right: 15),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              _toggle();
                              print(_obscureText);
                            },
                          )),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            child:
                            Text('Login', style: TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.blue),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.blue)))),
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {//percabangan
                                print('Successfull');

                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => ViewList(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                );
                              } else {
                                print('UnSuccessfull');
                              }
                            }),
                      )),
                ],
              )),
        ),
      ],
    );
  }
}
