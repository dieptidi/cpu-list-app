import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intelcpulist/models/index.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'intelCpu.g.dart';

@JsonSerializable()
class IntelCpu {
  IntelCpu();

  num index;
  String processorbranding;
  String model;
  String coresthreads;
  String baseclockrate;
  String maxturboclockrate;
  String tdp;
  String releasedate;
  String price;
  String socket;
  String memorysupport;
  String codename;

  factory IntelCpu.fromJson(Map<String, dynamic> json) =>
      _$IntelCpuFromJson(json);

  Map<String, dynamic> toJson() => _$IntelCpuToJson(this);

  static Future<List<IntelCpu>> getLocalJson(String gen) async {
    return await rootBundle
        .loadString('assets/intel/desktop/iG${gen}Dsk.json')
        .then((String cpus) => json.decode(cpus)['data'] as List)
        .then((List value) {
      List<IntelCpu> listIntelCpu = [];
      value.forEach((index) => listIntelCpu.add(IntelCpu.fromJson(index)));
      return listIntelCpu;
    });
    // var jsonObject = json.decode(rootBundle.loadString('assets/intel/desktop/iG${gen}Dsk.json'));
  }
}
