import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';
import 'package:vikns_machinetest/view/components/bookinginvoicetile.dart';
import 'package:vikns_machinetest/view/components/graph.dart';
import 'invoicepage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: const BoxDecoration(color: Colors.black),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fitbit,
                          color: blue,
                          size: 34,
                        ),
                        Text(
                          'CabZing',
                          style: TextStyle(color: white, fontSize: 24),
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                    )
                  ],
                ),
              ),
              const GraphTile(),
              Tile(
                color: const Color.fromARGB(255, 255, 225, 223),
                onTap: () {},
                icon: Icons.sticky_note_2_outlined,
                heading: 'Bookings',
                number: '123',
                rs: 'Reserved',
              ),
              Tile(
                color: const Color.fromARGB(255, 210, 255, 212),
                onTap: () {
                  Get.to(() => const InvoicePage());
                },
                icon: Icons.propane_outlined,
                heading: 'Invoices',
                number: '10,232.00',
                rs: 'Rupees',
              )
            ],
          ),
        ),
      ),
    );
  }
}
