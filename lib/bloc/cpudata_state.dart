part of 'cpudata_bloc.dart';

@immutable
abstract class CpudataState {}

class CpudataInitial extends CpudataState {}

class CpuDataBody extends CpudataState{
  Widget body;

  CpuDataBody({this.body});
}

class CpuDataLoaded extends CpudataState{
  List<IntelCpu> cpus;

  CpuDataLoaded({this.cpus});
  
  CpuDataLoaded copyWith({List<IntelCpu> cpus}){
    return CpuDataLoaded(
      cpus: cpus ?? this.cpus
    );
  }
}
