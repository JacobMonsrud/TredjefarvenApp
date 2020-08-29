import 'package:flutter/material.dart';
import 'package:tredjefarven/util/const_colors.dart';
import 'package:tredjefarven/whist/round_whist.dart';
import 'package:tredjefarven/whist/game_whist.dart';

class BetweenRoundsWhist extends StatefulWidget {

	final Function(String) callback;
	final Game game;

	BetweenRoundsWhist(this.callback, this.game);

  @override
  _BetweenRoundsWhistState createState() => _BetweenRoundsWhistState();
}

class _BetweenRoundsWhistState extends State<BetweenRoundsWhist> {
	ConstColors constColors = ConstColors();
	List<TableRow> rows;
	List<String> playerNames;

	@override
  void initState() {
		// The p4, p1, p2, p3 order is on purpose!!
    playerNames = [widget.game.p4.name, widget.game.p1.name, widget.game.p2.name, widget.game.p3.name];
    super.initState();
  }

	@override
	Widget build(BuildContext context) {
		rows = [];
		for (int i = 0; i < this.widget.game.getPointLists()[0].length; i++) {
			rows.add(TableRow( children: [
				Text(i.toString(), style: TextStyle(color: constColors.textColor)),
				Text(this.widget.game.getPointLists()[0][i].toString(), style: TextStyle(color: constColors.textColor)),
				Text(this.widget.game.getPointLists()[1][i].toString(), style: TextStyle(color: constColors.textColor)),
				Text(this.widget.game.getPointLists()[2][i].toString(), style: TextStyle(color: constColors.textColor)),
				Text(this.widget.game.getPointLists()[3][i].toString(), style: TextStyle(color: constColors.textColor)),
			]));
		}
		//rows = rows.reversed.toList();

		return Scaffold(
			backgroundColor: constColors.bgColor,
			body: SafeArea(
					child: Column(
						children: <Widget>[
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceAround,
							  children: <Widget>[
							    Text(
							    	"Mellem runderne",
							    	style: TextStyle(
							    		fontSize: 40.0,
							    		color: constColors.titelColor,
							    	),
							    ),
							  ],
							),

							SizedBox(height: 10),

							Row(
								mainAxisAlignment: MainAxisAlignment.start,
							  children: <Widget>[
							    Text(
							    	"Nuværende stilling",
							    	style: TextStyle(
							    		color: constColors.textColor,
							    	),
							    ),
							  ],
							),

							SizedBox(height: 10),

							Table(
								border: TableBorder.all(),
								defaultVerticalAlignment: TableCellVerticalAlignment.middle,
								children: [
									TableRow( children: [
										Row(
											mainAxisAlignment: MainAxisAlignment.center,
										  children: <Widget>[
										    Text(
										    	"Runde",
										    	style: TextStyle(
										    		color: constColors.textColor,
										    	),
										    ),
										  ],
										),
										Text(
											this.widget.game.listOfPlayers[0].name,
											style: TextStyle(
												color: constColors.textColor,
											),
										),
										Text(
											this.widget.game.listOfPlayers[1].name,
											style: TextStyle(
												color: constColors.textColor,
											),
										),
										Text(
											this.widget.game.listOfPlayers[2].name,
											style: TextStyle(
												color: constColors.textColor,
											),
										),
										Text(
											this.widget.game.listOfPlayers[3].name,
											style: TextStyle(
												color: constColors.textColor,
											),
										),
									]),
								],
							),

							Expanded(
								child: SingleChildScrollView(
								  child: Table(
								  	border: TableBorder.all(),
										children: List.generate(rows.length, (index) {
											return rows[index];
										}),
								  ),
								),
							),

							SizedBox(height: 10),

							Row(
								mainAxisAlignment: MainAxisAlignment.start,
								children: <Widget>[
									Text(
										"Udspil næste runde: " + playerNames[(widget.game.p1.pointList.length % 4)],
										style: TextStyle(
											color: constColors.textColor,
										),
									),
								],
							),

							SizedBox(height: 10),

							Row(
								children: <Widget>[
									SizedBox(
										width: MediaQuery.of(context).size.width / 2 - 2,
										child: RaisedButton(
											child: Text(
												"Afslut spillet",
												style: TextStyle(
													color: constColors.btnTextColor,
												),
											),
											color: constColors.btnColor,
											onPressed: _endGameDialog,
										),
									),
									SizedBox(
										width: MediaQuery.of(context).size.width / 2 - 2,
										child: RaisedButton(
											child: Text(
												"Slet sidste runde",
												style: TextStyle(
													color: constColors.btnTextColor,
												),
											),
											color: constColors.btnColor,
											onPressed: _undoDialog,
										),
									),
								],
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							),
							Row(
								children: <Widget>[
									SizedBox(
										width: MediaQuery.of(context).size.width - 2,
										child: RaisedButton(
											child: Row(
											  children: <Widget>[
											    Text(
											    	"Næste runde",
											    	style: TextStyle(
											    		color: constColors.btnTextColor,
											    	),
											    ),
													Icon(Icons.arrow_forward),
											  ],
												mainAxisAlignment: MainAxisAlignment.center,
											),
											color: constColors.btnColor,
											onPressed: _nextRound,
										),
									),
								],
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							),
							SizedBox(height: 10.0,),
						],
					),
			),
		);
	}

	void _nextRound() {
		this.widget.callback("next");
	}

	void _endGame() {
		Navigator.of(context, rootNavigator: true).pop();
		this.widget.callback("end");
	}

	void _undoRound() {
		setState(() {
			Navigator.of(context, rootNavigator: true).pop();
			this.widget.game.undoLastRound();
		});
	}

	Future<bool> _undoDialog() async {
		return (await showDialog(
			context: context,
			builder: (context) => new AlertDialog(
				backgroundColor: constColors.toastColor,
				title: new Text(
					'Er du sikker på du vil slette sidste runde?',
					style: TextStyle(
						color: constColors.titelColor,
					),
				),
				actions: <Widget>[
					new FlatButton(
						onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
						child: new Text(
							'Nej',
							style: TextStyle(
								color: constColors.textColor,
							),
						),
					),
					new FlatButton(
						onPressed: _undoRound,
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

	Future<bool> _endGameDialog() async {
		return (await showDialog(
			context: context,
			builder: (context) => new AlertDialog(
				backgroundColor: constColors.toastColor,
				title: new Text(
					'Er du sikker på du vil afslutte spillet?',
					style: TextStyle(
						color: constColors.titelColor,
					),
				),
				actions: <Widget>[
					new FlatButton(
						onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
						child: new Text(
							'Nej',
							style: TextStyle(
								color: constColors.textColor,
							),
						),
					),
					new FlatButton(
						onPressed: _endGame,
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
