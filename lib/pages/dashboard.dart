import 'package:flutter/material.dart';
import 'package:smart_devices_app/pages/home.dart';
import 'package:smart_devices_app/utils/extensions.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages =[
const Home()

    ];
    return  Scaffold(

      body: SizedBox.expand(
        child: Stack(
          children: [

pages[0]

,
Align(
alignment: Alignment.bottomCenter,
child:

 Container(
  height: context.deviceHeight*.08,
  padding: const EdgeInsets.all(8),
  margin: const EdgeInsets.all(15),
  decoration:  BoxDecoration(
    color: const Color(0xFF202020),
    borderRadius: BorderRadius.circular(20)
  ),
  child: Center(
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

Container(
width: context.deviceWidth*.10,

decoration:  BoxDecoration(
  color: Colors.white, 
  borderRadius: BorderRadius.circular(15)
),
child: Center(
  child: Image.asset('assets/images/home.png', 
  width:context.deviceWidth*.05 ,
  color: Colors.blueAccent,
  ),
),
)

, 



       
Container(
width: context.deviceWidth*.10,

decoration:  const BoxDecoration(
  // color: Colors.white, 
  // borderRadius: BorderRadius.circular(15)
),
child: Center(
  child: Image.asset('assets/images/dashboard.png', 
  width:context.deviceWidth*.05 ,
  color: Colors.white,
  ),
),
)
, 

       
Container(
width: context.deviceWidth*.10,

decoration:  const BoxDecoration(
  // color: Colors.white, 
  // borderRadius: BorderRadius.circular(15)
),
child: Center(
  child: Image.asset('assets/images/settings.png', 
  width:context.deviceWidth*.05 ,
  color: Colors.white,
  ),
),
)
  ,     
Container(
width: context.deviceWidth*.10,

decoration:  const BoxDecoration(
  // color: Colors.white, 
  // borderRadius: BorderRadius.circular(15)
),
child: Center(
  child: Image.asset('assets/images/avatar.png', 
  width:context.deviceWidth*.05 ,
  color: Colors.white,
  ),
),
)




      ],
    )
  ),
),
)

          ],
        ),
      ),
    );
  }
}