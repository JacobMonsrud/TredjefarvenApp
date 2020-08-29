import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tredjefarven/util/const_colors.dart';
import 'package:tredjefarven/whist/round_whist.dart';
import 'package:tredjefarven/whist/game_whist.dart';
import 'file:///C:/Tredjefarven/tredjefarvenApp/TredjefarvenApp/lib/whist/whistwidgets/whistutil/const_bids.dart';
import 'package:tredjefarven/whist/whistwidgets/whistutil/buttons.dart';

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

  bool showNolo, showTricks, showNoloP1, showNoloP2, showNoloP3, showNoloP4;

  Map<String, NamesRaisedButton> namesMap = Map();
  Map<String, BidRaisedButton> bidTypeMap = Map();
  Map<String, BidRaisedButton> bidSizeMap = Map();
  Map<String, BidRaisedButton> tricksGottenMap = Map();
  Map<String, BidRaisedButton> noloMapP1 = Map();
  Map<String, BidRaisedButton> noloMapP2 = Map();
  Map<String, BidRaisedButton> noloMapP3 = Map();
  Map<String, BidRaisedButton> noloMapP4 = Map();

  @override
  void initState() {
    namesMap.addAll( {"p1": NamesRaisedButton(widget.game.p1.name, this.constColors, this.namesButtonNoloPlayers),
      "p2": NamesRaisedButton(widget.game.p2.name, this.constColors, this.namesButtonNoloPlayers),
      "p3": NamesRaisedButton(widget.game.p3.name, this.constColors, this.namesButtonNoloPlayers),
      "p4": NamesRaisedButton(widget.game.p4.name, this.constColors, this.namesButtonNoloPlayers), });

    bidTypeMap.addAll( {constBids.ALM: BidRaisedButton(constBids.ALM, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.HALVE: BidRaisedButton(constBids.HALVE, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.GODE: BidRaisedButton(constBids.GODE, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.SANS: BidRaisedButton(constBids.SANS, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.VIP1: BidRaisedButton(constBids.VIP1, this.constColors, 3.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.VIP2: BidRaisedButton(constBids.VIP2, this.constColors, 3.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.VIP3: BidRaisedButton(constBids.VIP3, this.constColors, 3.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.SOL: BidRaisedButton(constBids.SOL, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.RENSOL: BidRaisedButton(constBids.RENSOL, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.BORD: BidRaisedButton(constBids.BORD, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout),
      constBids.RENBORD: BidRaisedButton(constBids.RENBORD, this.constColors, 4.0, this.setStandardColorOnBidTypeButtons, this.setStatusForTrickOrNoloLayout) });

    bidSizeMap.addAll( {"8": BidRaisedButton("8", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setStatusForTrickOrNoloLayout),
      "9": BidRaisedButton("9", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setStatusForTrickOrNoloLayout),
      "10": BidRaisedButton("10", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setStatusForTrickOrNoloLayout),
      "11": BidRaisedButton("11", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setStatusForTrickOrNoloLayout),
      "12": BidRaisedButton("12", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setStatusForTrickOrNoloLayout),
      "13": BidRaisedButton("13", this.constColors, 6.0, this.setStandardColorOnBidSizeButtons, this.setStatusForTrickOrNoloLayout) });

    tricksGottenMap.addAll( {"0": BidRaisedButton("0", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "1": BidRaisedButton("1", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "2": BidRaisedButton("2", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "3": BidRaisedButton("3", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "4": BidRaisedButton("4", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "5": BidRaisedButton("5", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "6": BidRaisedButton("6", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "7": BidRaisedButton("7", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "8": BidRaisedButton("8", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "9": BidRaisedButton("9", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "10": BidRaisedButton("10", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "11": BidRaisedButton("11", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "12": BidRaisedButton("12", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout),
      "13": BidRaisedButton("13", this.constColors, 7.0, this.setStandardColorOnTricksGottenButtons, this.setStatusForTrickOrNoloLayout), });

    noloMapP1.addAll( {constBids.P1NOLOWON: BidRaisedButton(widget.game.p1.name + " vandt", this.constColors, 2, this.setStandardColorOnNoloP1Buttons, (s) => {}),
      constBids.P1NOLOLOSE: BidRaisedButton(widget.game.p1.name + " tabte", this.constColors, 2, this.setStandardColorOnNoloP1Buttons, (s) => {}) });

    noloMapP2.addAll( {constBids.P2NOLOWON: BidRaisedButton(widget.game.p2.name + " vandt", this.constColors, 2, this.setStandardColorOnNoloP2Buttons, (s) => {}),
      constBids.P2NOLOLOSE: BidRaisedButton(widget.game.p2.name + " tabte", this.constColors, 2, this.setStandardColorOnNoloP2Buttons, (s) => {}) });

    noloMapP3.addAll( {constBids.P3NOLOWON: BidRaisedButton(widget.game.p3.name + " vandt", this.constColors, 2, this.setStandardColorOnNoloP3Buttons, (s) => {}),
      constBids.P3NOLOLOSE: BidRaisedButton(widget.game.p3.name + " tabte", this.constColors, 2, this.setStandardColorOnNoloP3Buttons, (s) => {}) });

    noloMapP4.addAll( {constBids.P4NOLOWON: BidRaisedButton(widget.game.p4.name + " vandt", this.constColors, 2, this.setStandardColorOnNoloP4Buttons, (s) => {}),
      constBids.P4NOLOLOSE: BidRaisedButton(widget.game.p4.name + " tabte", this.constColors, 2, this.setStandardColorOnNoloP4Buttons, (s) => {}) });

    showNolo = false;
    showTricks = true;
    showNoloP1 = false;
    showNoloP2 = false;
    showNoloP3 = false;
    showNoloP4 = false;

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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Angiv spilføreren (dobbelt klik) og eventuel makker (enkelt klik):",
                  style: TextStyle(
                    color: constColors.textColor,
                  ),
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

              Visibility(
                child: Column(
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
                        this.bidSizeMap["8"],
                        this.bidSizeMap["9"],
                        this.bidSizeMap["10"],
                        this.bidSizeMap["11"],
                        this.bidSizeMap["12"],
                        this.bidSizeMap["13"],
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
                        this.tricksGottenMap["0"],
                        this.tricksGottenMap["1"],
                        this.tricksGottenMap["2"],
                        this.tricksGottenMap["3"],
                        this.tricksGottenMap["4"],
                        this.tricksGottenMap["5"],
                        this.tricksGottenMap["6"],
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        this.tricksGottenMap["7"],
                        this.tricksGottenMap["8"],
                        this.tricksGottenMap["9"],
                        this.tricksGottenMap["10"],
                        this.tricksGottenMap["11"],
                        this.tricksGottenMap["12"],
                        this.tricksGottenMap["13"],
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ],
                ),
                visible: showTricks,
                maintainState: true,
              ),

              Visibility(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Angiv om nolo meldingen blev vundet:",
                            style: TextStyle(
                              color: constColors.textColor,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),

                    SizedBox(height: 10),

                    Visibility(
                      child: Row(
                        children: <Widget>[
                          this.noloMapP1[constBids.P1NOLOWON],
                          this.noloMapP1[constBids.P1NOLOLOSE],
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      visible: showNoloP1,
                      maintainState: true,
                    ),
                    Visibility(
                      child: Row(
                        children: <Widget>[
                          this.noloMapP2[constBids.P2NOLOWON],
                          this.noloMapP2[constBids.P2NOLOLOSE],
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      visible: showNoloP2,
                      maintainState: true,
                    ),
                    Visibility(
                      child: Row(
                        children: <Widget>[
                          this.noloMapP3[constBids.P3NOLOWON],
                          this.noloMapP3[constBids.P3NOLOLOSE],
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      visible: showNoloP3,
                      maintainState: true,
                    ),
                    Visibility(
                      child: Row(
                        children: <Widget>[
                          this.noloMapP4[constBids.P4NOLOWON],
                          this.noloMapP4[constBids.P4NOLOLOSE],
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      visible: showNoloP4,
                      maintainState: true,
                    ),
                  ],
                ),
                visible: showNolo,
                maintainState: true,
              ),

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
    bool isNumberOfPressedNamesZeroOrOne = (numberOfPresses == 0 || numberOfPresses == 1);

    int numberOfDoublePresses = 0;
    this.namesMap.forEach((k, v) { if(v.isDoublePressed()) numberOfDoublePresses++; });
    bool isCorrectNumberOfDoublePresses = (numberOfDoublePresses == 1);

    String bidType = "";
    this.bidTypeMap.forEach((k, v) { if(v.isPressed()) bidType = v.text; });

    String bidSize = "0";
    this.bidSizeMap.forEach((k, v) { if(v.isPressed()) bidSize = v.text; });

    String tricksGotten = "0";
    this.tricksGottenMap.forEach((k, v) { if(v.isPressed()) tricksGotten = v.text; });

    bool isNoloBid = [constBids.SOL, constBids.RENSOL, constBids.BORD, constBids.RENBORD].contains(bidType);
    bool isRegularBid = [constBids.ALM, constBids.HALVE, constBids.GODE, constBids.SANS, constBids.VIP1, constBids.VIP2, constBids.VIP3].contains(bidType);

    bool isOnValidBidSize = bidSize.length > 0;

    bool isOnValidTricksGotten = tricksGotten.length > 0;

    bool isValidConfig = false;

    if (isNoloBid) {
      bool p1Correct = true;
      bool p2Correct = true;
      bool p3Correct = true;
      bool p4Correct = true;

      if (showNoloP1) {
        p1Correct = false;
        this.noloMapP1.forEach((k, v) { if(v.isPressed()) p1Correct = true; });
      }
      if (showNoloP2) {
        p2Correct = false;
        this.noloMapP2.forEach((k, v) { if(v.isPressed()) p2Correct = true; });
      }
      if (showNoloP3) {
        p3Correct = false;
        this.noloMapP3.forEach((k, v) { if(v.isPressed()) p3Correct = true; });
      }
      if (showNoloP4) {
        p4Correct = false;
        this.noloMapP4.forEach((k, v) { if(v.isPressed()) p4Correct = true; });
      }

      isValidConfig = isCorrectNumberOfDoublePresses && p1Correct && p2Correct && p3Correct && p4Correct;

    } else if (isRegularBid) {
      isValidConfig = isCorrectNumberOfDoublePresses && isNumberOfPressedNamesZeroOrOne && isOnValidBidSize && isOnValidTricksGotten;
    } else {
      isValidConfig = false;
    }

    if (isValidConfig) {
      // Round
      String bidder;
      this.namesMap.forEach((k, v) { if(v.isDoublePressed()) bidder = k; });

      List<String> partnersOrNoloJoiners = [];
      this.namesMap.forEach((k, v) { if(v.isPressed()) partnersOrNoloJoiners.add(k); });

      List<bool> noloWonLoseList = [];
      noloWonLoseList.add(this.noloMapP1[constBids.P1NOLOWON].isPressed());
      noloWonLoseList.add(this.noloMapP2[constBids.P2NOLOWON].isPressed());
      noloWonLoseList.add(this.noloMapP3[constBids.P3NOLOWON].isPressed());
      noloWonLoseList.add(this.noloMapP4[constBids.P4NOLOWON].isPressed());

      Round round = Round(bidder, partnersOrNoloJoiners, bidType, int.parse(bidSize), int.parse(tricksGotten), noloWonLoseList);

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

  void setStandardColorOnBidTypeButtons() =>
    this.bidTypeMap.forEach((k, v) => v.setStandardColor());

  void setStandardColorOnBidSizeButtons() =>
    this.bidSizeMap.forEach((k, v) => v.setStandardColor());

  void setStandardColorOnTricksGottenButtons() =>
    this.tricksGottenMap.forEach((k, v) => v.setStandardColor());

  void setStandardColorOnNoloP1Buttons() =>
    this.noloMapP1.forEach((k, v) => v.setStandardColor());

  void setStandardColorOnNoloP2Buttons() =>
      this.noloMapP2.forEach((k, v) => v.setStandardColor());

  void setStandardColorOnNoloP3Buttons() =>
      this.noloMapP3.forEach((k, v) => v.setStandardColor());

  void setStandardColorOnNoloP4Buttons() =>
      this.noloMapP4.forEach((k, v) => v.setStandardColor());

  void setStatusForTrickOrNoloLayout(String text) {
    setState(() {
      if ([constBids.SOL, constBids.RENSOL, constBids.BORD, constBids.RENBORD].contains(text)) {
        showNolo = true;
        showTricks = false;
      } else {
        showNolo = false;
        showTricks = true;
      }
    });
  }

  void namesButtonNoloPlayers(String name, bool pressed) {
    setState(() {
      if (widget.game.p1.name == name) {
        showNoloP1 = pressed;
      } else if (widget.game.p2.name == name) {
        showNoloP2 = pressed;
      } else if (widget.game.p3.name == name) {
        showNoloP3 = pressed;
      } else if (widget.game.p4.name == name) {
        showNoloP4 = pressed;
      }
    });
  }

}
