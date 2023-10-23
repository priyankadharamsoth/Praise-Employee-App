import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../providers/praise_employee/praise_employee_provider.dart';
import '../../widgets/custom_text.dart';
import '../landing/screens/praises/widgets/template_tile.dart';

@RoutePage()
class PraiseTemplateScreen extends StatelessWidget {
  const PraiseTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge("Templates"),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => context.popRoute(),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: UIDimensions.height(10),
          mainAxisSpacing: UIDimensions.width(10),
          childAspectRatio: 0.9,
        ),
        primary: false,
        padding: UIDimensions.allPaddingGeometry(20),
        itemCount: praiseTemplatesList.length,
        itemBuilder: (context, index) {
          return TemplateTile(praiseTeamplate: praiseTemplatesList[index]);
        },
      ),
    );
  }
}
