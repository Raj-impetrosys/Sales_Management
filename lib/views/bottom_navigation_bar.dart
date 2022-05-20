import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saletrackhing/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:saletrackhing/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:saletrackhing/bloc/bottom_navigation_bloc/bottom_navigation_state.dart';
import 'package:saletrackhing/globals/constants.dart';
import 'package:saletrackhing/globals/widgets/loader.dart';
import 'package:saletrackhing/views/all_projects.dart';
import 'package:saletrackhing/views/chat_screen.dart';
import 'package:saletrackhing/views/clients_query.dart';
import 'package:saletrackhing/views/dashboard.dart';
import 'package:saletrackhing/views/my_account.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBloc _bottomNavigationBloc =
        BottomNavigationBloc(OnTapped(0));
    List<Widget> _screens = [
      const DashboardScreen(),
      const ClientsQueryScreen(),
      Container(),
      const ChatScreen(),
      const MyAccount(),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            color: Color(0xff3B30B0),
            gradient: LinearGradient(
              colors: [
                Color(0xff3B30B0),
                Color(0xff5355C8),
                Color(0xff307FE4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: BlocBuilder(
            bloc: _bottomNavigationBloc,
            builder: (context, state) {
              if (state is OnTapped) {
                return BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (index) {
                    if (index == 2) {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => const AllProjects());
                    } else {
                      _bottomNavigationBloc.add(OnTap(index));
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: '',
                        icon: Image.asset(
                          'assets/images/menu_home.png',
                          scale: 3,
                        )),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: '',
                        icon: Image.asset(
                          'assets/images/menu_question.png',
                          scale: 3,
                        )),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      label: '',
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            boxShadow: Constants.shadow,
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/images/menu_arrow.png',
                          scale: 3,
                        ),
                      ),
                      // icon: FloatingActionButton(
                      //   backgroundColor: Colors.white,
                      //   onPressed: () {},
                      // ),
                    ),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: '',
                        icon: Image.asset(
                          'assets/images/menu_message.png',
                          scale: 3,
                        )),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: '',
                        icon: Image.asset(
                          'assets/images/menu_user.png',
                          scale: 3,
                        )),
                    // Image.asset('')
                  ],
                );
              }
              return loader();
            }),
      ),
      body: BlocBuilder(
          bloc: _bottomNavigationBloc,
          builder: (context, state) {
            if (state is OnTapped) {
              return _screens[state.index];
            }
            return loader();
          }),
    );
  }
}
