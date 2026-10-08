// Copyright 2020 Joan Pablo Jimenez Milian. All rights reserved.
// Use of this source code is governed by the MIT license that can be
// found in the LICENSE file.

import 'package:reactive_forms/reactive_forms.dart';

/// Validator that requires the control have a non-empty value.
class RequiredValidator extends Validator<dynamic> {
  const RequiredValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = {ValidationMessage.required: true};

    return switch (control.value) {
      null => error,
      final String value when value.trim().isEmpty => error,
      final Iterable<Object?> value when value.isEmpty => error,
      final Map<Object?, Object?> value when value.isEmpty => error,
      _ => null,
    };
  }
}
