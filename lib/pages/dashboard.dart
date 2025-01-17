import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfitness_app/models/category_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//final Uri _url = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUIcmlja3JvbGw%3D');


List<ChartData> chartData = [
  ChartData('Calories Burnt', 1200),
  ChartData('Steps', 900),
  ChartData('Sleep', 80),
  ChartData('Water Intake', 2100),
];

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}

class ChartDataText extends StatelessWidget {
  final ChartData data;
  final Color color;
  final String unit;

  const ChartDataText({super.key, required this.data, required this.color, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          data.x,
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${data.y} $unit',
          style: TextStyle(
            color: color,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

List<Widget> _getChartDataTexts() {
  final List<Widget> texts = [];
  final List<Color> colors = [
    const Color(0xFFFF6422),
    const Color(0xFF08AD21),
    const Color(0xFF4043FF),
    const Color(0xFF03A3C7),
  ];
  final List<String> units = ['kcal', 'Kms', 'Hours', 'ML'];

  for (int i = 0; i < chartData.length; i++) {
    texts.add(
      ChartDataText(
        data: chartData[i],
        color: colors[i],
        unit: units[i],
      ),
    );
  }

  return texts;
}

class DashBoard extends StatefulWidget {
    const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
  
}

class _DashBoardState extends State<DashBoard> {
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
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left:20),
                child: Text(
                  'Health Overview',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
              height: 239,

              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 240,
                      child: SfCircularChart(
                          legend: Legend(
                            isVisible: false,
                            legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
                              Color color;
                              switch (name) {
                                case 'Calories Burnt':
                                  color = const Color(0xFFFF6422);
                                  break;
                                case 'Steps':
                                  color = const Color(0xFF08AD21);
                                  break;
                                case 'Sleep':
                                  color = const Color(0xFF4043FF);
                                  break;
                                case 'Water Intake':
                                  color = const Color(0xFF03A3C7);
                                  break;
                                default:
                                  color = Colors.black;
                              }
                              return Row(
                                children: <Widget>[
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(name),
                                  ),
                                ],
                              );
                            },
                          ),
                          series: <CircularSeries>[
                            RadialBarSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              pointColorMapper: (ChartData data, _) => _getPointColor(data),
                              cornerStyle: CornerStyle.bothCurve,

                            )
                          ]
                      ),
                    ),
                    Column(
                      children: _getChartDataTexts(),
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Color _getPointColor(ChartData data) {
    switch (data.x) {
      case 'Calories Burnt':
        return const Color(0xFFFF6422);
      case 'Steps':
        return const Color(0xFF08AD21);
      case 'Sleep':
        return const Color(0xFF4043FF);
      case 'Water Intake':
        return const Color(0xFF03A3C7);
      default:
        return Colors.black;
    }
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
    backgroundColor: const Color(0xFFFF9000),
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
          style: const TextStyle(
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

