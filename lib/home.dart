import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intelcpulist/models/index.dart';
// import './view/body.dart';
import './view/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cpudata_cubit.dart';

class Home extends StatefulWidget {
  // List<IntelCpu> cpus;
  int tabLength = 0;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool showHide, isMain;
  Widget bodyPage, bottomTab;
  // Widget mainPage;
  // BuildContext pageContext;
  int _tabLength;
  List<String> listTab = new List<String>();
  int tabCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabLength = widget.tabLength;
    // body = new Container();
    bodyPage = _mainBodyPage();
    bottomTab = PreferredSize(
      child: Container(),
      preferredSize: Size(0, 0),
    );
    // isMain = true;
    // mainPage = _page();
    // showHide = false;
  }

  @override
  Widget build(BuildContext context) {
    // pageContext = context;
    BodyList bl = new BodyList();
    // return bl.dataBuilder(context, "10");
    return BlocProvider<CpudataCubit>(
        create: (context) => CpudataCubit(), child: _page(context));
    // return mainPage;
    // return DefaultTabController(

    // );
  }

  Widget _page(BuildContext context) {
    // if (_tabLength > 0) {

    // }
    return BlocBuilder<CpudataCubit, CpudataState>(
      builder: (context, state) {
        return DefaultTabController(
          length: state.length,
          child: Scaffold(
            appBar: new AppBar(
              title: new Text(state.appBarName),
              bottom: state.bottomTab,
              // bottom: PreferredSize(child: Container(), preferredSize: 0.0,)
              //   tabs: [
              //     Tab(
              //       text: "aa",
              //     ),
              //     Tab(
              //       text: "bb",
              //     )
              //   ],
              // ),
            ),
            body: state.body,
            drawer: _customDrawer(context),
          ),
        );
      },
    );
    // else {

    // }
  }

  Widget _mainBodyPage() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        headerMainPage("To view list"),
        headerMainPage("Click 3 line button on Top Left")
      ],
    );
  }

  List<Widget> bodyDrawer() {
    return [
      for (var i = 1; i < 9; i++)
        if (i == 2)
          Text('Header')
        else if (i != 5)
          ListTile(title: Text('Intel Cpu Generasi $i'))
    ];
  }

  Widget _customDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: InkWell(
              child: Text(
                'Hardware Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () => Navigator.pop(context)),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        // bodyDrawer(),
        ListTile(
          title: Text('Comet Lake'),
          onTap: () {
            // setState(() {});
            context
                .bloc<CpudataCubit>()
                .loadJson('Comet Lake', dataBuilder(context, "10"));
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            context.bloc<CpudataCubit>().backHome();
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }

  Widget dataBuilder(BuildContext context, String gen) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/intel/desktop/iG${gen}Dsk.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var _data = jsonDecode(snapshot.data);
          ExtractData extData = new ExtractData();
          List<IntelCpu> intelCpu = extData.intelCpuDesk(_data['data']);
          // listTab.clear();

          findProcBrandCount(intelCpu);
          context.bloc<CpudataCubit>().loadBody(
              'Comet Lake',
              page(context, intelCpu),
              TabBar(isScrollable: true, tabs: _buildTab()),
              tabCount);
          // _buildTab().clear();
          // context.bloc<CpudataCubit>().loadJson('Comet Lake', page(context, intelCpu));

          return Container();
          // return _body(ExtractData().intelCpuDesk(_data['data']));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  List<Widget> _buildTab() {
    return [for (var branding in listTab) Tab(text: branding)];
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

  List<Widget> _buildTabBody(List<IntelCpu> intelCpu) {
    return [
      for (var i = 0; i < listTab.length; i++)
        _body([
          for (var cpu in intelCpu)
            if (cpu.processorbranding == listTab[i]) cpu
        ])
    ];
  }

  Widget page(BuildContext context, List<IntelCpu> intelCpu) {
    return TabBarView(
      children: _buildTabBody(intelCpu),
    );
  }

  void findProcBrandCount(List<IntelCpu> intelCpu) {
    listTab.clear();
    String _processorbranding = "";
    tabCount = 0;
    // processorbrandingList.add(_processorbranding);
    // int _count = 0;

    for (var cpu in intelCpu) {
      if (_processorbranding != cpu.processorbranding) {
        tabCount += 1;
        _processorbranding = cpu.processorbranding;
        listTab.add(_processorbranding);
      }
    }
  }

  Widget navBodyDynamic(bool _showHide) {
    if (!_showHide)
      return Container();
    else {
      return ListTile(
        title: Text("Data"),
        tileColor: Colors.blue,
      );
    }
  }
}
