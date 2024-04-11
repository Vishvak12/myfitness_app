import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(activities[index]),
            // Add any additional information or actions for each activity here
          );
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Column(
        children: [
          Text('Activities',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),leading: GestureDetector(
        onTap: () {
            
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child:SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height:20,
            width: 20,),
        ),
      ),
    
    );
  }
}

// Replace this with your actual list of activities/exercises
List<String> activities = [
  'Running',
  'Cycling',
  'Swimming',
  'Weightlifting',
  // Add more activities here
];