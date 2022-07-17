import 'package:absensi_mobile/components/home/card_menu.dart';
import 'package:absensi_mobile/screens/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CardMenu(
                  onTap: () {
                    Get.to(const QRViewExample());
                  },
                  icon: Icons.subdirectory_arrow_right,
                  menuTitle: 'Absen Masuk',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: CardMenu(
                  icon: Icons.subdirectory_arrow_left,
                  menuTitle: 'Absen Keluar',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Expanded(
                child: CardMenu(
                  icon: Icons.calendar_month,
                  menuTitle: 'Rekap Kehadiran',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CardMenu(
                  icon: Icons.person,
                  menuTitle: 'My Profil',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
