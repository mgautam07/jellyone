String getEndTime(int time, int watchedTime) {
  final end = DateTime.now()
      .add(Duration(minutes: (time - (watchedTime / 60).floor())));
  if (end.minute < 10 && end.hour > 9) {
    return 'Ends at ${end.hour}: 0${end.minute}';
  } else if (end.minute > 9 && end.hour < 10) {
    return 'Ends at 0${end.hour}:${end.minute}';
  } else if (end.minute < 10 && end.hour < 10) {
    return 'Ends at 0${end.hour}:0${end.minute}';
  }
  return 'Ends at ${end.hour}:${end.minute}';
}

String convertRunTime(int time) {
  double h = time / 60;
  if (h.floor() == 0) {
    return '${time - (h.floor() * 60)}m';
  }
  return '${h.floor()}h ${time - (h.floor() * 60)}m';
}
