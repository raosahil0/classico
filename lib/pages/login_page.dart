import 'package:classico/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool ChangeButton = false;
  final _formKey = GlobalKey<FormState>();
  MoveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        ChangeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        ChangeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Welcome $name",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                        child: Column(
                          children: [
                            TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Username",
                                  labelText: "Username",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " Username cannot be empty ";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  name = value;
                                  setState(() {});
                                }),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return " password cannot be empty ";
                                } else if (value.length < 6) {
                                  return "password length should be at leat six";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Material(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.circular(ChangeButton ? 50 : 8),
                              child: InkWell(
                                onTap: () => MoveToHome(context),
                                // onTap: () async {
                                //  setState(() {
                                //  ChangeButton = true;
                                //});

                                // await Future.delayed(Duration(seconds: 1));
                                // await Navigator.pushNamed(
                                //   context, MyRoutes.homeRoute);
                                // setState(() {
                                //   ChangeButton = false;
                                //  });}
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width: ChangeButton ? 50 : 150,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: ChangeButton
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                  // decoration: BoxDecoration(
                                  //  color: Colors.deepPurple,
                                  // shape: ChangeButton ? BoxShape.rectangle:BoxShape.circle,
                                  //  borderRadius:
                                  //  BorderRadius.circular(ChangeButton ? 50 : 8)),
                                ),
                              ),

                              // ElevatedButton(
                              // onPressed: () {
                              // Navigator.pushNamed(context, MyRoutes.homeRoute);
                              // },
                              // child: Text("Login"),
                              //  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                            ),
                          ],
                        ))
                  ],
                ))));
  }
}
