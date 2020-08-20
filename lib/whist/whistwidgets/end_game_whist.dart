import 'package:flutter/material.dart';
import 'package:tredjefarven/util/const_colors.dart';

class EndGame extends StatefulWidget {
  @override
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
	ConstColors constColors = ConstColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: constColors.bgColor,
			body: SafeArea(child: Text("End game\nshow all the stats and final scrollable scoreboard")),
		);
  }
}
