import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../widgets/custom_text.dart';
import 'widgets/list_tile_cards.dart';
import 'widgets/search_bar.dart';

@RoutePage()
class EmployeeScreen extends ConsumerWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge(
          "Employees",
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            ListTileCards(),
          ],
        ),
      ),
    );
  }
}
