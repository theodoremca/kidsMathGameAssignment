import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unit7_mobile_dev/landing_page.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({
    Key key,
  }) : super(key: key);

  @override
  _NameTextFieldState createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  final TextEditingController _nameController = TextEditingController();

  Future _setName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('player_name', _nameController.text);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LandingPage()));
  }
  void _saveText() => _setName();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: _nameController,
      onEditingComplete: _saveText,
      cursorColor: Colors.black,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color.fromRGBO(122, 1, 0, 1),
          fontFamily: 'Unit7 Secondary',
          fontSize: 30,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1.5 /*PERCENT not supported*/
          ),
      keyboardType: TextInputType.name,
      decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: "Oyinlade"),
    );
  }
}


