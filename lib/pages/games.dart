import 'package:flutter/material.dart';
import 'package:tredjefarven/gamecards/whist_card.dart';
import 'package:tredjefarven/util/const_colors.dart';
import 'package:tredjefarven/gamecards/two_players_whist_card.dart';
import 'package:tredjefarven/gamecards/bridge_card.dart';

class Games extends StatefulWidget {

  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {

	ConstColors constColors = ConstColors();

	List<Widget> gameCards = <Widget>[
		WhistCard(),
		TwoPlayersWhistCard(),
		BridgeCard(),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: constColors.bgColor,
			body: SafeArea(
			  child: ListView(
			  	padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
					children: gameCards,
			  ),
			),
		);
	}
}
