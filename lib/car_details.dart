import 'package:budhana_task/carModel.dart';
import 'package:flutter/material.dart';

class CarInfo extends StatefulWidget {
  const CarInfo({Key? key}) : super(key: key);

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  List<CarDetails> cars = [
    CarDetails(
        name: 'Maruti Swift Dzire or Similar',
        price: '3729',
        type: 'Sedan',
        url: 'assets/pngegg.png'),
    CarDetails(
        name: 'Toyota Innova 6+1 or similar',
        price: '5832',
        type: 'SUV',
        url: 'assets/innova.png'),
    CarDetails(
        name: 'Toyota Innova Crysta 6+1 or similar',
        price: '8068',
        type: 'Crysta',
        url: 'assets/innova.png'),
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: cars.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 2,
            );
          },
          itemBuilder: (ctx, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              height: 118,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    current = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: current == index
                        ? Border.all(color: Colors.grey)
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: current == index
                            ? Colors.grey.withOpacity(0.4)
                            : Colors.white,
                        spreadRadius: current == index ? 5 : 0,
                        blurRadius: current == index ? 5 : 0,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: Image.asset('${cars[index].url}'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cars[index].type,
                                    style: const TextStyle(
                                        fontFamily: 'Intern',
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    cars[index].name,
                                    style: const TextStyle(
                                      fontFamily: 'Intern',
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '₹${cars[index].price}',
                                    style: const TextStyle(
                                        fontFamily: 'Intern',
                                        fontSize: 20,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Icon(Icons.info_outline),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
