import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final String scheduleTitle, startTime, endTime;
  final List<String> participantNames;
  final Color cardColor;

  const ScheduleCard({
    super.key,
    required this.scheduleTitle,
    this.participantNames = const ["me"],
    required this.startTime,
    required this.endTime,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 가로 길이를 패딩 너비 전까지 늘림
      height: 195,
      padding: EdgeInsets.only(left: 20, top: 33, right: 20, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),
        color: cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                splitTime(startTime).first,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                ),
              ),
              Text(
                splitTime(startTime).last,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 3),
              Container(
                height: 25,
                width: 1,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const SizedBox(height: 3),
              Text(
                splitTime(endTime).first,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                ),
              ),
              Text(
                splitTime(endTime).last,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    settingTitle(scheduleTitle).first,
                    style: TextStyle(fontSize: 56, height: 0.86),
                  ),
                  Text(
                    settingTitle(scheduleTitle).last,
                    style: TextStyle(fontSize: 56, height: 0.86),
                  ),
                ],
              ),
              Row(
                children: [
                  for (var name in upperCaseName(participantNames))
                    Container(
                      margin: EdgeInsets.only(right: 25),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: name == "ME"
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              // .withValues(alpha: 0.4) -> 컬러에 투명도 옵션 붙이기
                              : Theme.of(context).colorScheme.onPrimaryContainer
                                    .withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<String> splitTime(String time) => time.split(":");

List<String> settingTitle(String title) {
  return title.toUpperCase().split(" ");
}

List<String> upperCaseName(List<String> names) {
  // 방법 1 (추천)
  // names 리스트를 돌면서(map), 대문자로 바꾸고, 다시 리스트로 만들어라(toList)
  return names.map((name) => name.toUpperCase()).toList();

  // 방법 2
  // List<String> result = [];
  // for (var name in names) {
  //   result.add(name.toUpperCase());
  // }
  // return result;
}
