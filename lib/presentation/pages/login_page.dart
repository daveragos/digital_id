// ignore_for_file: avoid_print

import 'package:digital_id/app/constants/api_const.dart';
import 'package:digital_id/app/constants/path_const.dart';
import 'package:digital_id/app/utils/api_post.dart';
import 'package:digital_id/app/utils/extensions.dart';
import 'package:digital_id/data/model/user_model.dart';
import 'package:digital_id/domain/entities/company.dart';
import 'package:digital_id/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<Company> listOfCompanies = [
    Company(
      name: 'google',
      role: 'ceo',
      email: 'google@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'facebook',
      role: 'marketting',
      email: 'facebook@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'amazon',
      role: 'sales',
      email: 'amazon@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'apple',
      role: 'cto',
      email: 'apple@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'microsoft',
      role: 'freelancer',
      email: 'microsoft@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'twitter',
      role: 'intern',
      email: 'twitter@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void login({required context}) async {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill all the fields'),
          ),
        );
      } else if (!emailController.text.contains('@') ||
          !emailController.text.contains('.')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid email'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logging You In...'),
          ),
        );
        //! uploading to the server

        final result = await APIPost().postRequest(
            route: ApiConst.login,
            data: {
              'email': emailController.text.toString(),
              'password': passwordController.text.toString(),
            },
            context: context);
        if (result != null) {
          // print(jsonDecode(result.toString()));
          if (result.statusCode == 200) {
            print('just the data from response :${result.data['user']}');
            // Parse the JSON response
            Map<String, dynamic> responseMap = result.data;
            // Extract the username
            // Convert and extract the user object
            final usermodel = UserModel.fromMap(responseMap['user']);
            final user = usermodel.toEntity();
            ref.watch(userStateProvider.notifier).state = user;
            ref.read(companyProvider.notifier).state = listOfCompanies;
            context.go(PathConst.digitalIdPath);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result.data['message']),
              ),
            );
          }
          //handle if the response is 401
          else if (result.statusCode == 401) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result.data['message']),
              ),
            );
          }
        } else {
          GoRouter.of(context).go('/');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Error occured please try again'),
          ));
        }
      }
    }

    final text = context.textTheme;
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'DIGITAL ID',
              style: text.displayLarge,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Login',
                      style: text.headlineLarge,
                    ),
                    TextFormField(
                      controller: emailController,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.red),
                        hintText: 'Enter your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.red),
                        hintText: 'Enter your password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          login(context: context);
                        }
                      },
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            context.colorScheme.background,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            context.colorScheme.primary,
                          )),
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
