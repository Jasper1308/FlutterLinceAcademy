import 'package:flutter/material.dart';

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

extension TipoSanguineoExtension on TipoSanguineo {
  String get displayString {
    switch (this) {
      case TipoSanguineo.aPositivo: return 'A+';
      case TipoSanguineo.aNegativo: return 'A-';
      case TipoSanguineo.bPositivo: return 'B+';
      case TipoSanguineo.bNegativo: return 'B-';
      case TipoSanguineo.oPositivo: return 'O+';
      case TipoSanguineo.oNegativo: return 'O-';
      case TipoSanguineo.abPositivo: return 'AB+';
      case TipoSanguineo.abNegativo: return 'AB-';
    }
  }

  Color get color {
    switch (this) {
      case TipoSanguineo.aPositivo: return Colors.blue;
      case TipoSanguineo.aNegativo: return Colors.red;
      case TipoSanguineo.bPositivo: return Colors.purple;
      case TipoSanguineo.bNegativo: return Colors.orange;
      case TipoSanguineo.oPositivo: return Colors.green;
      case TipoSanguineo.oNegativo: return Colors.yellow;
      case TipoSanguineo.abPositivo: return Colors.cyan;
      case TipoSanguineo.abNegativo: return Colors.white;
    }
  }
}