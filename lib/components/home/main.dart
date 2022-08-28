import 'package:absensi_mobile/components/mapel/mapel_list.dart';
import 'package:absensi_mobile/components/rekap/rekap.dart';
import 'package:absensi_mobile/screens/profile_screen.dart';
import 'package:absensi_mobile/screens/rekap_absen_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth.controller.dart';
import '../../screens/qr_scanner.dart';
import 'card_menu.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CardMenu(
                  onTap: () {
                    Get.to(const MapelList(from: "absen"));
                  },
                  icon: Icons.subdirectory_arrow_right,
                  menuTitle: 'Absen Masuk',
                ),
              ),
              // const SizedBox(
              //   width: 10,
              // ),
              // Expanded(
              //   child: CardMenu(
              //     onTap: () {
              //       Get.to(const QRViewExample(
              //         absenType: 'keluar',
              //       ));
              //     },
              //     icon: Icons.subdirectory_arrow_left,
              //     menuTitle: 'Absen Keluar',
              //   ),
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CardMenu(
                  onTap: () {
                    Get.to(const MapelList(from: "rekap"));
                  },
                  icon: Icons.calendar_month,
                  menuTitle: 'Rekap Kehadiran',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CardMenu(
                  onTap: () {
                    Get.to(const ProfileScreen());
                  },
                  icon: Icons.person,
                  menuTitle: 'My Profil',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: MaterialButton(
            onPressed: () async {
              await authC.handleLogout();
            },
            color: const Color(0xffff2d55),
            elevation: 0,
            minWidth: 400,
            height: 50,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ), //since this is only a UI app
            child: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
