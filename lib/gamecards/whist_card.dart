import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tredjefarven/pages/whist.dart';
import 'package:tredjefarven/util/const_colors.dart';

class WhistCard extends StatelessWidget {

	final ConstColors constColors = ConstColors();

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
								'Whist (Esmakker)',
								style: TextStyle(
									letterSpacing: 2.0,
									fontSize: 30.0,
									color: constColors.titelCardColor,
								),
							),
						),
						FlatButton(
							child: Text(
								'Quickgame',
								style: TextStyle(
									color: constColors.btnTextColor,
								),
							),
							color: constColors.btnColor,
							onPressed: () {
								Navigator.of(context).push(WhistPageRoute());
							},
						),
						FlatButton(
							child: Text(
								'My ranked games',
								style: TextStyle(
									color: constColors.btnTextColor,
								),
							),
							color: constColors.btnColor,
							onPressed: () {},
						),
							FlatButton(
								child: Text(
									'Create new ranked game',
									style: TextStyle(
										color: constColors.btnTextColor,
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

class WhistPageRoute extends CupertinoPageRoute {
	WhistPageRoute() : super(builder: (BuildContext context) => Whist());

	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
			Animation<double> secondaryAnimation) {
		return FadeTransition(opacity: animation, child: Whist());
	}
}