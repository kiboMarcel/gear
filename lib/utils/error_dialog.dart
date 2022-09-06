import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/custom_error.dart';

void errorDialog(BuildContext context, CustomError e) {
  //print('code: ${e.code}\n message: ${e.message}\n plugin: ^{e.plugin}\n');

  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(e.code),
            content: Text(e.message),
            actions: [
              CupertinoDialogAction(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.code),
            content: Text(e.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ok'),
              ),
            ],
          );
        });
  }
}

void invalidCode(
  BuildContext context,
) {
  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Code Invalide ou Expiré'),
            content: Text(
                'Veuillez Fournir le Code reçu par Sms ou demander un nouveau code'),
            actions: [
              CupertinoDialogAction(
                child: Text('ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Code Invalide ou Expiré'),
            content: Text(
                'Veuillez Fournir le Code reçu par Sms ou demander un nouveau code'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ok'),
              ),
            ],
          );
        });
  }
}

// DISPLAY MESSAGE WHEN IS NOT CONNECTED
void internetConnectionDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Erreur de connection'),
            content: Text('Vous n\'êtes pas connecter à internet'),
            actions: [
              CupertinoDialogAction(
                child: Text('Ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erreur de connection'),
            content: Text('Vous n\'êtes pas connecter à internet'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ok'),
              ),
            ],
          );
        });
  }
}
