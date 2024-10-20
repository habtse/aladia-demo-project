import 'package:aladia_demo_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/verify_bloc.dart';
import 'package:aladia_demo_app/core/injection/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
class BlocMultiProvider {
  List<BlocProvider<dynamic>> blocMultiProvider() {
    return [
      BlocProvider<AuthBloc>(
        create: (context) => di.sl<AuthBloc>()),

        BlocProvider<VerifyBloc>(
        create: (context) => di.sl<VerifyBloc>()),

        
    ];
  }
}
