import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  const CardMenu(
      {Key? key, required this.icon, required this.menuTitle, this.onTap})
      : super(key: key);
  final IconData icon;
  final String menuTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(icon, size: 90),
              const SizedBox(
                height: 10,
              ),
              Text(
                menuTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
