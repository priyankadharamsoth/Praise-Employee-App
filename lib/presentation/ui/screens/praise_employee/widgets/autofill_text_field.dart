import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../domain/models/employee/employee.dart';
import '../../../../../domain/states/employee_state.dart';
import '../../../../providers/employee/employee_provider.dart';
import '../../../../providers/praise_employee/praise_employee_provider.dart';

class AutoFillTextField extends ConsumerStatefulWidget {
  const AutoFillTextField({super.key});

  @override
  ConsumerState<AutoFillTextField> createState() => _AutoFillTextFieldState();
}

class _AutoFillTextFieldState extends ConsumerState<AutoFillTextField> {
  GlobalKey<AutoCompleteTextFieldState<EmployeeResult>> key = GlobalKey();
  AutoCompleteTextField? searchTextField;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<EmployeeResult> employee =
        ref.watch(employeeNotifierProvider).employees ?? [];
    return Column(
      children: [
        Column(
          children: [
            searchTextField = AutoCompleteTextField<EmployeeResult>(
                style: const TextStyle(color: Colors.black, fontSize: 16.0),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: UIColorsLight().customColors.greyColor!)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: UIColorsLight().customColors.greyColor!)),
                    fillColor: UIColorsLight().customColors.whiteColor),
                itemSubmitted: (item) async {
                  ref
                      .read(selectedEmployeeNotfierProvider.notifier)
                      .updated(item);
                  searchTextField?.textField?.controller?.text =
                      "${(ref.watch(selectedEmployeeNotfierProvider)?.firstName)} ${(ref.watch(selectedEmployeeNotfierProvider)?.lastName)}";
                },
                clearOnSubmit: false,
                key: key,
                suggestions: employee,
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(("${item.firstName!} ${item.lastName!}")),
                  );
                },
                itemSorter: (a, b) {
                  return ("${a.firstName!} ${a.lastName!}")
                      .compareTo(b.firstName!);
                },
                itemFilter: (item, query) {
                  return ("${item.firstName!} ${item.lastName!}")
                      .toLowerCase()
                      .startsWith(query.toLowerCase());
                }),
          ],
        ),
      ],
    );
  }
}
