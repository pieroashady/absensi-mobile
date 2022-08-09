import 'package:absensi_mobile/controllers/rekap_absen_siswa.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RekapSiswa extends StatelessWidget {
  const RekapSiswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rekapC = Get.put(RekapAbsenController());

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'REKAP',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                'KEHADIRAN',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => rekapC.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          border: Border.all(color: Colors.red)),
                      child: Column(
                        children: [
                          _detailBox('Sakit',
                              ': ${rekapC.getRekap().data!.totalSakit}'),
                          _detailBox(
                              'Ijin', ': ${rekapC.getRekap().data!.totalIzin}'),
                          _detailBox(
                              'Alfa', ': ${rekapC.getRekap().data!.totalAlpa}'),
                        ],
                      ),
                    ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  border: Border.all(color: Colors.red)),
              child: Column(
                children: [
                  _bobot('Bobot Kehadiran', ': 35%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailBox(String desc, String result) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 100,
                child: Text(
                  desc,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 50),
              Text(result, style: const TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Widget _bobot(String desc, String result) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  desc,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(result,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
