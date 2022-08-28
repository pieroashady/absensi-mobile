import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/mata_pelajaran_controller.dart';
import '../../models/data/mata_pelajaran_data.dart';
import '../rekap/rekap.dart';

class MapelList extends StatelessWidget {
  const MapelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapelC = Get.put(MataPelajaranController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Mata Pelajaran"),
        backgroundColor: Colors.redAccent,
      ),
      body: Obx(
        () => mapelC.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.2,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 20.0),
                        delegate: SliverChildBuilderDelegate(((context, index) {
                          var mapel = mapelC.getMataPelajaran().data?[index];
                          return _buildCategoryItem(mapel!);
                        }),
                            childCount:
                                mapelC.getMataPelajaran().data?.length ?? 0)),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCategoryItem(MataPelajaranData mataPelajaranData) {
    return MaterialButton(
      elevation: 4.0,
      highlightElevation: 1.0,
      onPressed: () {
        Get.to(RekapSiswa(
          mapelData: mataPelajaranData,
        ));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      textColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5.0),
          Text(
            mataPelajaranData.namaMapel!,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
