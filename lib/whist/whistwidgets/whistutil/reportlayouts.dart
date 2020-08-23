import 'package:flutter/material.dart';
import 'package:tredjefarven/util/const_colors.dart';
import 'package:tredjefarven/whist/whistwidgets/whistutil/buttons.dart';



class TricksButtonLayout extends StatefulWidget {

  final Map<String, BidRaisedButton> bidSizeMap, tricksGottenMap;

  TricksButtonLayout(this.bidSizeMap, this.tricksGottenMap);

  @override
  _TricksButtonLayoutState createState() => _TricksButtonLayoutState();
}

class _TricksButtonLayoutState extends State<TricksButtonLayout> {
  ConstColors constColors = ConstColors();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Angiv meldingens størrelse:",
                style: TextStyle(
                  color: constColors.textColor,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            this.widget.bidSizeMap["8"],
            this.widget.bidSizeMap["9"],
            this.widget.bidSizeMap["10"],
            this.widget.bidSizeMap["11"],
            this.widget.bidSizeMap["12"],
            this.widget.bidSizeMap["13"],
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Angiv hvor mange stik spilføreren og makkeren vandt:",
                style: TextStyle(
                  color: constColors.textColor,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            this.widget.tricksGottenMap["0"],
            this.widget.tricksGottenMap["1"],
            this.widget.tricksGottenMap["2"],
            this.widget.tricksGottenMap["3"],
            this.widget.tricksGottenMap["4"],
            this.widget.tricksGottenMap["5"],
            this.widget.tricksGottenMap["6"],
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            this.widget.tricksGottenMap["7"],
            this.widget.tricksGottenMap["8"],
            this.widget.tricksGottenMap["9"],
            this.widget.tricksGottenMap["10"],
            this.widget.tricksGottenMap["11"],
            this.widget.tricksGottenMap["12"],
            this.widget.tricksGottenMap["13"],
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ],
    );
  }
}



class NoloLayout extends StatefulWidget {
  @override
  _NoloLayoutState createState() => _NoloLayoutState();
}

class _NoloLayoutState extends State<NoloLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Nolo"),
      ],
    );
  }
}