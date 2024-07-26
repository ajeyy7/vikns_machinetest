import 'package:flutter/material.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';

class ProfileTile extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final IconData iconsm;
  final String heading;
  final String number;
  final Color color;
  final String rs;

  const ProfileTile(
      {super.key,
      this.onTap,
      required this.icon,
      required this.heading,
      required this.number,
      required this.rs,
      required this.color,
      required this.iconsm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 30,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(icon),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(heading,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: white)),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              iconsm,
                              color: Colors.white,
                              size: 13,
                            )
                          ],
                        ),
                        Text(number,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: white)),
                        Text(rs,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
