enum PraiseImages {
  thankYou(1, "assets/images/thank_you.png"),
  amazingWork(2, "assets/images/amazing.png"),
  makingWorkFun(3, "assets/images/make_work_fun.png"),
  goingAboveAndBeyond(4, "assets/images/going_above_beyond.png"),
  inspirationLeader(5, "assets/images/inspiration_leader.png"),
  greatPresentation(6, "assets/images/great_presentation.png"),
  teamPlayer(7, "assets/images/team_player.png"),
  outOfTheBoxThinker(8, "assets/images/outside_the_box.png");

  final int id;
  final String imgUrl;
  const PraiseImages(this.id, this.imgUrl);
}
