import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_devices_app/data/model/device_model.dart';
import 'package:smart_devices_app/pages/device_details.dart';
import 'package:smart_devices_app/utils/extensions.dart';
import 'dart:math' as math;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



List<DeviceModel> devices = 

[
DeviceModel(title: 'Smart Light',
 numOfDevices: 4, icon: 'assets/images/smart-light.png', 
 
 isEnabled: ValueNotifier(true)
 ), 

 DeviceModel(title: 'Smart AC',
 numOfDevices: 2, icon: 'assets/images/smart-ac.png', 
 
 isEnabled: ValueNotifier(false)
 ), 
DeviceModel(title: 'Smart TV',
 numOfDevices: 1, icon: 'assets/images/smart-tv.png', 
 
 isEnabled: ValueNotifier(false)
 ), 
DeviceModel(title: 'Smart Speaker',
 numOfDevices: 2, icon: 'assets/images/loud-speaker.png', 
 
 isEnabled: ValueNotifier(false)
 ), 


];



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 
    size.width / 5
    // (size.height - kToolbarHeight - 24) 
    // / 5
    
    ;
    final double itemWidth = size.width / 5;
 return  Scaffold(
   body: Container(
    child:  SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 15
      ),
      child: Column(
        children: [
   const SizedBox(height: 100,), 
   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    const Text("Hello , Kururu" , 
    style: TextStyle(
      color: Colors.black ,
      fontSize: 20 ,fontWeight: FontWeight.bold
    ),
    ), 
   
   
   
    Container(
      height: 50, width: 50,
   
      decoration: BoxDecoration(
        shape: BoxShape.circle , 
        color: Colors.grey.withOpacity(.2) , 
        
      ),
      child: const Center(
        child: Stack(
          children: [ 
            Icon(Icons.notifications_outlined, 
            size: 30,
            ), 
          Positioned(
            top: -30,
            right: 0,
            child: Text(".", style: TextStyle(
              color: Colors.blueAccent , 
              fontSize: 36 , fontWeight: FontWeight.bold
            ),),
          )
          ],
        ),
      ),
    )
    ],
   
   
   )
   
   , 
   SizedBox(height:context.deviceHeight*.05,
   
   )
   , 

   Container(
height:context.deviceHeight*.20,
width: context.deviceWidth,
padding: const EdgeInsets.all(20),
decoration:  BoxDecoration(
  color: const Color(0xFF202020), 
  borderRadius: BorderRadius.circular(20)
),
child:  Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween
  ,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text("18° C" ,style: TextStyle(
  fontSize: 36 , color: Colors.white, 
  fontWeight: FontWeight.bold
  
),)
, 
Text("Cloudy" ,style: TextStyle(
  fontSize: 25 , color: Colors.white, 
  fontWeight: FontWeight.bold
  
),)
, 

Text("Tue ,February 24" ,style: TextStyle(
  fontSize: 18 , color: Colors.white, 
  fontWeight: FontWeight.w300
  
),)
, 


  ],
)
, 

Image.asset("assets/images/cloudy.png"

, height: context.deviceHeight*.10,
)


  ],
),


    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text("Indoor temp" , style: TextStyle(
      fontSize: 15,
      color: Colors.white ,fontWeight: FontWeight.bold
    ),), 
    SizedBox(height: context.deviceHeight*.005,), 

     const Text("23° C" , style: TextStyle(
      fontSize: 15,
      color: Colors.white ,fontWeight: FontWeight.w300
    ),), 
  ],
)


,
Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text("Humidity" , style: TextStyle(
      fontSize: 15,
      color: Colors.white ,fontWeight: FontWeight.bold
    ),), 
    SizedBox(height: context.deviceHeight*.005,), 

     const Text("20%" , style: TextStyle(
      fontSize: 15,
      color: Colors.white ,fontWeight: FontWeight.w300
    ),), 
  ],
)

,
Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text("Air Quality" , style: TextStyle(
      fontSize: 15,
      color: Colors.white ,fontWeight: FontWeight.bold
    ),), 
    SizedBox(height: context.deviceHeight*.005,), 

     const Text("Good" , style: TextStyle(
      fontSize: 15,
      color: Colors.white ,fontWeight: FontWeight.w300
    ),), 
  ],
)





      ],
    )
  ],
),
   )
   , 
SizedBox(height:context.deviceHeight*.05,
   
   )
   , 
Container(
  padding:const EdgeInsets.all(8) ,
  height:context.deviceHeight*.05,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withOpacity(
      .2
    )
  ),
  child: Row(
    children: [
      Expanded(child: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          color: Colors.white
        ),
        child: const Center(
          child: Text(
            "Room" , 
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold
              
            ),
          ),
        ),
      )
      
      ), 
      SizedBox(width: context.deviceWidth*.01,),
       Expanded(child: Container(
        
        decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

          color:const Color(0xFF202020)
        ),
         child: const Center(
          child: Text(
            "Devices" , 
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
              
            ),
          ),
        ),
      )), 
    ],
  ),
)
,
SizedBox(height:context.deviceHeight*.01,
   
   )

, 


GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: devices.map((DeviceModel model) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(

                  MaterialPageRoute(builder: (_)=> 
                  
                  DeviceDetailsPage(
                    deviceModel: model,
                  )
                  )
                );
              },
              child: ValueListenableBuilder(
                valueListenable: model.isEnabled!,
                 builder: (context, isEnabled, child) {
                  return AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 400
                    ),
                    decoration: BoxDecoration(
                      color:
                      isEnabled?const Color(0xFF202020):
                      
                       Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(20),
                  
                  
                   
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                    width: 60, 
                    height: 60 , 
                    
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, 
                      color: Colors.white
                    ),
                    child: Center(
                      child: Image.asset(model.icon!, 
                      width: 30, 
                    height: 30 , 
                      
                      ),
                    ),
                  )
                   
                   
                   , 
                  
                   Transform.rotate(
                   angle: -math.pi/2,
                    child: CupertinoSwitch(onChanged: (value){
                   
                   model.isEnabled!.value= !  model.isEnabled!.value;
              
                    }, 
                    value: isEnabled,
                    activeColor: Colors.white,
                    thumbColor: Colors.blueAccent,
                    ),
                   )
                   
                   
                   
                    ],
                  )
                  , 
                  
                  
                   Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(model.title!, 
                  style: TextStyle(
                    color: isEnabled?Colors.white:Colors.black,
                    fontSize: 18 , fontWeight: FontWeight.bold
                  ),
                  ), 
              
              Text("${model.numOfDevices!} Device", 
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16 , fontWeight: FontWeight.bold
                  ),
                  ), 
              
              
              
                    ],
                  )
                  
                    ],
                   ),
                  );
                }
              ),
            );
          }).toList(),
        ),


        ],
      ),
    ),
   ),
 );


  }
}