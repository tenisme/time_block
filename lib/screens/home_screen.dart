import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:time_block/widgets/schedule_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 37),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 26.5, // '반지름' 길이
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    Icon(
                      Symbols.add,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 35,
                      weight: 700.0,
                      // Icon 위젯에서 fontWeight는 사용 금지!
                      // fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MONDAY 16",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "TODAY",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            "·",
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.error,
                              height: 0.9,
                            ),
                          ),
                          Text(
                            "17 18 19 20 21 22 23 24 25 26 27 28 29 30 31",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
          // !!! SingleChildScrollView가 Column의 children일 때는 꼭 Expanded로 감싸줄 것 !!!
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ScheduleCard(
                      scheduleTitle: "Design Meeting",
                      startTime: "11:30",
                      endTime: "12:20",
                      participantNames: ["alex", "helena", "nana"],
                      cardColor: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(height: 8),
                    ScheduleCard(
                      scheduleTitle: "Daily Project",
                      startTime: "12:35",
                      endTime: "14:10",
                      participantNames: ["me", "Richard", "Ciry", "+4"],
                      cardColor: Theme.of(
                        context,
                      ).colorScheme.secondaryContainer,
                    ),
                    const SizedBox(height: 8),
                    ScheduleCard(
                      scheduleTitle: "Weekly Planning",
                      startTime: "15:00",
                      endTime: "16:30",
                      participantNames: ["Den", "Nana", "Mark"],
                      cardColor: Theme.of(
                        context,
                      ).colorScheme.tertiaryContainer,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
