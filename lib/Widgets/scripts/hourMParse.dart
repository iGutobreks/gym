import 'package:gym_speed/Widgets/Home.dart';

// ignore: non_constant_identifier_names
int diff_hour_minutes(DateTime reachedTime) {
  int hourJoin = reachedTime.hour;
  int minuteJoin = reachedTime.minute;

  int hourLimit = limitTime.hour;
  int minuteLimit = limitTime.minute;

  int diffHour = hourJoin - hourLimit;
  int diffMinute = minuteJoin - minuteLimit;

  return (diffMinute + diffHour * 60).abs();
}