//Todo: http and Dio used for connecting project with API Internet

import 'package:flutter/material.dart';

import '../../../data/models/task.dart';
import '../../ui_widgets/profile_summary_card.dart';
import '../../ui_widgets/summary_card.dart';
import '../../ui_widgets/task_item_card.dart';

class ProgressTasksScreen extends StatefulWidget {
  const ProgressTasksScreen({super.key, /*required this.task*/});
  // final Task task;
  @override
  State<ProgressTasksScreen> createState() => _ProgressTasksScreenState();
}

class _ProgressTasksScreenState extends State<ProgressTasksScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const ProfileSummaryCard(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SummaryCard(
                      count: 39,
                      title: "New",
                    ),
                    SummaryCard(
                      count: 39,
                      title: "In Progress",
                    ),
                    SummaryCard(
                      count: 39,
                      title: "Completed",
                    ),
                    SummaryCard(
                      count: 39,
                      title: "Cancelled",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                // return TaskItemCard(/*task: widget.task.title!,*/
                // );
              },
            )),
          ],
        ),
      ),
    );
  }
}
