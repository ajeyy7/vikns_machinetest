import 'package:flutter/material.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';

class Tile extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String heading;
  final String number;
  final Color color;
  final String rs;

  const Tile(
      {super.key,
      this.onTap,
      required this.icon,
      required this.heading,
      required this.number,
      required this.rs,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade900,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 88,
                      width: 35,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(35)),
                      child: Icon(
                        icon,
                        color: Colors.green,
                        size: 17,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(heading,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: white)),
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
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
