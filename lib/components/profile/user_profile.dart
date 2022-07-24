import 'package:absensi_mobile/models/data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dob = dateFormat.parse(user.siswa!.tanggalLahir!);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Data Diri",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.only(top: 10),
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            leading: const Icon(Icons.school),
                            title: const Text("Kelas"),
                            subtitle: Text(user.siswa!.kelas!.namaKelas ?? "-"),
                          ),
                          ListTile(
                            leading: const Icon(Icons.phone),
                            title: const Text("No. Telfon"),
                            subtitle: Text(user.siswa!.phoneNumber ?? "-"),
                          ),
                          ListTile(
                            leading: const Icon(Icons.my_location),
                            title: const Text("Tempat / Tgl Lahir"),
                            subtitle: Text(
                                "${user.siswa!.tempatLahir}, ${DateFormat('dd MMM yyyy').format(dob)}"),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
