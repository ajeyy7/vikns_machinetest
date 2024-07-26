import 'package:flutter/material.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';

class Filterbox extends StatelessWidget {
  final IconData? fronticon;
  final IconData? lastticon;
  final String? txt;
  final double width;
  const Filterbox(
      {super.key,
      this.fronticon,
      this.lastticon,
      this.txt,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width,
      decoration: BoxDecoration(
          color: bluegrey, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            fronticon,
            color: Colors.blue,
          ),
          Text(
            txt ?? '',
            style: const TextStyle(color: white),
          ),
          Icon(
            lastticon,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
