import 'package:flutter/material.dart';
import 'package:tredjefarven/util/const_colors.dart';

class NamesRaisedButton extends StatefulWidget {
  final String text;
  final ConstColors constColors;
  final Function(String, bool) callback;

  NamesRaisedButton(this.text, this.constColors, this.callback);

  final _NamesRaisedButtonState _namesRaisedButtonState = _NamesRaisedButtonState();

  @override
  _NamesRaisedButtonState createState() => this._namesRaisedButtonState;

  bool isPressed() => _namesRaisedButtonState.isPressed;

  bool isDoublePressed() => _namesRaisedButtonState.isDoublePressed;
}

class _NamesRaisedButtonState extends State<NamesRaisedButton> {
  Color color;
  bool isPressed, isDoublePressed;

  @override
  void initState() {
    this.color = this.widget.constColors.btnColor;
    this.isPressed = false;
    this.isDoublePressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4 - 2,
      child: RaisedButton(
        child: Text(
          this.widget.text,
          style: TextStyle(
            color: this.widget.constColors.textColor,
          ),
        ),
        color: color,
        onPressed: () {
          setState(() {
            if(this.color == this.widget.constColors.btnColor) {
              this.color = this.widget.constColors.btnSelectedColor;
              this.isPressed = true;
              this.isDoublePressed = false;
            } else if (this.color == this.widget.constColors.btnSelectedColor) {
              this.color = this.widget.constColors.btnSelectedTwiceColor;
              this.isPressed = false;
              this.isDoublePressed = true;
            } else {
              this.color = widget.constColors.btnColor;
              this.isPressed = false;
              this.isDoublePressed = false;
            }
            this.widget.callback(this.widget.text, this.isPressed || this.isDoublePressed);
          });
        },
      ),
    );
  }
}



class BidRaisedButton extends StatefulWidget {

  final String text;
  final ConstColors constColors;
  final double widthCount;
  final Function() callback;
  final Function(String) callbackNoloOrTrick;

  BidRaisedButton(this.text, this.constColors, this.widthCount, this.callback, this.callbackNoloOrTrick);

  final _BidRaisedButtonState _bidRaisedButtonState = _BidRaisedButtonState();

  @override
  _BidRaisedButtonState createState() => this._bidRaisedButtonState;

  void cycleColor() => this._bidRaisedButtonState.cycleColor();

  void setStandardColor() => this._bidRaisedButtonState.setStandardColor();

  bool isPressed() => _bidRaisedButtonState.isPressed;
}

class _BidRaisedButtonState extends State<BidRaisedButton> {
  Color color;
  bool isPressed;

  @override
  void initState() {
    this.color = this.widget.constColors.btnColor;
    this.isPressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / this.widget.widthCount - 2,
      child: RaisedButton(
        child: Text(
          this.widget.text,
          style: TextStyle(
            color: this.widget.constColors.textColor,
          ),
        ),
        color: this.color,
        onPressed: cycleColor,
      ),
    );
  }

  void cycleColor() {
    setState(() {
      if(this.color == this.widget.constColors.btnColor) {
        this.widget.callback();
        this.color = this.widget.constColors.btnSelectedColor;
        this.isPressed = true;
        this.widget.callbackNoloOrTrick(this.widget.text);
      } else {
        this.color = this.widget.constColors.btnColor;
        this.isPressed = false;
      }
    });
  }

  void setStandardColor() {
    setState(() {
      this.color = this.widget.constColors.btnColor;
      this.isPressed = false;
    });
  }
}