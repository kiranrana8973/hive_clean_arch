import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/features/auth/ui/register/register_cubit.dart';

import '../../../batch/domain/entity/batch.dart';
import '../../../course/domain/entity/course.dart';
import '../../domain/entity/student.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<RegisterCubit>(context);
    super.initState();
    cubit.navigator.context = context;
  }

  Batch? _dropDownValue;
  final List<Course> _lstCourseSelected = [];

  final _gap = const SizedBox(height: 8);

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Kiran');
  final _lnameController = TextEditingController(text: 'Rana');
  final _phoneController = TextEditingController(text: '9812345678');
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  addStudent() {
    if (_key.currentState!.validate()) {
      final student = Student(
        fname: _fnameController.text,
        lname: _lnameController.text,
        phone: _phoneController.text,
        batch: _dropDownValue!,
        course: _lstCourseSelected,
        username: _usernameController.text,
        password: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student added successfully'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone No',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phoneNo';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  // FutureBuilder(
                  //   future: HiveService.instance.getBatches(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       final data = snapshot.data as List<Batch>;
                  //       return DropdownButtonFormField<Batch>(
                  //         value: _dropDownValue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _dropDownValue = value;
                  //           });
                  //         },
                  //         items: data
                  //             .map(
                  //               (e) => DropdownMenuItem(
                  //                 value: e,
                  //                 child: Text(e.batchName),
                  //               ),
                  //             )
                  //             .toList(),
                  //         decoration: const InputDecoration(
                  //           labelText: 'Batch',
                  //         ),
                  //         validator: ((value) {
                  //           if (value == null) {
                  //             return 'Please select batch';
                  //           }
                  //           return null;
                  //         }),
                  //       );
                  //     }
                  //     return const CircularProgressIndicator();
                  //   },
                  // ),
                  _gap,
                  // FutureBuilder(
                  //   future: HiveService.instance.getCourses(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return MultiSelectDialogField(
                  //         title: const Text('Select course'),
                  //         items: snapshot.data!
                  //             .map((course) => MultiSelectItem(
                  //                   course,
                  //                   course.courseName!,
                  //                 ))
                  //             .toList(),
                  //         listType: MultiSelectListType.CHIP,
                  //         buttonText: const Text('Select course'),
                  //         buttonIcon: const Icon(Icons.search),
                  //         onConfirm: (values) {
                  //           _lstCourseSelected = values;
                  //         },
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Colors.grey,
                  //           ),
                  //           borderRadius: BorderRadius.circular(5),
                  //         ),
                  //         validator: ((value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please select course';
                  //           }
                  //           return null;
                  //         }),
                  //       );
                  //     } else {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //   },
                  // ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          cubit.onTapLogin();
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
