import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testluggagelocker/controller/provider/lockers_provider.dart';

class ChooseNumber extends StatefulWidget {
  @override
  State<ChooseNumber> createState() => _ChooseNumberState();
}

class _ChooseNumberState extends State<ChooseNumber> {
  @override
  void initState() {
    super.initState();
    getCurrentList();
  }

  List<int> displayedList = [];

  getCurrentList() {
    var lockersProvider = Provider.of<LockersProvider>(context, listen: false);
    List<int> currentList =
        lockersProvider.listOfLockers[lockersProvider.selectedIndex].size == "S"
            ? smallLockers
            : lockersProvider
                        .listOfLockers[lockersProvider.selectedIndex].size ==
                    "M"
                ? mediumLockers
                : largeLockers;
    for (int i = 0; i < lockersProvider.currentLockers.length; i++) {
      if (currentList.contains(lockersProvider.currentLockers[i])) {
        currentList
            .removeAt(currentList.indexOf(lockersProvider.currentLockers[i]));
      }
    }
    if (lockersProvider.listOfLockers[lockersProvider.selectedIndex].number !=
        0) {
      currentList.add(
          lockersProvider.listOfLockers[lockersProvider.selectedIndex].number);
    }
    setState(() {
      displayedList = currentList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LockersProvider>(builder: (context, lockersProvider, _) {
      // List<int> currentList = lockersProvider
      //             .listOfLockers[lockersProvider.selectedIndex].size ==
      //         "S"
      //     ? smallLockers
      //     : lockersProvider.listOfLockers[lockersProvider.selectedIndex].size ==
      //             "M"
      //         ? mediumLockers
      //         : largeLockers;
      return Container(
        height: 400,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.backspace,
                      size: 40,
                    ),
                  ),
                  Text('Choose locker number'),
                  TextButton(
                    child: Text('next'),
                    onPressed: () {
                      lockersProvider.updateLockerDetail(
                        lockersProvider
                            .listOfLockers[lockersProvider.selectedIndex]
                            .copyWith(
                          isNumberConfirmed: true,
                        ),
                      );
                      lockersProvider.setReservedLockers(lockersProvider
                          .listOfLockers[lockersProvider.selectedIndex].number);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: displayedList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            lockersProvider.updateLockerDetail(
                              lockersProvider
                                  .listOfLockers[lockersProvider.selectedIndex]
                                  .copyWith(
                                number: displayedList[index],
                                isNumberSelected: true,
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lockersProvider
                                          .listOfLockers[
                                              lockersProvider.selectedIndex]
                                          .isNumberSelected ==
                                      false
                                  ? Colors.white
                                  : lockersProvider
                                              .listOfLockers[
                                                  lockersProvider.selectedIndex]
                                              .number ==
                                          displayedList[index]
                                      ? Colors.blue
                                      : Colors.white,
                              border: Border.all(
                                color: lockersProvider
                                            .listOfLockers[
                                                lockersProvider.selectedIndex]
                                            .isNumberSelected ==
                                        false
                                    ? Colors.grey
                                    : lockersProvider
                                                .listOfLockers[lockersProvider
                                                    .selectedIndex]
                                                .number ==
                                            displayedList[index]
                                        ? Colors.blue
                                        : Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                displayedList[index].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
