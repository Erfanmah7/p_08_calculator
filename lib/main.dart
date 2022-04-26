import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Size size;
  String number1 = '';
  String number2 = '';
  String mark = '';
  String viewnumber = '';
  String viewnumber1 = '';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                '$viewnumber',
                style: TextStyle(fontSize: 25,color: Colors.grey[800]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                '$viewnumber1',
                style: TextStyle(fontSize: 60),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          numbers('1'),
                          numbers('2'),
                          numbers('3'),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  marke('+'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          numbers('4'),
                          numbers('5'),
                          numbers('6'),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  marke('-'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          numbers('7'),
                          numbers('8'),
                          numbers('9'),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  marke('×'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          marke('C'),
                          numbers('0'),
                          marke('='),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  marke('/'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget numbers(String num) {
    return Container(
      width: 50,
      height: 50,
      child: RawMaterialButton(
        fillColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$num',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          fun(num);
        },
      ),
    );
  }

  Widget marke(String marker) {
    return Container(
      width: 50,
      height: 50,
      child: RawMaterialButton(
        fillColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$marker',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          fun(marker);
        },
      ),
    );
  }

  void fun(String num) {
    setState(() {

      if (num == 'C') {
        viewnumber = '';
        viewnumber1 = '';
        number1 = '';
        number2 = '';
        mark = '';
      } else if (num == '=') {
        switch (mark) {
          case '+':
            viewnumber1 = (int.parse(number1) + int.parse(number2)).toString();
            break;
          case '-':
            viewnumber1 = (int.parse(number1) - int.parse(number2)).toString();
            break;
          case '×':
            viewnumber1 = (int.parse(number1) * int.parse(number2)).toString();
            break;
          case '/':
            viewnumber1 = (int.parse(number1) / int.parse(number2)).toString();
            break;
        }
      } else {

        if (num == '+' || num == '-' || num == '×' || num == '/') {
          mark = num;
        } else {
          if (mark == '') {
            number1 += num;
          } else {
            number2 += num;
          }
        }
        viewnumber += num;
      }
    });
  }
}
