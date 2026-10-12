import 'package:flutter/material.dart';
import 'package:fourth_project/fifth_project.dart';
import 'package:fourth_project/sixth_project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        // '/': (context) => MyHomePage(title: 'Forms'),
        '/secondScreen': (context) => ViewsClass(),
        '/thirdScreen': (context) => StackWidget(),
      },
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Forms'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> foodItems = [];

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String gender = 'Male';
  TextEditingController nameController = TextEditingController();
  bool returnCustomer = false;

  @override
  Widget build(BuildContext context) {
    bool isSelect = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: .center,
            children: [
              // const Text('You have pushed the button this many times:'),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                        labelText: "Enter your name",
                        hintText: "Enter your name",
                        border: OutlineInputBorder(),
                      ),
                      // focu: const OutlineInputBorder(),
                      validator: (String? input) {
                        return input!.length > 6
                            ? null
                            : "input must be greater than 6";
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: RadioListTile(
                            subtitle: Text('You grow a beard'),
                            value: 'Male',
                            title: Text('Male'),
                            enabled: nameController.text.isEmpty ? false : true,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: RadioListTile(
                            fillColor: WidgetStatePropertyAll(Colors.red),
                            enabled: nameController.text.isEmpty ? false : true,
                            subtitle: Text('You plait your hair'),
                            value: 'Female',
                            title: Text('Female'),
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SwitchListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: returnCustomer,
                      onChanged: (value) {
                        setState(() {
                          // returnCustomer = returnCustomer ? false : true;
                          returnCustomer = !returnCustomer;
                          // if (!returnCustomer) {
                          //   returnCustomer = true;
                          // } else {
                          //   returnCustomer = false;
                          // }
                        });
                      },
                      title: Text('Are you a returning customer?'),
                    ),
                    const SizedBox(height: 20),
                    FoodWidget(
                      food: 'Rice',
                      isSelected: foodItems.contains('Rice'),
                      fnc: () {
                        bool thisSelected = foodItems.contains('Rice');
                        setState(() {
                          // bool thisSelected = foodItems.contains('Rice');
                          setState(() {
                            thisSelected
                                ? foodItems.removeWhere(
                                    (e) => e.toLowerCase() == 'rice',
                                  )
                                : foodItems.add("Rice");
                            // if (thisSelected) {
                            //   foodItems.removeWhere(
                            //     (e) => e.toLowerCase() == 'rice',
                            //   );
                            // } else {
                            //   foodItems.add("Rice");
                            // }
                          });
                        });
                      },
                    ),
                    // FoodWidget(
                    //   food: 'Yam',
                    //   isSelected: foodItems.contains('Yam'),
                    // ),
                    // FoodWidget(
                    //   food: 'Beans',
                    //   isSelected: foodItems.contains('Beans'),
                    // ),
                    // FoodWidget(
                    //   food: 'Spag',
                    //   isSelected: foodItems.contains('Spag'),
                    // ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 500,
                      height: 500,
                      child: ListView(
                        children: <Widget>[
                          ...foodItems.map((foodItem) => Text(foodItem)),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Form Authenticated");
                        }
                      },
                      child: Text(
                        'Submit Form',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(flex: 25),
          CustomFAB(
            icn: Text('2'),
            fcn: () {
              Navigator.pushNamed(context, '/secondScreen');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ViewsClass()),
              // );
              // MaterialPageRoute(builder: (context) => ViewsClass());
            },
          ),
          Spacer(flex: 1),
          CustomFAB(
            icn: Text('3'),
            fcn: () {
              Navigator.pushNamed(context, '/thirdScreen');
            },
          ),
        ],
      ),
    );
  }
}

class CustomFAB extends StatelessWidget {
  final Widget icn;
  final void Function()? fcn;
  const CustomFAB({super.key, required this.icn, this.fcn});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: fcn,
      tooltip: 'Second Screen',
      child: icn,
      // child: Text('2'),
    );
  }
}

class FoodWidget extends StatefulWidget {
  const FoodWidget({
    super.key,
    required this.food,
    required this.isSelected,
    required this.fnc,
  });

  final String food;
  final bool isSelected;
  final void Function() fnc;

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  @override
  Widget build(BuildContext context) {
    bool isSelect = widget.isSelected;
    return CheckboxListTile(
      title: Text(widget.food),
      value: isSelect,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (val) => widget.fnc(),
    );
  }
}
