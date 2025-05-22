import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_hub/core/responsive/responsive_layout.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';
import 'package:research_hub/features/home/presentation/screens/domain_desktop.dart';
import 'package:research_hub/features/home/presentation/screens/domain_mobile.dart';

class DomainScreen extends StatefulWidget {
  const DomainScreen({super.key});

  @override
  State<DomainScreen> createState() => _DomainScreenState();
}

class _DomainScreenState extends State<DomainScreen> {
  late final DomainEntitiy _domainEntitiy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final args = Get.arguments;
    _domainEntitiy = args['domain'];
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: DomainMobile(domain: _domainEntitiy,),
      tablet: DomainMobile(domain: _domainEntitiy,),
      desktop: DomainDesktop(),
    );
  }
}
