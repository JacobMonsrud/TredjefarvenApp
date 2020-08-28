class Round {

	String biddingPlayer, bidType;
	List<String> partnersOrNoloJoiners;
	int bidSize, tricksGotten;
	List<bool> noloWonLoseList;

	Round(this.biddingPlayer, this.partnersOrNoloJoiners, this.bidType, this.bidSize, this.tricksGotten, this.noloWonLoseList);

}