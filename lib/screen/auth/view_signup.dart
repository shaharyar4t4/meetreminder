import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meetreminder/screen/auth/view_login.dart';
import 'package:meetreminder/screen/services/auth_services.dart';

class ViewSignup extends StatefulWidget {
  const ViewSignup({super.key});

  @override
  State<ViewSignup> createState() => _ViewSignupState();
}

class _ViewSignupState extends State<ViewSignup> {
  TextEditingController emailsig = TextEditingController();
  TextEditingController passsig = TextEditingController();
  TextEditingController namesig = TextEditingController();
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/image/login.png',
                  width: 130,
                  height: 130,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  spacing: 13,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'gilroy',
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your credentials to continue",
                      style: TextStyle(
                        fontFamily: 'gilroy',
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: 320,
                  child: TextField(
                    controller: namesig,
                    decoration: InputDecoration(
                      label: Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'gilroy',
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ), // Default color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1.0,
                        ), // Change color when focused
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: 320,
                  child: TextField(
                    controller: emailsig,
                    decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'gilroy',
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ), // Default color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1.0,
                        ), // Change color when focused
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: 325,
                  child: TextField(
                    obscureText: true,
                    controller: passsig,
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'gilroy',
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ), // Default color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1.0,
                        ), // Change color when focused
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 230),
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontFamily: 'gilroy',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    String? result = await authServices.register(
                      emailsig.text,
                      passsig.text,
                    );
                    if (result == "success") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "User are Added Successfully...",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                      // Navigate to Home Page if login is successful
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => VeiwLogin()),
                      );
                    } else {
                      // Show error message if login fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            result ?? "Login failed",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4a65ff),
                    minimumSize: Size(300, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(fontFamily: 'gilroy', color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VeiwLogin()),
                      );
                    },
                    child: Text(
                      "login",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'gilroy',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
