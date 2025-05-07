import 'package:app.rynest.aasi/features/examination/model/exam.dart';
import 'package:app.rynest.aasi/utils/datetime_utils.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestartHistory extends ConsumerWidget {
  const RestartHistory(this.exam, {super.key});

  final Exam? exam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = exam?.session;
    final countRestart = (exam?.restart ?? 0) > 0 ? "(${exam?.restart} kali restart)" : "";

    debugPrint("Restart History Build/Rebuild, with session length: ${sessions?.length}");
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Session History $countRestart')),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = sessions?[index];
              final duration = item?.restartAt?.difference(exam!.startAt!);

              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mulai Ujian: ${item?.restartAt?.custom('d MMM yyyy - HH:mm')}"),
                          Text("Nama Perangkat: ${item?.deviceName}"),
                        ],
                      ),
                      // title: FieldList(caption: Text("Device Name:"), value: Text("${item?.deviceName}")),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Lokasi: ${item?.location}"),
                          Text("IP Address: ${item?.ipAddress}"),
                        ],
                      ),
                      // trailing: Text("${item?.restart}"),
                    ),
                  ),
                );
              } else {
                final minutes = duration?.inMinutes.abs() ?? 0;
                final seconds = duration?.inSeconds.abs() ?? 0;
                final durationStr = minutes > 0 ? "$minutes menit" : "$seconds detik";
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Restart Ujian ke-${item?.restart}: $durationStr setelah mulai"),
                          Text("Device Name: ${item?.deviceName}"),
                        ],
                      ),
                      // title: FieldList(caption: Text("Device Name:"), value: Text("${item?.deviceName}")),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Lokasi: ${item?.location}"),
                          Text("IP Address: ${item?.ipAddress}"),
                        ],
                      ),
                      // trailing: Text("${item?.restart}"),
                    ),
                  ),
                );
              }
            },
            separatorBuilder: (context, index) => 5.height,
            itemCount: sessions?.length ?? 0,
          ),
        ),
      ),
    );
  }
}
