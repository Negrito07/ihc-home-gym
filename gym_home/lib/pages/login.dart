import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoginForm = true;
  String _email = '', _password = '';

  // Function to switch between login and signup form
  void _toggleFormMode() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  // Function to handle form submission
  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // Authenticate user with entered email and password
      if (_isLoginForm) {
        // Perform login
      } else {
        // Perform signup
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoginForm ? 'Login' : 'Sign Up'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Email is required' : null,
                onSaved: (value) => _email = value!.trim(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Password is required' : null,
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_isLoginForm ? 'Login' : 'Sign Up'),
              ),
              TextButton(
                onPressed: _toggleFormMode,
                child: Text(_isLoginForm ? 'Create an account' : 'Already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
