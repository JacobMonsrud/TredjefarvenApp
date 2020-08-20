import 'package:tredjefarven/whist/player_round_whist.dart';
import 'package:tredjefarven/whist/player_whist.dart';
import 'package:tredjefarven/whist/round_whist.dart';
import 'package:tredjefarven/util/const_bids.dart';
import 'package:tredjefarven/whist/scoresheet_whist.dart';

class Game {

	Player p1, p2, p3 ,p4;
	List<Player> listOfPlayers;
	ScoreSheet scoreSheet = ScoreSheet();
	ConstBids constBids = ConstBids();

	Game(Player p1, Player p2, Player p3, Player p4) {
		this.p1 = p1;
		this.p2 = p2;
		this.p3 = p3;
		this.p4 = p4;
		listOfPlayers = [p1, p2, p3, p4];
	}

	void reportNewRound(Round round) {
		print(round.biddingPlayer + " " + round.partners.toString() + " " + round.bidType + " " + round.bidSize.toString() + " " + round.tricksGotten.toString());

		Map<String, Player> mapPlayers = { "p1": this.p1, "p2": this.p2, "p3": this.p3, "p4": this.p4, };

		bool isNolo = [constBids.SOL, constBids.RENSOL, constBids.BORD, constBids.RENBORD].contains(round.bidType);

		if (isNolo) {
			double point = scoreSheet.getNoloPoint(round.bidType);


		} else {
			bool isTwoVsTwo = (round.partners.length == 1);

			double point = scoreSheet.getPoint(round.bidSize, round.tricksGotten);
			int multiplier = scoreSheet.getMultiplier(round.bidType);

			double totalPointForBidder = point * multiplier;
			double totalPointForOpposition = totalPointForBidder * -1;
			int isAloneMultiplier;

			List<String> opo = ["p1", "p2", "p3", "p4"];
			opo.remove(round.biddingPlayer);

			if (isTwoVsTwo) {
				opo.remove(round.partners[0]);
				isAloneMultiplier = 1;

				// The partner
				PlayerRound playerRoundPartner = PlayerRound(false, true, (totalPointForBidder > 0), round.bidSize.toString() + " " + round.bidType, totalPointForBidder);
				mapPlayers[round.partners[0]].reportNewRound(playerRoundPartner);

			} else {
				// 1 v 3
				isAloneMultiplier = 3;
			}

			// The bidder
			PlayerRound playerRoundBidder = PlayerRound(true, false, (totalPointForBidder > 0), round.bidSize.toString() + " " + round.bidType, totalPointForBidder * isAloneMultiplier);
			mapPlayers[round.biddingPlayer].reportNewRound(playerRoundBidder);

			// The two opposition
			for (String p in opo) {
				PlayerRound playerRoundOpo = PlayerRound(false, false, (totalPointForBidder < 0), round.bidSize.toString() + " " + round.bidType, totalPointForOpposition);
				mapPlayers[p].reportNewRound(playerRoundOpo);
			}
		}

	}

	void undoLastRound() {
		listOfPlayers.forEach((p) => p.undoLastRound());
	}

	List<List<double>> getPointLists() {
		return listOfPlayers.map((p) => p.pointList).toList();
	}

}