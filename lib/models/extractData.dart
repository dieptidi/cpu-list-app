import './index.dart';

class ExtractData{
  
  List<IntelCpu> intelCpuDesk(var _json){
    if (_json == "") {
      return [];
    }
    final parse = _json.cast<Map<String, dynamic>>();
    return parse.map<IntelCpu>((data)=>new IntelCpu.fromJson(data)).toList();
  }
}