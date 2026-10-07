import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/health_service.dart';

class ServiceCard
    extends StatelessWidget {
  final HealthService service;

  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,

          padding:
          const EdgeInsets.all(
            10,
          ),

          decoration:
          BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(
              12,
            ),
          ),

          child:
          SvgPicture.network(
            service.iconUrl,
          ),
        ),

        const SizedBox(
          height: 7,
        ),

        Text(
          service.name,

          style:
          const TextStyle(
            fontSize: 12,
            color:
            Color(
              0xFF969CAB,
            ),
          ),
        ),
      ],
    );
  }
}