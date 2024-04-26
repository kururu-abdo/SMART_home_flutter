import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_devices_app/data/model/device_model.dart';
import 'package:smart_devices_app/data/model/mode.dart';
import 'package:smart_devices_app/utils/extensions.dart';
import 'package:smart_devices_app/utils/utils.dart';
import 'package:smart_devices_app/widgets/slider_widget.dart';

class DeviceDetailsPage extends StatefulWidget {
  final DeviceModel? deviceModel;
  const DeviceDetailsPage({super.key, this.deviceModel});

  @override
  State<DeviceDetailsPage> createState() => _DeviceDetailsPageState();
}

class _DeviceDetailsPageState extends State<DeviceDetailsPage> {
   bool isActive = false;
  int speed = 1;
  double temp = 22.85;
  double progressVal = 0.49;
List<Mode>  modes 
=[
  Mode(title: 'Auto', icon: 'assets/images/letter-a.png',
   selectedMode: ValueNotifier(0), 
   
   ), 
Mode(title: 'cool', icon: 'assets/images/cool.png',
   selectedMode: ValueNotifier(0), 
   
   ), Mode(title: 'Day', icon: 'assets/images/daylight.png',
   selectedMode: ValueNotifier(0), 
   
   ), Mode(title: 'Night', icon: 'assets/images/moon.png',
   selectedMode: ValueNotifier(0), 
   
   ), 


];

int selectedWatt=0;
List<String> watts =[
  "8 watt" ,"9 watt" ,"12.5 watt" , "17 watt"
];


  @override
  Widget build(BuildContext context) {
    return    Scaffold(
body: SizedBox.expand(

  child: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
GestureDetector(
  onTap: (){
    Navigator.pop(context);
  },
  child: Container(
    width: 50,height: 50, 
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.grey.withOpacity(.2)
  ),
  
  child: const Center(child: Icon(Icons.arrow_back_ios , size: 20,)),
  ),
), 

Text(widget.deviceModel!.title!, 

style: const TextStyle(
  color: Colors.black ,fontWeight: FontWeight.bold
),
), 
Container(
  width: 50,height: 50, 
decoration: BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.grey.withOpacity(.2)
),

child: const Center(child: Icon(Icons.more_vert , size: 20,)),
), 


],
        ), 


SizedBox(height: context.deviceHeight*.05,),
Container(
  padding:const EdgeInsets.all(8) ,
  height:context.deviceHeight*.05,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withOpacity(
      .2
    )
  ),
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: watts.length,

    itemBuilder: (BuildContext context, int index) {
      return  GestureDetector(
        onTap: (){
          selectedWatt=index;
          setState(() {
            
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: context.deviceWidth/4,
          height:  context.deviceHeight*.03,
          margin:  const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
            selectedWatt==index?
             Colors.black:Colors.white
          ),
          child: Center(
            child: Text(
            watts[index] , 

            style: TextStyle(
          color:       selectedWatt==index?
             Colors.white:Colors.black,
             fontWeight: FontWeight.bold 

            ),
            ),
          ),
        ),
      ) ;
    },
  ),

),

SizedBox(height: context.deviceHeight*.03,),



const Text("Controller", style: TextStyle(
  fontWeight: FontWeight.bold
),),
SizedBox(height: context.deviceHeight*.01,),


    slider(),
  
    SizedBox(height: context.deviceHeight*.02,),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children:  
modes.asMap().map((i, mode) => MapEntry(i, 
Center(
        child: GestureDetector(
          onTap: (){
           for (var element in modes) {
            
            element.selectedMode!.value= i;
           }
           setState(() {
             
           });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: context.deviceWidth/6,
                height: context.deviceWidth/6,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              duration: const Duration(milliseconds: 200), 
              decoration: BoxDecoration(
                color: mode.selectedMode!.value==i?
                Colors.black :Colors.grey.withOpacity(.2), 
          
                borderRadius: BorderRadius.circular(10)
              )
              ,
              child: Center(
                child: Image.asset(
                  mode.icon! , 
             width: context.deviceWidth/12,
                height: context.deviceWidth/12,
                  color: mode.selectedMode!.value==i?
                Colors.white :Colors.black,
                ),
              ),
              ),
          
              Text(mode.title!, style: const TextStyle(
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      )

)).values.toList()

),


SizedBox(height: context.deviceHeight*.01,),

Container(
  height: context.deviceHeight*.15,
  width: context.deviceWidth,
  padding: const EdgeInsets.all(15),
  margin: const EdgeInsets.all(15),
  decoration:  BoxDecoration(
    color: Colors.grey.withOpacity(.2),
    borderRadius: BorderRadius.circular(20)
  ),

  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
children: [
  Text("Power consumption",  

style: TextStyle(
  color: Colors.black ,fontSize: 18 , fontWeight: FontWeight.bold
),



), 
Text("8 watt Smart Light",  

style: TextStyle(
  color: Colors.black ,fontSize: 15 , 
 fontWeight: FontWeight.w500
),



), 
],
      ), 


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [


          Row(mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 50,height: 50,
            decoration: const BoxDecoration(
              color: Colors.black , 
              shape: BoxShape.circle, 

            ),
            child: Center(
              child: Image.asset('assets/images/lightning.png'
              ,
              width: 50,height: 50,color: Colors.white,
              
              ),
            ),
            ), 
            const SizedBox(width: 8,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
Text("5kwh",  

style: TextStyle(
  color: Colors.black ,fontSize: 18 , fontWeight: FontWeight.bold
),



), 
Text("Today",  

style: TextStyle(
 color: Colors.black ,fontSize: 15 , 
 fontWeight: FontWeight.w500
),



), 



              ],
            )
          ],
          ) , 



          Row(mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 50,height: 50,
            decoration: const BoxDecoration(
              color: Colors.black , 
              shape: BoxShape.circle, 

            ),
            child: Center(
              child: Image.asset('assets/images/plug.png'
              ,
              width: 50,height: 50,color: Colors.white,
              
              ),
            ),
            ), 
            const SizedBox(width: 8,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
Text("120kw",  

style: TextStyle(
  color: Colors.black ,fontSize: 18 , fontWeight: FontWeight.bold
),



), 
Text("This month",  

style: TextStyle(
 color: Colors.black ,fontSize: 15 , 
 fontWeight: FontWeight.w500
),



), 



              ],
            )
          ],
          ) , 



        ],
      )
    ],
  ),
),
  SizedBox(height: context.deviceHeight*.01,),


 Container(
  height: context.deviceHeight*.08,
  padding: const EdgeInsets.all(8),
  margin: const EdgeInsets.all(15),
  decoration:  BoxDecoration(
    color: const Color(0xFF202020),
    borderRadius: BorderRadius.circular(20)
  ),

child: const Center(
  child: Text("Add new device" , 
  style: TextStyle(
    color: Colors.white, 
    fontSize: 20 , 
    fontWeight: FontWeight.bold
  ),
  ),
),
 )


      ],
    ),
  ),
),

    );
  }

   Widget slider() {
    return SliderWidget(
      progressVal: progressVal,
      color: Colors.blueAccent,
      onChange: (value) {
        setState(() {
          temp = value;
          progressVal = normalize(value, kMinDegree, kMaxDegree);
        });
      },
    );
  }
}