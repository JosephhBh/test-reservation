import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testluggagelocker/controller/provider/lockers_provider.dart';
import 'package:testluggagelocker/model/locker_model.dart';
import 'package:testluggagelocker/view/choose_number.dart';

class ChooseSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LockersProvider>(builder: (context, lockersProvider, _) {
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
                  Text('Choose locker size'),
                  TextButton(
                    child: Text('next'),
                    onPressed: () {
                      lockersProvider.updateLockerDetail(
                        lockersProvider
                            .listOfLockers[lockersProvider.selectedIndex]
                            .copyWith(
                          isSizeConfirmed: true,
                        ),
                      );
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        barrierColor: Colors.black.withOpacity(0.2),
                        useRootNavigator: true,
                        isScrollControlled: true,
                        isDismissible: true,
                        builder: (context) => ChooseNumber(),
                      );
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
                  itemCount: lockersSize.length,
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
                                size: lockersSize[index],
                                isSizeSelected: true,
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
                                              .isSizeSelected ==
                                          false &&
                                      lockersSize[index] == "M"
                                  ? Colors.blue
                                  : lockersProvider
                                              .listOfLockers[
                                                  lockersProvider.selectedIndex]
                                              .size ==
                                          lockersSize[index]
                                      ? Colors.blue
                                      : Colors.white,
                              border: Border.all(
                                color: lockersProvider
                                                .listOfLockers[lockersProvider
                                                    .selectedIndex]
                                                .isSizeSelected ==
                                            false &&
                                        lockersSize[index] == "M"
                                    ? Colors.blue
                                    : lockersProvider
                                                .listOfLockers[lockersProvider
                                                    .selectedIndex]
                                                .size ==
                                            lockersSize[index]
                                        ? Colors.blue
                                        : Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                lockersSize[index],
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
