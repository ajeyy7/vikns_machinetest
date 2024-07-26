import 'package:flutter/material.dart';
import 'package:vikns_machinetest/view/components/filterbox.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Filter",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.visibility_outlined,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Text(
                  "Filter",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(height: 30),
          const Filterbox(
            txt: 'This Month',
            lastticon: Icons.keyboard_arrow_down,
            width: 120,
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Filterbox(
                  width: 120,
                  txt: '12/09/2023',
                  fronticon: Icons.calendar_month,
                ),
              ),
              Flexible(
                child: Filterbox(
                  width: 120,
                  txt: '12/09/2023',
                  fronticon: Icons.calendar_month,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: Filterbox(
                  width: 110,
                  txt: 'Pending',
                ),
              ),
              Flexible(
                flex: 1,
                child: Filterbox(
                  width: 110,
                  txt: 'Invoiced',
                ),
              ),
              Flexible(
                flex: 1,
                child: Filterbox(
                  width: 110,
                  txt: 'Cancelled',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black45,
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
            items: const [
              DropdownMenuItem(
                  value: "Customer",
                  child: Text(
                    "Customer",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Filterbox(
                width: 140,
                txt: 'Savad farooq',
                lastticon: Icons.close_sharp,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
