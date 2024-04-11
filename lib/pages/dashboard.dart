import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfitness_app/models/category_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
final Uri _url = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUIcmlja3JvbGw%3D');


List<ChartData> chartData = [
  ChartData('A', 50),
  ChartData('B', 30),
  ChartData('C', 20),
  ChartData('D', 10),
];

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}

class HomePage extends StatefulWidget {
    const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  void _getCategories(){
    categories = CategoryModel.getCategories();
  }
  @override
  void initState(){
    super.initState();
    _getCategories();
  }
  @override
  Widget build(BuildContext context) {
    _getCategories();


    return Scaffold(

      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left:20),
                child: Text(
                  'Quick Overview',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
              height: 300,
              
              child: Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Center(
                    child:
                       SfCircularChart(
                            series: <CircularSeries>[
                              // Renders radial bar chart
                              RadialBarSeries<ChartData, String>(
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  cornerStyle: CornerStyle.bothCurve,
                              )
                            ]
                        )
                    ),
              ),
                            ),
              
            ],
          )
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40, 
                spreadRadius: 0.0,
              ),
            ],
            
          ),
          child: TextField(
            decoration: InputDecoration(
              filled:true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Search for healthy meals...',
              hintStyle: const TextStyle(
                color: Color(0xffA1A5A6),
                fontSize: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        indent:10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/icons/Filter.svg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
  }
  AppBar appBar() {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Plan",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          _getFormattedDate(), // Call function to get the formatted date
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    ),
      
      leading: GestureDetector(
        onTap: () {
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child:SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height:20,
            width: 20,),
          decoration: BoxDecoration(
            color:const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    actions: [
      GestureDetector(
        onTap: (){

        },
        child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 37,
        child:SvgPicture.asset(
          'assets/icons/dots.svg',
       height:5,
       width: 5,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
        ),
    )],
      );
  }
  
String _getFormattedDate() {
  // Get the current date
  DateTime now = DateTime.now();
  
  // Format the date
  String formattedDate = "${_getDayName(now.weekday)}, ${now.day} ${_getMonth(now.month)}";
  
  return formattedDate;
}

String _getDayName(int day) {
  // Get the day name based on the day of the week
  switch (day) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return '';
  }
}
String _getMonth(int month) {
  // Get the month name based on the month number
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
    return 'July';
      case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
    }
  }
}