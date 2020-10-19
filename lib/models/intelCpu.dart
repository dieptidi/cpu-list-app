import 'package:json_annotation/json_annotation.dart';

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
    
    factory IntelCpu.fromJson(Map<String,dynamic> json) => _$IntelCpuFromJson(json);
    Map<String, dynamic> toJson() => _$IntelCpuToJson(this);
}
