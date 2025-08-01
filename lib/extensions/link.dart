import 'package:flutter/material.dart';
import 'package:flutter_tiptap_render/core/mark.dart';
import 'package:url_launcher/url_launcher.dart';

var LinkExtension = Mark(
    name: "link",
    addStyle: (node, mark) => const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue),
    addCommands: (node, mark) => {
          "onTap": () async {
            // NOTE: Defaults to Url_Launcher, but component can be overridden
            final uri = Uri.tryParse(mark.attrs['href']);
            if (uri != null && await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          }
        });
