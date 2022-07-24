import 'package:absensi_mobile/controllers/absen_siswa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RekapAbsenList extends StatelessWidget {
  const RekapAbsenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final absenC = Get.put(AbsenSiswaController());
    absenC.setAbsenSiswa();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kehadiran"),
        backgroundColor: const Color(0xffff2d55),
      ),
      body: Obx(
        () => absenC.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: absenC.absenSiswa.value.data!.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1.5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final item = absenC.absenSiswa.value.data![index];

                  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                  DateTime dateTime = dateFormat.parse(item.tanggal!);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      isThreeLine: true,
                      leading: Icon(item.keterangan == 'Izin' ||
                              item.keterangan == 'Sakit'
                          ? Icons.sick_outlined
                          : Icons.alarm_on_sharp),
                      trailing: Text(
                        item.siswa!.namaSiswa!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          DateFormat('dd MMM yyyy').format(dateTime),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("in: ${item.jamMasuk ?? '-'}"),
                          Text("out: ${item.jamKeluar ?? '-'}"),
                          const SizedBox(height: 5),
                          Text("ket: ${item.keterangan ?? 'Hadir'}")
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
