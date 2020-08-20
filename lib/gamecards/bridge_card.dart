import 'package:flutter/material.dart';
import 'package:tredjefarven/util/const_colors.dart';

class BridgeCard extends StatelessWidget {

	ConstColors constColors = ConstColors();

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Card(
				color: Colors.amber,
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: <Widget>[
						ListTile(
							title: Text(
								'Bridge',
								style: TextStyle(
									letterSpacing: 2.0,
									fontSize: 30.0,
									color: constColors.titelColor,
								),
							),
						),
						FlatButton(
							child: Text(
								'Quickgame',
								style: TextStyle(
									color: constColors.textColor,
								),
							),
							color: constColors.btnColor,
							onPressed: () {},
						),
						FlatButton(
							child: Text(
								'My ranked games',
								style: TextStyle(
									color: constColors.textColor,
								),
							),
							color: constColors.btnColor,
							onPressed: () {},
						),
						FlatButton(
							child: Text(
								'Create new ranked game',
								style: TextStyle(
									color: constColors.textColor,
								),
							),
							color: constColors.btnColor,
							onPressed: () {},
						),
					],
				),
			),
		);
	}
}
