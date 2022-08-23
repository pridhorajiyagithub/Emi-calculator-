import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: emiCal(),
    ),
  );
}

class emiCal extends StatefulWidget {
  const emiCal({Key? key}) : super(key: key);

  @override
  State<emiCal> createState() => _emiCalState();
}

class _emiCalState extends State<emiCal> {
  int finalEMI = 0;
  double loanAmountSliderVal = 10000;
  double interestRateSliderVal = 1;
  double loanTenureSliderVal = 1;

  double loanAmountMinVal = 10000;
  double loanAmountMaxVal = 200000;

  double interestRateMinVal = 1;
  double interestRateMaxVal = 100;
  double loanTenureMinVal = 1;

  double loanTenureMaxVal = 96;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "EMI Calculator",
        ),
        backgroundColor: const Color(0xff20295c),
        centerTitle: true,
      ),
      body: Stack(
        alignment: const Alignment(0, 0.95),
        children: [
          //background layer
          Container(
            color: const Color(0xff20295c),
            height: double.infinity,
            width: double.infinity,
            alignment: const Alignment(0, -1),
            child: Text(
              " \u{20B9} $finalEMI",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //foreground layer
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*   getWidget("Loan Amount", loanAmountSliderVal, loanAmountMinVal,
                    loanAmountMaxVal),
                getWidget("Interest Rate", interestRateSliderVal,
                    interestRateMinVal, interestRateMaxVal),
                getWidget("Loan Tenure", loanTenureSliderVal, loanTenureMinVal,
                    loanTenureMaxVal),*/
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Loan Amount",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff484848),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          "Loan Amount",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe5e6e8),
                          ),
                        ),
                        Text(
                          "${loanAmountSliderVal.toInt()}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: loanAmountSliderVal,
                      onChanged: (val) {
                        setState(() {
                          loanAmountSliderVal = val;
                        });
                      },
                      min: loanAmountMinVal,
                      max: loanAmountMaxVal,
                      thumbColor: const Color(0xff20295c),
                      activeColor: Colors.deepPurple.withOpacity(0.2),
                      inactiveColor: Colors.deepPurple.withOpacity(0.2),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Interest Rate",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff484848),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          "Interest Rate",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe5e6e8),
                          ),
                        ),
                        Text(
                          "${interestRateSliderVal.toInt()}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: interestRateSliderVal,
                      onChanged: (val) {
                        setState(() {
                          interestRateSliderVal = val;
                        });
                      },
                      min: interestRateMinVal,
                      max: interestRateMaxVal,
                      thumbColor: const Color(0xff20295c),
                      activeColor: Colors.deepPurple.withOpacity(0.2),
                      inactiveColor: Colors.deepPurple.withOpacity(0.2),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Loan Tenure",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff484848),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          "Loan Tenure",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe5e6e8),
                          ),
                        ),
                        Text(
                          "${loanTenureSliderVal.toInt()}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: loanTenureSliderVal,
                      onChanged: (val) {
                        setState(() {
                          loanTenureSliderVal = val;
                        });
                      },
                      min: loanTenureMinVal,
                      max: loanTenureMaxVal,
                      thumbColor: const Color(0xff20295c),
                      activeColor: Colors.deepPurple.withOpacity(0.2),
                      inactiveColor: Colors.deepPurple.withOpacity(0.2),
                    ),
                  ],
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Color(0xffefefef),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            height: 600,
            width: double.infinity,
          ),

          InkWell(
            onTap: () {
              double P = loanAmountSliderVal;
              double R = interestRateMaxVal / 12 / 100;
              double N = loanTenureSliderVal;
              setState(() {
                finalEMI = P * R * pow((1 + R), N) ~/ ((pow(1 + R, N)) - 1);
              });
            },
            child: Ink(
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffe7eaff),
                  border: Border.all(
                    color: const Color(0xff20295c).withOpacity(0.5),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 26,
                        color: Color(0xff2c3568),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getWidget(
      String title, double sliderVal, double minVal, double maxVal) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xff484848),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xffe5e6e8),
              ),
            ),
            Text(
              "${sliderVal.toInt()}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Slider(
          value: sliderVal,
          onChanged: (val) {
            setState(() {
              sliderVal = val;
            });
          },
          min: minVal,
          max: maxVal,
          thumbColor: const Color(0xff20295c),
          activeColor: Colors.deepPurple.withOpacity(0.2),
          inactiveColor: Colors.deepPurple.withOpacity(0.2),
        ),
      ],
    );
  }
}
