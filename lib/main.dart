import 'package:EsquireCallCenterExecutiveApp/blocs/activiti/activiti_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/auth/auth_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/filter/filter_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/initial/intial_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/core/themes/custom_theme.dart';
import 'package:EsquireCallCenterExecutiveApp/presentation/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<IntialBloc>(create: (context) => IntialBloc()),
        BlocProvider<FilterBloc>(create: (context) => FilterBloc()),
        BlocProvider<ActivitiBloc>(create: (context) => ActivitiBloc()),
      ],
      child: MaterialApp(
          navigatorKey: Get.key,
          navigatorObservers: [GetObserver()],
          title: 'Esquire Service Executive',
          theme: CustomTheme.getTheme(),
          home: AuthWrapper()),
    );
  }
}
