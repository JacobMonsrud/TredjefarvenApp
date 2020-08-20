import 'package:tredjefarven/whist/player_stats_whist.dart';
import 'package:tredjefarven/whist/round_whist.dart';
import 'package:tredjefarven/whist/player_round_whist.dart';

class Player {

	String name;
	List<double> pointList, pointGottenEachRound;
	PlayerStats stats;

	Player(String name) {
		this.name = name;
		pointList = [0];
		stats = PlayerStats();

		pointGottenEachRound = [0];
	}

	void reportNewRound(PlayerRound round) {
		pointList.add(round.point + this.pointList.last);
		pointGottenEachRound.add(round.point);

		_reportRoundToStats(round);
	}

	void _reportRoundToStats(PlayerRound round) {}

	void undoLastRound() {
		this.pointList.removeLast();
	}

}
