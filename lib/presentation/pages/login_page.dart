import 'package:digital_id/app/constants/path_const.dart';
import 'package:digital_id/app/utils/extensions.dart';
import 'package:digital_id/data/sources/module.dart';
import 'package:digital_id/domain/entities/company.dart';
import 'package:digital_id/domain/entities/user.dart';
import 'package:digital_id/presentation/pages/home_card_page.dart';
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          // final user = await ref
                          //     .read(userStateNotifierProvider.notifier)
                          //     .login(
                          //       emailController.text,
                          //       passwordController.text,
                          //     );
                          final user = User(
                            id: 1,
                            name: 'John Doe',
                            email: emailController.text,
                            address: 'Ethiopia',
                            phoneNumber: '0123456789',
                          );
                          ref.read(companyProvider.notifier).state =
                              listOfCompanies;
                          ref.read(userProvider.notifier).state = user;
                          context.go(PathConst.digitalIdPath);
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

// import 'package:digital_id/presentation/pages/home_card_page.dart';
// import 'package:digital_id/presentation/providers/providers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// const users = {
//   'dribbble@gmail.com': '12345',
//   'hunter@gmail.com': 'hunter',
// };

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
  
//   @override
//   void initState() {
//     super.initState();
    
    
//   }

//   Duration get loginTime => const Duration(milliseconds: 2250);

//   Future<String?> _authUser(LoginData data) {
//     debugPrint('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return null;
//     });
//   }

//   Future<String?> _signupUser(SignupData data) {
//     debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       return null;
//     });
//   }

//   Future<String> _recoverPassword(String name) {
//     debugPrint('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'User not exists';
//       }
//       return 'null';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'Digital ID',
//       // logo: const AssetImage('assets/daveragoose.png'),
//       onLogin: _authUser,
//       onSignup: _signupUser,
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => CreditCardScreen(),
//         ));
//       },
//       onRecoverPassword: _recoverPassword,
//     );
//   }
// }
