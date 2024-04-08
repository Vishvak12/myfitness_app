



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfitness_app/models/category_model.dart';

class HomePage extends StatefulWidget {
    HomePage({super.key});

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
        crossAxisAlignment :CrossAxisAlignment.start,
        children: [
          _searchField(),
          SizedBox(height: 40,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 210),
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height:150,
                child: ListView.builder(itemCount: categories.length,
                  itemBuilder: 
                (context, index){
                  return Container();
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40, 
                spreadRadius: 0.0,
              ),
            ],
            
          ),
          child: TextField(
            decoration: InputDecoration(
              filled:true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search for healthy meals...',
              hintStyle: TextStyle(
                color: Color(0xffA1A5A6),
                fontSize: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                ),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
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
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child:SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height:20,
            width: 20,),
          decoration: BoxDecoration(
            color:Color(0xffF7F8F8),
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
}