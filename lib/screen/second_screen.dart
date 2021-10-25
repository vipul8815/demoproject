import 'package:demo_app/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/style/style.dart';
import 'package:demo_app/widget/appBar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isLoading = false;
  List dataList = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    final result = await Api().getDataList();
    setState(() {
      isLoading = false;
      dataList = (result is List ? result : []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgorudColor,
      appBar: normalAppBar('Second Screen Page'),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: primaryColor))
          : dataList.isNotEmpty
              ? new StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      new Container(
                          child: new Center(
                        child: Image.network(
                          dataList[index]['download_url'],
                          fit: BoxFit.cover,
                          width: dataList[index]['width'].toDouble(),
                          height: dataList[index]['height'].toDouble(),
                        ),
                      )),
                      Text(dataList[index]['author']),
                    ],
                  ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              : Center(child: Text('No data available')),
    );
  }
}
