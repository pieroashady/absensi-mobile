import 'package:absensi_mobile/components/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/profile/profile_header.dart';
import '../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userC = Get.put(UserController());
    userC.setUser();

    return Scaffold(
      body: Obx(
        () => userC.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  ProfileHeader(
                    avatar: userC.getUser().siswa!.fotoSiswa == null
                        ? NetworkImage(userC.getUser().siswa!.fotoSiswa!)
                        : const AssetImage("assets/images/default_profile.jpg")
                            as ImageProvider,
                    coverImage: const AssetImage("assets/images/image1.png"),
                    title: userC.getUser().siswa!.namaSiswa!,
                    subtitle: userC.getUser().siswa!.nis!,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  UserProfile(
                    user: userC.getUser(),
                  ),
                ],
              ),
      ),
    );
  }
}
