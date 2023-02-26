import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simpleloginapp/src/data/bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return StreamBuilder(
        stream: bloc.eemail,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.emailOn,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'you@gmail.com',
                labelText: 'Enter email here',
                errorText: snapshot.error?.toString()),
          );
        });
  }

  Widget passField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.passsOn,
          keyboardType: TextInputType.number,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '*****',
            labelText: 'Enter password here',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasData ? bloc.submit : null,
            child: Text('Login'),
          );
        });
  }
}
