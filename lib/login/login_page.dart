import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        // data: ThemeData(primaryColor: Colors.yellowAccent),
        data: Theme.of(context).copyWith(primaryColor: Colors.red),
        // child: ThemeDemo(),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Theme.of(context).primaryColor,
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFieldDemo(),
        ],
      ),
    ));
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      debugPrint("$textEditingController.text");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value) {
        debugPrint("$value");
      },
      onSubmitted: (value) {
        debugPrint("$value");
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: "Title",
        hintText: "Enter the post title",
        filled: true,
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, passworld;
  bool autovalidate = false;

  void submitRegisterFrom() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('Username: $username');
      debugPrint('Username: $passworld');

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("data"),
      ));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatorUsername(String value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatorPassworld(String value) {
    if (value.isEmpty) {
      return 'Passworld is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 120),
          TextFormField(
            decoration: InputDecoration(labelText: "Username", helperText: ''),
            onSaved: (value) {
              username = value;
            },
            validator: validatorUsername,
            autovalidate: autovalidate,
          ),
          SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: "Password", helperText: ''),
            onSaved: (value) {
              passworld = value;
            },
            validator: validatorPassworld,
            autovalidate: autovalidate,
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text("Register"),
              elevation: 0.0,
              onPressed: submitRegisterFrom,
            ),
          )
        ],
      ),
    );
  }
}
