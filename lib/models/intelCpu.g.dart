// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intelCpu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntelCpu _$IntelCpuFromJson(Map<String, dynamic> json) {
  return IntelCpu()
    ..index = json['index'] as num
    ..processorbranding = json['processorbranding'] as String
    ..model = json['model'] as String
    ..coresthreads = json['coresthreads'] as String
    ..baseclockrate = json['baseclockrate'] as String
    ..maxturboclockrate = json['maxturboclockrate'] as String
    ..tdp = json['tdp'] as String
    ..releasedate = json['releasedate'] as String
    ..price = json['price'] as String
    ..socket = json['socket'] as String
    ..memorysupport = json['memorysupport'] as String
    ..codename = json['codename'] as String;
}

Map<String, dynamic> _$IntelCpuToJson(IntelCpu instance) => <String, dynamic>{
      'index': instance.index,
      'processorbranding': instance.processorbranding,
      'model': instance.model,
      'coresthreads': instance.coresthreads,
      'baseclockrate': instance.baseclockrate,
      'maxturboclockrate': instance.maxturboclockrate,
      'tdp': instance.tdp,
      'releasedate': instance.releasedate,
      'price': instance.price,
      'socket': instance.socket,
      'memorysupport': instance.memorysupport,
      'codename': instance.codename
    };
