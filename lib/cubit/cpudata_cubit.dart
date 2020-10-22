import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intelcpulist/view/index.dart';
import 'package:meta/meta.dart';
import '../view/bodyContent.dart';

part 'cpudata_state.dart';

class CpudataCubit extends Cubit<CpudataState> {
  CpudataCubit()
      : super(CpudataState(
            appBarName: "PC Building Preference1",
            // appBarName: "PC Building Preference",
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                headerMainPage("To view list"),
                headerMainPage("Click 3 line button on Top Left")
              ],
            ),
            bodyTab:
                PreferredSize(child: Container(), preferredSize: Size(0, 0)),
            bottomTab:
                PreferredSize(child: Container(), preferredSize: Size(0, 0)),
            length: 0));

  void backHome() => emit(CpudataState(
      appBarName: "PC Building Preference1",
      // appBarName: "PC Building Preference",
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          headerMainPage("To view list"),
          headerMainPage("Click 3 line button on Top Left")
        ],
      ),
      bodyTab: PreferredSize(child: Container(), preferredSize: Size(0, 0)),
      bottomTab: PreferredSize(child: Container(), preferredSize: Size(0, 0)),
      length: 0));

  void loadJson(String _name, Widget _builder) => emit(CpudataState(
      appBarName: _name,
      body: _builder,
      bodyTab: PreferredSize(child: Container(), preferredSize: Size(0, 0)),
      bottomTab: PreferredSize(child: Container(), preferredSize: Size(0, 0)),
      length: 0));

  void loadBody(String _name, Widget _body, Widget _bottomTab, int _length) =>
      emit(CpudataState(
          appBarName: _name,
          body: _body,
          bodyTab: PreferredSize(child: Container(), preferredSize: Size(0, 0)),
          bottomTab: _bottomTab,
          length: _length));
}
