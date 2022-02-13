import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/counter_provider.dart';
import 'package:todoapp/providers/task_provider.dart';
import 'package:todoapp/utils/screen_helper.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scale = ScreenHelper.scale(context);
    final taskProvider = Provider.of<TaskProvider>(context);
    return Consumer<CounterProvider>(
        builder: (context, counterProvider, child) {
      return Scaffold(
          backgroundColor: const Color(0xFFF1F3F8),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF286FB4),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(150)),
                        border: Border.all(color: Colors.blueAccent)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: ScreenHelper.fontSize(20, scale),
                          ),
                          Text(
                            "Todo Application",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenHelper.fontSize(45, scale)),
                          ),
                          SizedBox(
                            height: ScreenHelper.fontSize(2, scale),
                          ),
                          Text(
                            "Simple Todo App for Practice",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: ScreenHelper.fontSize(18, scale)),
                          )
                        ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenHelper.fontSize(15, scale)),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Todo List (${taskProvider.totalTask})"),
                            Text("${taskProvider.totalTaskCompleted} Completed")
                          ]),
                      Row(
                        children: [
                          Consumer<TaskProvider>(
                              builder: (context, taskProvider, child) {
                            return Expanded(
                              child: taskProvider.totalTask > 0
                                  ? ListView.builder(
                                      itemCount: taskProvider.totalTask,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var task = taskProvider.tasks[index];
                                        return Card(
                                          child: Container(
                                            padding: EdgeInsets.all(
                                                ScreenHelper.fontSize(
                                                    10, scale)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${task.title}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    print(task.title);
                                                    taskProvider
                                                        .completedtask(task.id);
                                                  },
                                                  child: Text(
                                                    "Tandai?",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("No data found")
                                      ],
                                    ),
                            );
                          })
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
