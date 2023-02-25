import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login App')),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            emailField(),
            Gap(20),
            passField(),
            Gap(20),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'you@gmail.com',
          labelText: 'Enter email here'),
    );
  }

  Widget passField() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '*****',
          labelText: 'Enter password here'),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Login'),
    );
  }
}
