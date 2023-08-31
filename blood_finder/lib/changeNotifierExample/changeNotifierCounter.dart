import 'dart:developer';

import 'package:blood_finder/changeNotifierExample/count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountChanges extends StatelessWidget {
  const CountChanges({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You are push the button:"),
            Consumer(builder: (context, WidgetRef ref, child) {
              final cnt = ref.watch(counter);
              cnt.nameInit(["A+", "B+"]);
              return Text('${cnt.count}');
            }),
            SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(builder: (context, WidgetRef ref, child) {
                  return FloatingActionButton(
                    onPressed: () => ref.read(counter.notifier).increment(),
                    child: Icon(Icons.add),
                  );
                }),
                SizedBox(
                  width: 30,
                ),
                Consumer(builder: (context, WidgetRef ref, child) {
                  return FloatingActionButton(
                    onPressed: () => ref.read(counter.notifier).decrement(),
                    child: Icon(Icons.remove),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
