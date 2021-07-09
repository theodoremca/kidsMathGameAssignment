
import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    Key key,
    @required this.innerImage,
    @required this.id,
    @required this.onTap,
    this.selectedId: "",
  }) : super(key: key);
  final String innerImage;
  final String id;
  final String selectedId;
  final VoidCallback onTap;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 86,
          height: 155,
          child: Stack(children: <Widget>[
            Container(
                width: 81,
                height: 149,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow:  [
                    BoxShadow(
                      color: id == selectedId? Color(0xFF000000).withAlpha(60) : Color(0xFF000000).withAlpha(10),
                      blurRadius: 6.0,
                      spreadRadius: 0.0,
                      offset: Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                  color: id == selectedId ? Color.fromRGBO(255, 223, 0, 1) : null,
                  border: Border.all(
                    color: Color.fromRGBO(122, 1, 0, 1),
                    width: 3,
                  ),
                )),
            Positioned(
                top: 10,
                left: 0,
                child: Container(
                  width: 72,
                  height: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/" + innerImage),
                    fit: BoxFit.scaleDown,
                  )),
                )),
          ])),
    );
  }
}
