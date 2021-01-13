class FrndChat {
  final String imgPath;
  final String name;
  final String latestMsg;
  final bool isOnline;
  final String lastMsgTime;

  FrndChat(
      {this.lastMsgTime,
      this.imgPath,
      this.name,
      this.isOnline,
      this.latestMsg});
}
