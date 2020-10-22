import 'package:flutter/material.dart';
import 'dart:convert';

Widget dataBuilder(BuildContext context, String gen){
  return FutureBuilder(
    future: DefaultAssetBundle.of(context)
        .loadString('assets/intel/desktop/iG${gen}Dsk.json'),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        var _data = jsonDecode(snapshot.data);
        // ExtractData extData = new ExtractData();
        // this.intelCpuList = this._intelCpuList(_data['data']);
        
        // findProcBrandCount();

        // return page(context);
        // return _body(ExtractData().intelCpuDesk(_data['data']));
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    },
  );
}