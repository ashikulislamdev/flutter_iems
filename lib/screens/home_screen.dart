import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';
import 'package:flutter_iems/widgets/round_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding - 6, vertical: kDefaultPadding-6),
        child: Column(
          children: [
            const RoundContainer(totalExpense: 203.00, totalIncome: 5434.00),
            SizedBox(height: kDefaultPadding -6,),
            TabBar(
                // unselectedLabelStyle: kTitleTextstyle.copyWith(
                //     color: black.withOpacity(0.44),
                //     fontWeight: FontWeight.w400),
                // labelStyle: kTitleTextstyle.copyWith(
                //     color: Colors.white, fontWeight: FontWeight.w700),
                // indicator: BoxDecoration(
                //   borderRadius: BorderRadius.circular(5.0),
                //   color: Colors.blue,
                // ),
                controller: _tabController,
                labelColor: kPrimaryColor,
                unselectedLabelColor: black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    child: Text("Incomes", style: kTitleTextstyle.copyWith(fontSize: 15),),
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    child: Text("Expenses", style: kTitleTextstyle.copyWith(fontSize: 15),),
                  ),
                ],
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const[
                    // first tab bar
                    LastIncome(),

                    // second tab bar
                    LastExpenses(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LastIncome extends StatelessWidget {
  const LastIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom + 20),
      // shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Card(
          elevation: 1.0,
          margin: EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    Colors.red,
                radius: 20.0,
                child: ImageIcon(
                    AssetImage("assets/icons/manage-income.png"),
                    color: Colors.white),
              ),
              title: Text(
                "20-09-2022",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text("This is the note of this income"),
              trailing: Text(
                "293",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LastExpenses extends StatelessWidget {
  const LastExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom + 20),
      // shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Card(
          elevation: 1.0,
          margin: EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    Colors.red,
                radius: 20.0,
                child: ImageIcon(
                    AssetImage("assets/icons/manage-expense.png"),
                    color: Colors.white),
              ),
              title: Text(
                "20-09-2022",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text("This is the note of this expense"),
              trailing: Text(
                "293",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}