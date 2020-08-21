import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tredjefarven/util/const_colors.dart';
import 'package:tredjefarven/whist/round_whist.dart';
import 'package:tredjefarven/whist/game_whist.dart';
import 'package:tredjefarven/util/const_bids.dart';

class ReportRoundWhist extends StatefulWidget {
  final Function(Round) callback;
  final Game game;

  ReportRoundWhist(this.callback, this.game);

  @override
  _ReportRoundWhistState createState() => _ReportRoundWhistState();
}

class _ReportRoundWhistState extends State<ReportRoundWhist> {
  ConstColors constColors = ConstColors();
  ConstBids constBids = ConstBids();
  FlutterToast flutterToast;
  int indexForNoloOrTrick = 0;
  List<Widget> tricksOrNoloLayout;

  Map<String, NamesRaisedButton> namesMap = Map();
  Map<String, BidRaisedButton> bidTypeMap = Map();
  Map<String, BidRaisedButton> bidSizeMap = Map();
  Map<String, BidRaisedButton> tricksGottenMap = Map();

  @override
  void initState() {
    namesMap.addAll( {"p1": NamesRaisedButton(widget.game.p1.name, this.constColors),
      "p2": NamesRaisedButton(widget.game.p2.name, this.constColors),
      "p3": NamesRaisedButton(widget.game.p3.name, this.constColors),
      "p4": NamesRaisedButton(widget.game.p4.name, this.constColors), });

    bidTypeMap.addAll( {constBids.ALM: BidRaisedButton(constBids.ALM, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.HALVE: BidRaisedButton(constBids.HALVE, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.GODE: BidRaisedButton(constBids.GODE, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.SANS: BidRaisedButton(constBids.SANS, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.VIP1: BidRaisedButton(constBids.VIP1, this.constColors, 3.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.VIP2: BidRaisedButton(constBids.VIP2, this.constColors, 3.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.VIP3: BidRaisedButton(constBids.VIP3, this.constColors, 3.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.SOL: BidRaisedButton(constBids.SOL, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.RENSOL: BidRaisedButton(constBids.RENSOL, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.BORD: BidRaisedButton(constBids.BORD, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo),
      constBids.RENBORD: BidRaisedButton(constBids.RENBORD, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setIndexForTrickOrNolo) });

    bidSizeMap.addAll( {"8": BidRaisedButton("8", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setIndexForTrickOrNolo),
      "9": BidRaisedButton("9", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setIndexForTrickOrNolo),
      "10": BidRaisedButton("10", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setIndexForTrickOrNolo),
      "11": BidRaisedButton("11", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setIndexForTrickOrNolo),
      "12": BidRaisedButton("12", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setIndexForTrickOrNolo),
      "13": BidRaisedButton("13", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setIndexForTrickOrNolo) });

    tricksGottenMap.addAll( {"0": BidRaisedButton("0", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "1": BidRaisedButton("1", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "2": BidRaisedButton("2", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "3": BidRaisedButton("3", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "4": BidRaisedButton("4", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "5": BidRaisedButton("5", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "6": BidRaisedButton("6", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "7": BidRaisedButton("7", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "8": BidRaisedButton("8", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "9": BidRaisedButton("9", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "10": BidRaisedButton("10", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "11": BidRaisedButton("11", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "12": BidRaisedButton("12", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo),
      "13": BidRaisedButton("13", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setIndexForTrickOrNolo), });

    tricksOrNoloLayout = [TricksButtonLayout(this.bidSizeMap, this.tricksGottenMap), NoloLayout()];

    flutterToast = FlutterToast(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Report Round",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: constColors.titelColor,
                    ),
                  ),
                ],
							mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              SizedBox(height: 10),
              Text(
                "Angiv spilføreren (dobbelt klik) og eventuel makker (enkelt klik):",
                style: TextStyle(
                  color: constColors.textColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  namesMap["p1"],
                  namesMap["p2"],
                  namesMap["p3"],
                  namesMap["p4"],
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Angiv meldingens type:",
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
                  this.bidTypeMap[constBids.ALM],
                  this.bidTypeMap[constBids.HALVE],
                  this.bidTypeMap[constBids.GODE],
                  this.bidTypeMap[constBids.SANS],
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  this.bidTypeMap[constBids.VIP1],
                  this.bidTypeMap[constBids.VIP2],
                  this.bidTypeMap[constBids.VIP3],
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  this.bidTypeMap[constBids.SOL],
                  this.bidTypeMap[constBids.RENSOL],
                  this.bidTypeMap[constBids.BORD],
                  this.bidTypeMap[constBids.RENBORD],
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              SizedBox(height: 10),


              tricksOrNoloLayout[indexForNoloOrTrick],


              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: RaisedButton(
                  child: Text(
                    "Bekræft runde",
                    style: TextStyle(
                      color: constColors.confirmColor,
                    ),
                  ),
                  color: constColors.btnColor,
                  onPressed: confirmRound,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void confirmRound() {
    // Is legal config

    int numberOfPresses = 0;
    this.namesMap.forEach((k, v) { if(v.isPressed()) numberOfPresses++; });
    bool isNumberOfPressedNamesZeroOrOne = numberOfPresses == 0 || numberOfPresses == 1;

    int numberOfDoublePresses = 0;
    this.namesMap.forEach((k, v) { if(v.isDoublePressed()) numberOfDoublePresses++; });
    bool isCorrectNumberOfDoublePresses = numberOfDoublePresses == 1;

    String bidType = "";
    this.bidTypeMap.forEach((k, v) { if(v.isPressed()) bidType = v.text; });

    String bidSize = "";
    this.bidSizeMap.forEach((k, v) { if(v.isPressed()) bidSize = v.text; });

    String tricksGotten = "";
    this.tricksGottenMap.forEach((k, v) { if(v.isPressed()) tricksGotten = v.text; });

    bool isNoloBid = false;
    bool isRegularBid = false;
    if ([constBids.SOL, constBids.RENSOL, constBids.BORD, constBids.RENBORD].contains(bidType)) {
      isNoloBid = true;
    } else if ([constBids.ALM, constBids.HALVE, constBids.GODE, constBids.SANS, constBids.VIP1, constBids.VIP2, constBids.VIP3].contains(bidType)) {
      isRegularBid = true;
    }

    bool isOnValidBidSize = bidSize.length > 0;

    bool isOnValidTricksGotten = tricksGotten.length > 0;

    bool isValidConfig = false;

    if (isNoloBid) {
      isValidConfig = isCorrectNumberOfDoublePresses && !isOnValidBidSize && isOnValidTricksGotten;
    } else if (isRegularBid) {
      isValidConfig = isCorrectNumberOfDoublePresses && isNumberOfPressedNamesZeroOrOne && isOnValidBidSize && isOnValidTricksGotten;
    } else {
      isValidConfig = false;
    }

    if (isValidConfig) {
      // Round
      String bidder;
      this.namesMap.forEach((k, v) { if(v.isDoublePressed()) bidder = k; });

      List<String> partners = [];
      this.namesMap.forEach((k, v) { if(v.isPressed()) partners.add(k); });

      Round round = Round(bidder, partners, bidType, int.parse(bidSize), int.parse(tricksGotten));

      this.widget.callback(round);
    } else {
      _showToast();
    }
  }

  void _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: constColors.toastColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline),
          SizedBox(
            width: 12.0,
          ),
          Text("Ugyldig konfiguration!"),
        ],
      ),
    );
    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  void setStandardColorOnBidTypeButtons() {
    this.bidTypeMap.forEach((k, v) => v.setStandardColor());
  }

  void setIndexForTrickOrNolo(String text) {
    setState(() {
      if ([constBids.SOL, constBids.RENSOL, constBids.BORD, constBids.RENBORD].contains(text)) {
        this.indexForNoloOrTrick = 1;
      } else {
        this.indexForNoloOrTrick = 0;
      }
    });

  }

  void setStandardColorOnBidSizeButtons() =>
    this.bidSizeMap.forEach((k, v) => v.setStandardColor());

  void setStandardColorOnTricksGottenButtons() =>
    this.tricksGottenMap.forEach((k, v) => v.setStandardColor());

}

class NamesRaisedButton extends StatefulWidget {
  final String text;
  final ConstColors constColors;

  NamesRaisedButton(this.text, this.constColors);

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
