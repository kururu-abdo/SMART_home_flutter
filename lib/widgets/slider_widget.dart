
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_devices_app/utils/utils.dart';
import 'package:smart_devices_app/widgets/custom_arch.dart';

class SliderWidget extends StatelessWidget {
  final double progressVal;
  final Color color;
  final Function(double) onChange;

  const SliderWidget(
      {super.key,
      required this.progressVal,
      required this.color,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kDiameter + 60,
      height: kDiameter + 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: kDiameter + 50,
            height: kDiameter + 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: CustomArc(
                color:color,
                diameter: kDiameter,
                sweepAngle: progressVal),
          ),

          Center(
            child: Container(
              width: kDiameter - 20,
              height: kDiameter - 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 15,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: SleekCircularSlider(
                min: kMinDegree,
                max: kMaxDegree,
                initialValue: angleRange(progressVal, kMinDegree, kMaxDegree),
                appearance: CircularSliderAppearance(
                  spinnerMode: false,
                  startAngle: 180,
                  angleRange: 180,
                  size: kDiameter - 30,
                  customWidths: CustomSliderWidths(
                    trackWidth: 20,
                    shadowWidth: 0,
                    progressBarWidth: 01,
                    handlerSize: 5,
                  ),
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    progressBarColor: Colors.transparent,
                    trackColor: Colors.transparent,
                    dotColor: color,
                  ),
                ),
                onChange: onChange,
                innerWidget: (percentage) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          percentage.toInt().toString(),
                          style: const TextStyle(
                              height: 0,
                              fontSize: 45,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "o",
                                style: TextStyle(
                                    height: 0,
                                    letterSpacing: 2,
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "C",
                                style: TextStyle(
                                    height: 0,
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
       
       
        ],
      ),
    );
  }
}
