import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flat_app/theme/style.dart';
import 'style.dart';
import 'package:flutter_flat_app/components/TextFields/inputField.dart';
import 'package:flutter_flat_app/components/Buttons/textButton.dart';
import 'package:flutter_flat_app/components/Buttons/roundedButton.dart';
import 'package:flutter_flat_app/services/validations.dart';
import 'package:flutter/rendering.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  BuildContext context;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  bool autovalidate = false;
  Validations validations = new Validations();

  _onPressed() {
    print("button clicked");
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      Navigator.pushNamed(context, "/HomePage");
    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    Validations validations = new Validations();
    return new Scaffold(
        key: _scaffoldKey,
        body: new SingleChildScrollView(
            controller: scrollController,
            child: new Container(
              padding: new EdgeInsets.all(25.0),
              decoration: new BoxDecoration(image: backgroundImage),
              height: screenSize.height,
              child: new Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 80.0)),
                  new Container(
                    height: 80.0,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Center(
                          child: new Text(
                            "Sign in with your",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 26.0,
                              fontFamily: "Google Sans",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        new Center(
                          child: new Text(
                            "e-mail address",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 26.0,
                              fontFamily: "Google Sans",
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30.0)),
                  new Container(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Form(
                          key: formKey,
                          autovalidate: autovalidate,
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  new TextButton(
                                      buttonName: "Register here?",
                                      onPressed: _onPressed,
                                      buttonTextStyle: buttonTextStyle)
                                ],
                              ),
                              new InputField(
                                  hintText: "Email",
                                  obscureText: false,
                                  hintStyle: TextStyle(color: Colors.black),
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  bottomMargin: 30.0,
                                  validateFunction: validations.validateEmail,
                                  onSaved: (String email) {}),
                              new InputField(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black),
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  bottomMargin: 30.0,
                                  validateFunction:
                                      validations.validatePassword,
                                  onSaved: (String password) {}),
                              new RoundedButton(
                                buttonName: "Login",
                                onTap: _handleSubmitted,
                                width: screenSize.width,
                                height: 50.0,
                                bottomMargin: 10.0,
                                borderWidth: 0.0,
                                buttonColor: secondaryColor,
                              ),
                            ],
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new TextButton(
                                buttonName: "Forgot password?",
                                onPressed: _onPressed,
                                buttonTextStyle: buttonTextStyle)
                          ],
                        )
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Center(
                          child: new Text(
                            "Sign in with",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 26.0,
                              fontFamily: "Google Sans",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new ButtonTheme(
                                minWidth: 150.0,
                                height: 60.0,
                                child: new RaisedButton(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 30.0,
                                      top: 13.0,
                                      bottom: 13.0,
                                      right: 30.0),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(50.0)),
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      new Image.asset(
                                          'assets/svg/facebook.png'),
                                      Text(
                                        ' Facebook',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )),
                            new ButtonTheme(
                                minWidth: 150.0,
                                height: 60.0,
                                child: new RaisedButton(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 30.0,
                                      top: 13.0,
                                      bottom: 13.0,
                                      right: 30.0),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(50.0)),
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      new Image.asset('assets/svg/google.png'),
                                      Text(
                                        ' Google',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )),
                            // new RaisedButton.icon(
                            //   icon: new Image.asset("assets/svg/google.png"),
                            //   label: const Text('Google'),
                            //   color: Colors.white,
                            //   shape: new RoundedRectangleBorder(
                            //       borderRadius:
                            //           new BorderRadius.circular(50.0)),
                            //   textColor: Colors.black87,
                            //   onPressed: () {
                            //     // Perform some action
                            //   },
                            // )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
