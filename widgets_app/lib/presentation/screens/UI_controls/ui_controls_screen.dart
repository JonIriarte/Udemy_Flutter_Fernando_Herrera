import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens.dart';

class UIControlsScreen extends StatelessWidget {
  const UIControlsScreen({super.key});

  static const routeName = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('UI CONTROLS'),
          leading: IconButton(
              onPressed: () => GoRouter.of(context).go(HomeScreen.routeName),
              icon: const Icon(Icons.arrow_back_ios))),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView({
    super.key,
  });

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, spaceship, bike }

class _UIControlsViewState extends State<_UIControlsView> {
  bool _isDeveloper = true;
  bool _isExpanded = true;
  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  Transportation selectedTransportation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: _isDeveloper,
          onChanged: (value) {
            setState(() {
              _isDeveloper = !_isDeveloper;
            });
          },
          activeTrackColor: Colors.green.shade300,
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(selectedTransportation.name),
          initiallyExpanded: _isExpanded,
          onExpansionChanged: (bool expanding) =>
              setState(() => _isExpanded = expanding),
          children: [
            RadioListTile(
                title: Text(Transportation.bike.name),
                value: Transportation.bike,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedTransportation = value;
                      _isExpanded = false;
                    });
                  }
                }),
            RadioListTile(
                title: Text(Transportation.car.name),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedTransportation = value;
                      _isExpanded = false;
                    });
                  }
                }),
            RadioListTile(
                title: Text(Transportation.plane.name),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedTransportation = value;
                      _isExpanded = false;
                    });
                  }
                }),
            RadioListTile(
                title: Text(Transportation.spaceship.name),
                value: Transportation.spaceship,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedTransportation = value;
                      _isExpanded = false;
                    });
                  }
                }),
          ],
        ),
        CheckboxListTile(
            title: Text('Breakfast?'),
            value: wantsBreakFast,
            onChanged: (value) {
              setState(() {
                wantsBreakFast = !wantsBreakFast;
              });
            }),
        CheckboxListTile(
            title: Text('Comida?'),
            value: wantsLunch,
            onChanged: (value) {
              setState(() {
                wantsLunch = !wantsLunch;
              });
            }),
        CheckboxListTile(
            title: Text('Cena?'),
            value: wantsDinner,
            onChanged: (value) {
              setState(() {
                wantsDinner = !wantsDinner;
              });
            })
      ],
    );
  }
}
