import 'package:flutter/material.dart';
import 'package:tredjefarven/pages/home.dart';
import 'dart:async';
import 'package:tredjefarven/util/const_colors.dart';
import 'package:tredjefarven/whist/whistwidgets/end_game_whist.dart';
import 'package:tredjefarven/whist/whistwidgets/enter_names_whist.dart';
import 'package:tredjefarven/whist/whistwidgets/between_rounds_whist.dart';
import 'package:tredjefarven/whist/whistwidgets/report_round_whist.dart';
import 'package:tredjefarven/whist/game_whist.dart';
import 'package:tredjefarven/whist/player_whist.dart';
import 'package:tredjefarven/whist/round_whist.dart';

class Whist extends StatefulWidget {
  @override
  _WhistState createState() => _WhistState();
}

class _WhistState extends State<Whist> {

	ConstColors constColors;
	Widget whistWidgets;
	Game game;

	@override
  void initState() {
		whistWidgets = EnterNamesWhist(this.enterNamesCallback);
		constColors = ConstColors();
		super.initState();
	}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
			onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: constColors.bgColor,
        body: whistWidgets,
      ),
    );
  }

  void enterNamesCallback(String p1name, String p2name, String p3name, String p4name) {
  	setState(() {
  		Player p1 = Player(p1name);
  		Player p2 = Player(p2name);
  		Player p3 = Player(p3name);
  		Player p4 = Player(p4name);
  		game = Game(p1, p2, p3, p4);
  		whistWidgets = ReportRoundWhist(this.reportRoundCallback, this.game);
  	});
	}

	void reportRoundCallback(Round round) {
		setState(() {
			game.reportNewRound(round);
			whistWidgets = BetweenRoundsWhist(this.betweenRoundCallback, this.game);
		});
	}

	void betweenRoundCallback(String btn) {
		setState(() {
			if (btn == "next") {
				whistWidgets = ReportRoundWhist(this.reportRoundCallback, this.game);
			} else if (btn == "end") {
				whistWidgets = EndGame();
			}
		});
	}

	Future<bool> _onWillPop() async {
		return (await showDialog(
			context: context,
			builder: (context) => new AlertDialog(
				backgroundColor: constColors.toastColor,
				title: new Text(
					'Er du sikker på du vil afbryde spillet?',
					style: TextStyle(
						color: constColors.titelColor,
					),
				),
				content: new Text(
					'Hvis du trykker ja vil det nuværende spil gå tabt',
					style: TextStyle(
						color: constColors.textColor,
					),
				),
				actions: <Widget>[
					new FlatButton(
						onPressed: () => Navigator.of(context).pop(false),
						child: new Text(
							'Nej',
							style: TextStyle(
								color: constColors.textColor,
							),
						),
					),
					new FlatButton(
						onPressed: () => Navigator.of(context).pop(true),
						child: new Text(
							'Ja',
							style: TextStyle(
								color: constColors.textColor,
							),
						),
					),
				],
			),
		)) ?? false;
	}

}
