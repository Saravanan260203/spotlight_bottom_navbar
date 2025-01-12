<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

SpotlightBottomNavBar

A customizable and visually appealing bottom navigation bar widget for Flutter applications. The SpotlightBottomNav widget provides an interactive spotlight effect to highlight the selected navigation icon, ensuring a modern and engaging user experience.

## Features

Customizable Spotlight Effect: Highlight the active navigation item with a gradient spotlight.
Flexible Icon Count: Supports navigation bars with 3, 4, or 5 icons.
Dynamic Pages: Easily switch between pages using the bottom navigation bar.
Customizable Appearance: Adjust spotlight color and icons for a tailored design.
Smooth Animations: Enjoy fluid transitions and animations when navigating between pages.

## Preview

<div style="text-align: center; margin-top: 20px;">
  <strong>Preview:</strong><br>
  <img src="https://raw.githubusercontent.com/Saravanan260203/packagepreview/6fafcd033265b54c54439ae9ac7c0d7ee935c7af/video_20250112_131042.gif" alt="Package Preview" style="max-width: 100%; height: auto;">
</div>


## Getting started

Add the package to your project by updating the pubspec.yaml file:
```dart
dependencies:
spotlight_bottom_nav: ^1.0.0
```
## Usage

Here’s a basic example to get started:

```dart
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:spotlight_bottom_navbar/spotlight_bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SpotlightBottomNav(
        spotlightColor: Colors.yellow,
        bottomNavCount: 4,
        icons: const [
          IconlyLight.home,
          IconlyLight.category,
          IconlyLight.profile,
          IconlyLight.setting,
        ],
          pages: [
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Category Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Profile Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Settings Page',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
              ],
            ),
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
```




## Parameters Overview

<table>
  <thead>
    <tr>
      <th>Parameter</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>primaryColor</code></td>
      <td>Highlight color for the active icon and spotlight effect.</td>
    </tr>
    <tr>
      <td><code>bottomNavCount</code></td>
      <td>Number of navigation items (3, 4, or 5).</td>
    </tr>
    <tr>
      <td><code>icons</code></td>
      <td>List of icons for each navigation item.</td>
    </tr>
    <tr>
      <td><code>pages</code></td>
      <td>Widgets for each corresponding navigation item.</td>
    </tr>
    <tr>
      <td><code>onPageChanged</code></td>
      <td>Callback for page change events.</td>
    </tr>
  </tbody>
</table>
