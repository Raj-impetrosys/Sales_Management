import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/check_in_bloc/checkin_bloc.dart';
import 'package:saletrackhing/bloc/check_in_bloc/checkin_event.dart';
import 'package:saletrackhing/bloc/check_in_bloc/checkin_state.dart';
import 'package:saletrackhing/bloc/dropdown_bloc/dropdown_bloc.dart';
import 'package:saletrackhing/bloc/dropdown_bloc/dropdown_event.dart';
import 'package:saletrackhing/bloc/dropdown_bloc/dropdown_state.dart';
import 'package:saletrackhing/bloc/select_btn_bloc/select_btn_bloc.dart';
import 'package:saletrackhing/bloc/select_btn_bloc/select_btn_event.dart';
import 'package:saletrackhing/bloc/select_btn_bloc/select_btn_state.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/loader.dart';
import 'package:saletrackhing/globals/widgets/notification_btn.dart';
import 'package:saletrackhing/globals/widgets/shopping_btn.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropDownBloc dropDownBloc =
        DropDownBloc(TotalSalesDateRangeChanged('Last Week'));
    SelectBtnBloc selectBtnBloc = SelectBtnBloc(BtnSelected("Meetings"));
    SelectBtnBloc selectBtnBlocRecentActivity =
        SelectBtnBloc(BtnSelected("Meetings"));
    CheckInBloc checkInBloc = CheckInBloc(BtnTapped(true));
    bool isCheckin = true;

    _slidableSwitch() => Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onHorizontalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
              // print(dragUpdateDetails.delta.dx);
              if (dragUpdateDetails.delta.dx > 0) {
                isCheckin = true;
                checkInBloc.add(OnTap(isCheckin));
              } else {
                isCheckin = false;
                checkInBloc.add(OnTap(isCheckin));
              }
            },
            onTap: () {
              isCheckin = !isCheckin;
              checkInBloc.add(OnTap(isCheckin));
            },
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  boxShadow: Constants.shadow,
                  borderRadius: BorderRadius.circular(5)),
              child: BlocBuilder(
                  bloc: checkInBloc,
                  builder: (context, state) {
                    if (state is BtnTapped) {
                      return AnimatedAlign(
                        alignment: state.isCheckin
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        duration: const Duration(milliseconds: 100),
                        child: Stack(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: Constants.shadow,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text(isCheckin ? 'Check In' : 'Check Out'),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return loader();
                  }),
            ),
          ),
        );

    Widget _header() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                notificationBtn(context),
                const SizedBox(
                  width: 10,
                ),
                shoppingBtn(context)
              ],
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      AssetImage('assets/images/person_default.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome Back',
                      style: TextStyle(color: Constants.fontColor),
                    ),
                    Text(
                      'Krishna Pandit',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Constants.fontColor),
                    ),
                  ],
                )
              ],
            ),
            _slidableSwitch()
          ],
        );

    chart() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'New Meeting',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '05',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff363853),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Done Meeting',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '03',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff363853),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 180,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('500k'),
                        Text('100k'),
                        Text('50k'),
                        Text('10k'),
                        Text('5k'),
                      ],
                    ),
                    SizedBox(
                      width: 295,
                      // height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 150,
                                    // margin: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xffB09FFF)
                                                .withOpacity(0.5),
                                            const Color(0xff8D79F6)
                                                .withOpacity(0.5),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 10,
                                    height: 100,
                                    // margin: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xffB09FFF),
                                            Color(0xff8D79F6),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Mon',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Tue',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Wed',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Thurs',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Fri',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Sat',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Sun',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        );

    _totalSales() => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: Constants.shadow),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 40,
                        color: const Color(0xffF7BE00),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Total Sales',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff363853),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: Constants.shadow),
                    child: BlocBuilder(
                        bloc: dropDownBloc,
                        builder: (context, state) {
                          if (state is TotalSalesDateRangeChanged) {
                            return DropdownButton<String>(
                              value: state.dropDownValue,
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              elevation: 16,
                              style: const TextStyle(color: Color(0xffC4C4C4)),
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              onChanged: (String? newValue) {
                                dropDownBloc
                                    .add(TotalSalesDateRangeChange(newValue!));
                              },
                              items: <String>[
                                'Last Week',
                                'Last Month',
                                'Last 2 Months',
                                'One Year'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            );
                          }
                          return loader();
                        }),
                  ),
                ],
              ),
              BlocBuilder(
                  bloc: selectBtnBloc,
                  builder: (context, state) {
                    if (state is BtnSelected) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: Constants.shadow),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    selectBtnBloc.add(SelectBtn("Meetings"));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: "Meetings" == state.btnType
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: Constants.shadow,
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        if ("Meetings" == state.btnType)
                                          Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff8DB001),
                                                shape: BoxShape.circle),
                                          ),
                                        const Text(
                                          "Meetings",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4E4874)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selectBtnBloc.add(SelectBtn('Orders'));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: "Orders" == state.btnType
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: Constants.shadow,
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        if ("Orders" == state.btnType)
                                          Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff8DB001),
                                                shape: BoxShape.circle),
                                          ),
                                        const Text(
                                          'Orders',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4E4874)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selectBtnBloc.add(SelectBtn('Payments'));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: "Payments" == state.btnType
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: Constants.shadow,
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        if ("Payments" == state.btnType)
                                          Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff8DB001),
                                                shape: BoxShape.circle),
                                          ),
                                        const Text(
                                          'Payments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4E4874)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          chart()
                        ],
                      );
                    }
                    return loader();
                  })
            ],
          ),
        );

    meetingActivity() => ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/person_default.png'),
              ),
              title: Text(
                'Devansh Malviya',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff363853)),
              ),
              subtitle: Text('8889587545\nLorem Ipsum dolor ser'),
              trailing: Text(
                'Intersted',
                style: TextStyle(fontSize: 12, color: Color(0xff688105)),
              ),
            ),
          );
        });

    _recentActivity() => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: Constants.shadow),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 40,
                    color: const Color(0xffF7BE00),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff363853),
                    ),
                  ),
                ],
              ),
              BlocBuilder(
                  bloc: selectBtnBlocRecentActivity,
                  builder: (context, state) {
                    if (state is BtnSelected) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: Constants.shadow),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    selectBtnBlocRecentActivity
                                        .add(SelectBtn("Meetings"));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 5),
                                    decoration: "Meetings" == state.btnType
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: Constants.shadow,
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        if ("Meetings" == state.btnType)
                                          Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff8DB001),
                                                shape: BoxShape.circle),
                                          ),
                                        const Text(
                                          "Meetings",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4E4874)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selectBtnBlocRecentActivity
                                        .add(SelectBtn('Orders'));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: "Orders" == state.btnType
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: Constants.shadow,
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        if ("Orders" == state.btnType)
                                          Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff8DB001),
                                                shape: BoxShape.circle),
                                          ),
                                        const Text(
                                          'Orders',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4E4874)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selectBtnBlocRecentActivity
                                        .add(SelectBtn('Payments'));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: "Payments" == state.btnType
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: Constants.shadow,
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        if ("Payments" == state.btnType)
                                          Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff8DB001),
                                                shape: BoxShape.circle),
                                          ),
                                        const Text(
                                          'Payments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4E4874)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selectBtnBlocRecentActivity
                                        .add(SelectBtn('Client'));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: "Client" == state.btnType
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: Constants.shadow,
                                            borderRadius:
                                                BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        if ("Client" == state.btnType)
                                          Container(
                                            height: 10,
                                            width: 10,
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff8DB001),
                                                shape: BoxShape.circle),
                                          ),
                                        const Text(
                                          'Client',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff4E4874)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          meetingActivity()
                        ],
                      );
                    }
                    return loader();
                  })
            ],
          ),
        );

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [_header(), _totalSales(), _recentActivity()],
        ),
      ),
    );
  }
}
