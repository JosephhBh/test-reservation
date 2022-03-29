import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testluggagelocker/controller/provider/lockers_provider.dart';
import 'package:testluggagelocker/view/choose_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LockersProvider>(builder: (context, lockersProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    lockersProvider.removeLocker();
                  },
                  child: Icon(
                    Icons.remove,
                    size: 40,
                  ),
                ),
                Text(
                  lockersProvider.listOfLockers.length.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    lockersProvider.addLocker();
                  },
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
            ListView.builder(
              itemCount: lockersProvider.listOfLockers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        lockersProvider.setSelctedIndex(index);
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          barrierColor: Colors.black.withOpacity(0.2),
                          useRootNavigator: true,
                          isScrollControlled: true,
                          isDismissible: true,
                          builder: (context) => ChooseSize(),
                        );
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        color: Colors.blueAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(lockersProvider
                                    .listOfLockers[index].isSizeConfirmed
                                ? lockersProvider.listOfLockers[index].size
                                : "Choose size"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(lockersProvider
                                    .listOfLockers[index].isNumberConfirmed
                                ? lockersProvider.listOfLockers[index].number
                                    .toString()
                                : "Please choose number"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text('print'),
              onPressed: () {
                print(lockersProvider.currentLockers);
              },
            ),
          ],
        );
      }),
    );
  }
}
