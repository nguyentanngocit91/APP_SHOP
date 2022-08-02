import 'package:flutter/material.dart';
import 'package:app_shop/resources/views/home/parallaxSample.dart';


class TabView_Customer extends StatefulWidget {
  @override
  _TabView_CustomerState createState() => _TabView_CustomerState();
}

class _TabView_CustomerState extends State<TabView_Customer> with SingleTickerProviderStateMixin {
  final List<Widget> myTabs = [
    Tab(child: Text("Tất cả", style: TextStyle(fontSize: 14,color: Color(0XFF3d3d3d),letterSpacing: 0.5),)),
    Tab(child: Text("Khách sạn - Du lịch", style: TextStyle(fontSize: 14,color: Color(0XFF3d3d3d),letterSpacing: 0.5),)),
    Tab(child: Text("Thiết bị điện", style: TextStyle(fontSize: 14,color: Color(0XFF3d3d3d),letterSpacing: 0.5),)),
    Tab(child: Text("Ô tô - Xe máy", style: TextStyle(fontSize: 14,color: Color(0XFF3d3d3d),letterSpacing: 0.5),)),
    Tab(child: Text("Bất động sản - Xây dựng", style: TextStyle(fontSize: 14,color: Color(0XFF3d3d3d),letterSpacing: 0.5),)),
    Tab(child: Text("Thương mại điện tử", style: TextStyle(fontSize: 14,color: Color(0XFF3d3d3d),letterSpacing: 0.5),)),

  ];


  late TabController _tabController;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  _listItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blueAccent,
        ),
      ),
      height: 120,
      child: Center(
        child: Text('List Item', style: TextStyle(fontSize: 20.0)),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 900,
      margin: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
         // _listItem(),
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            padding: EdgeInsets.all(10),
            tabs: myTabs,
            isScrollable: true,
          ),
          Center(
            child: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                      children: [

                     Expanded(child: GridView.builder(
                       controller: ScrollController(),
                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       primary: false,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           crossAxisSpacing: 6.0,
                           mainAxisSpacing: 6.0,
                           childAspectRatio: 0.6),
                       addAutomaticKeepAlives: false,
                       itemCount:10,
                       itemBuilder: (context,index){
                         return Image_Albums();
                       },
                     ),),
                   ],
                  )
              ),


              Column(
                children: [
                  Text('second tab'),
                  ...List.generate(10, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
            ][_tabController.index],
          ),
         // _listItem(),
         // _listItem(),

        ],
      ),

    );
  }

}



class Image_Albums extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {},
      child: SlideTransition_Image(),
      /*child:Container(
        width: 160,
        margin:EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                width: double.infinity,
                height: 270,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black),
                image: DecorationImage(
                  image: AssetImage("images/img1.jpg"),
                  fit: BoxFit.fill,
                ),
                ),
                /*child: CachedNetworkImage(
                  imageUrl:'https://nina.com.vn/thumbs/400x0x1/upload/product/11-8444.jpg',
                  fit: BoxFit.cover,
                ),*/
              ),

              Padding(padding: EdgeInsets.all(4.0),),

              Flexible(
                child:Container(
                  child:Text("Bất động sản - Xây dựng Hình",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(color: Color(0XFF223263),fontWeight:FontWeight.w700,letterSpacing: 0.5,fontSize: 12,),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.all(2.0),),

            ],
          ),
        ),
      ),*/

    );



  }
}