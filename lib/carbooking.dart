import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'car_details.dart';
import 'home_screen.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: 180,
                      child: Image.asset('assets/IMG_20230817_075811.png')),
                  Positioned(
                      top: 20,
                      left: 20,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RequiredMap()));
                            });
                          },
                          child: const Icon(Icons.arrow_back_sharp))),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 18),
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.green,
                              size: 30,
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 50),
                        height: 125,
                        width: 100,
                        child: Column(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: const TextField(
                                  cursorColor: Colors.black,
                                  cursorHeight: 25,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Source Location',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                )),
                            Container(
                                child: const TextField(
                              cursorColor: Colors.black,
                              cursorHeight: 25,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Destination Location',
                                labelStyle:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Stack(
                  children: [
                    const Positioned(
                      top: 20,
                      left: 10,
                      child: Text(
                        'Top Suggestions for you',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 90.0),
                          child: Text(
                            'PickUp Date Time',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                            height: 35,
                            padding: const EdgeInsets.only(
                              left: 180.0,
                              right: 10,
                            ),
                            child: TextField(
                              controller: dateinput,
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.calendar_today,
                                    size: 18, color: Colors.grey),
                                contentPadding: const EdgeInsets.all(2),
                                hintText: "DD/MM/YYYY Time",
                                hintStyle: const TextStyle(fontSize: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate = DateFormat.yMd()
                                      .add_jm()
                                      .format(pickedDate);
                                  setState(() {
                                    dateinput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                  child: SizedBox(
                      height: 390, width: double.infinity, child: CarInfo())),
            ],
          ),
        ),
      ),
    );
  }
}
