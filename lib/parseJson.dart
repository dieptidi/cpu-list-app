import 'package:flutter/material.dart';
import 'dart:convert';
import './view/index.dart';
import './models/index.dart';

class ParseJson extends StatefulWidget {
  @override
  _ParseJsonState createState() => _ParseJsonState();
}

class _ParseJsonState extends State<ParseJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json"),
      ),
      // body: bodyBuilder(context, "10")
      // FutureBuilder(
      //   future: DefaultAssetBundle.of(context)
      //       .loadString('assets/intel/desktop/iG10Dsk.json'),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       var _data = jsonDecode(snapshot.data);
      //       // print("====data: ${_data['data']}");
      //       // print("====data: ${snapshot.data['data'][0]['gpu']}");
      //       ExtractData extData = new ExtractData();
      //       List<IntelCpu> iGen10 = extData.intelCpuDesk(_data['data']);
      //       // List<Intel10thGenDesk> iGen10 = iGen10Parse(_data['data']);
      //       // for (var intelGen10 in _data['data']) {
      //       //   print("=====Data: ${intelGen10}");
      //       //   iGen10.add(intelGen10);
      //       // }
      //       return _body(iGen10);
      //     } else if (snapshot.hasError) {
      //       return Text("${snapshot.error}");
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
    );
  }

  // List<IntelCpu> iGen10Parse(var _json){
  //   if (_json == "") {
  //     return [];
  //   }
  //   final parse = _json.cast<Map<String, dynamic>>();
  //   return parse.map<IntelCpu>((data)=>new IntelCpu.fromJson(data)).toList();
  // }
  // List<Intel10thGenDesk> iGen10Parse(var _json){
  //   if (_json == "") {
  //     return [];
  //   }
  //   final parse = _json.cast<Map<String, dynamic>>();
  //   return parse.map<Intel10thGenDesk>((data)=>new Intel10thGenDesk.fromJson(data)).toList();
  // }

  Widget _body(List<IntelCpu> iGen10) {
    return new ListView.builder(
      itemCount: iGen10.length,
      itemBuilder: (context, i) {
        return Card(
          child: Column(
            children: [
              Text("Tipe: ${iGen10[i].processorbranding}"),
              Text("Model: ${iGen10[i].model}"),
              Text("Base Clock: ${iGen10[i].baseclockrate}")
            ],
          ),
        );
      },
    );
  }
}
