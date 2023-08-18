import 'package:flutter/material.dart';

import 'carbooking.dart';

class RequiredMap extends StatefulWidget {
  const RequiredMap({Key? key}) : super(key: key);

  @override
  State<RequiredMap> createState() => _RequiredMapState();
}

class _RequiredMapState extends State<RequiredMap> {
  List<String> items = [
    "CityCab",
    "Rental",
    "OutStation",
  ];
  List<String> out = [
    "One Way",
    "Round-trip",
  ];
  int now = 0;

  List<IconData> icons = [
    Icons.directions_car_filled_sharp,
    Icons.car_rental,
    Icons.travel_explore_outlined,
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.menu_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.yellow,
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text(
            'CABTO',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Alumni_Sans',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0.5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  Container(
                      child: Image.asset(
                    'assets/IMG_20230817_092154.png',
                  )),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: TextField(
                          cursorHeight: 23,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: 'Select a Location',
                              hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  color: Colors.grey),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 25,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 85,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: 128,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      color: Colors.white70),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Icon(icons[index],
                                          color: current == index
                                              ? Colors.black
                                              : Colors.grey),
                                      Text(
                                        items[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: current == index
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: current == index,
                                  child: Container(
                                    width: 90,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10)),
                                        shape: BoxShape.rectangle),
                                  ))
                            ],
                          );
                        }),
                  ),
                  Visibility(
                    visible: current == 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 140,
                      width: double.infinity,
                      child: Stack(children: [
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.13,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: TextField(
                                cursorHeight: 20,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    label: const Text(
                                      'Destination',
                                      style: TextStyle(
                                          fontFamily: 'Inter', fontSize: 24),
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    fillColor: Colors.blueGrey.withOpacity(0.1),
                                    filled: true,
                                    focusedBorder: const OutlineInputBorder(),
                                    enabledBorder: InputBorder.none,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 25,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Visibility(
                    visible: current == 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 180,
                      width: double.infinity,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.13,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Select Package',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Booking()));
                                    });
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 4,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          '8 Hr',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '80 KM',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: current == 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 140,
                      child: Stack(children: [
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 1.13,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: TextField(
                                    cursorHeight: 20,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        label: const Text(
                                          'Destination',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 24),
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.start,
                                        fillColor:
                                            Colors.blueGrey.withOpacity(0.1),
                                        filled: true,
                                        focusedBorder:
                                            const OutlineInputBorder(),
                                        enabledBorder: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Colors.black,
                                          size: 25,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 300,
                                height: 100,
                                child: Container(
                                  height: 60,
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: out.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  now = index;
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Booking()));
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                margin: const EdgeInsets.all(5),
                                                width: 130,
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  color: now == index
                                                      ? Colors.grey
                                                          .withOpacity(0.4)
                                                      : Colors.white54,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: now == index
                                                      ? null
                                                      : Border.all(
                                                          color: const Color(
                                                              0xFFA5A5A5),
                                                          width: 2),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Visibility(
                                                        visible: now == index,
                                                        child: const Icon(
                                                          Icons.check,
                                                          size: 18,
                                                        )),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      out[index],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: now == index
                                                              ? Colors.black
                                                              : Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
