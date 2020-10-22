import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intelcpulist/view/index.dart';
import 'package:meta/meta.dart';
import '../models/index.dart';
import 'package:flutter/material.dart';

part 'cpudata_event.dart';
part 'cpudata_state.dart';

class CpudataBloc extends Bloc<CpudataEvent, CpudataState> {
  CpudataBloc() : super(CpudataInitial());

  @override
  Stream<CpudataState> mapEventToState(
    CpudataEvent event,
  ) async* {
    List<IntelCpu> cpus;

    if (state is CpudataInitial) {
      yield CpuDataBody(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            headerMainPage("To view list"),
            headerMainPage("Click 3 line button on Top Left")
          ],
        ),
      );
    }
    else{
      CpuDataLoaded cpuDataLoaded = state as CpuDataLoaded;
      // cpus = await IntelCpu.getLocalJson(cpuDataLoaded.cpus)
    }
  }
}
