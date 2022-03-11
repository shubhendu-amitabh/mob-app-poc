import 'package:flutter/material.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Ruckus Logo
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 56.0,
            child: Image.asset('assets/login-logo.png'),
          )),
    );

    TextEditingController emailController = new TextEditingController();

    // User name field
    final inputEmail = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );

    TextEditingController passwordController = new TextEditingController();

    //Password input field
    final inputPassword = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );

    //Login button
    final buttonLogin = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Login',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () => {
            if (emailController.text.isEmpty)
              {showToastWithMessage('email cannot be empty')}
            else if (passwordController.text.isEmpty)
              {showToastWithMessage('password cannot be empty')}
            else
              {
                // Load dashboard
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()))
              }
          },
        ),
      ),
    );

    //Forgot password button
    final buttonForgotPassword = FlatButton(
        child: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        onPressed: () => {showToastWithMessage('Feature not supported yet')});

    // Main View of login page
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            logo,
            inputEmail,
            inputPassword,
            buttonLogin,
            buttonForgotPassword
          ],
        ),
      ),
    ));
  }

  void showToastWithMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
