import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/index.dart';

class BodyList{
  Widget body;
  List<IntelCpu> intelCpuList;
  int processorbrandingCount;
  List<String> processorbrandingList = new List<String>();

  List<IntelCpu> _intelCpuList(var _data){
    return ExtractData().intelCpuDesk(_data);
  }

  void findProcBrandCount(){
    String _cpu = "";
    // processorbrandingList.add(_cpu);
    this.processorbrandingCount = 0;

    for (var cpu in this.intelCpuList) {
      if (_cpu != cpu.processorbranding) {
        this.processorbrandingCount +=1;
        _cpu = cpu.processorbranding;
        this.processorbrandingList.add(_cpu);
      }
    }
  }

  Widget dataBuilder(BuildContext context, String gen){
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/intel/desktop/iG${gen}Dsk.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var _data = jsonDecode(snapshot.data);
          // ExtractData extData = new ExtractData();
          this.intelCpuList = this._intelCpuList(_data['data']);
          
          findProcBrandCount();

          return page(context);
          // return _body(ExtractData().intelCpuDesk(_data['data']));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _body(List<IntelCpu> intelCpu) {
    return new ListView.builder(
      itemCount: intelCpu.length,
      itemBuilder: (context, i) {
        return Card(
          child: Column(
            children: [
              Text("Tipe: ${intelCpu[i].processorbranding}"),
              Text("Model: ${intelCpu[i].model}"),
              Text("Base Clock: ${intelCpu[i].baseclockrate}")
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildTab(){
    return [for (var branding in this.processorbrandingList) Tab(text: branding)];    
  }

  List<Widget> _buildTabBody(){
    return [for(var i = 0; i < this.processorbrandingList.length; i++)    
      _body([for(var cpu in this.intelCpuList)
        if(cpu.processorbranding == this.processorbrandingList[i]) cpu
      ])
    ];
  }

  Widget page(BuildContext context){
    return TabBarView(
      children: _buildTabBody(),
    );
  }
  // Widget page(BuildContext context){
  //   return DefaultTabController(
  //     length: this.processorbrandingCount,
  //     child: Scaffold(
  //       appBar: new AppBar(
  //         title: new Text(this.intelCpuList[0].codename),
  //         bottom: TabBar(
  //           tabs: _buildTab(),
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: _buildTabBody(),
  //       ),
  //       drawer: Drawer(
  //       child: ListView(
  //         padding: EdgeInsets.zero,
  //         children: <Widget>[
  //           DrawerHeader(
  //             child: InkWell(child: Text('Drawer Header'), onTap: ()=>Navigator.pop(context)),
  //             decoration: BoxDecoration(
  //               color: Colors.blue,
  //             ),
  //           ),
  //           ListTile(
  //             title: Text('Item 1'),
  //             // onTap: () {
  //             //   setState(() {
  //             //     showHide = !showHide;
  //             //     body = navBodyDynamic(showHide);
  //             //   });
  //               // Navigator.pop(context);
  //             // },
  //             selectedTileColor: Colors.blue,
  //           ),
  //           body,
  //           ListTile(
  //             title: Text('Item 2'),
  //             onTap: () {
  //               // Update the state of the app
  //               // ...
  //               // Then close the drawer
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   )
  //     );
  // }
}