import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
// import 'package:forms_app/presentation/screens/bloc_counter_screen.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
          create: (context) => RegisterCubit(), child: const _RegisterView()),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => registerCubit.usernameChanged(value),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo obligatorio';
              if (value.trim().isEmpty) return 'Campo obligatorio';
              if (value.length < 3) return 'Valor demasiado corto';
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => registerCubit.emailChanged(value),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo obligatorio';
              if (value.trim().isEmpty) return 'Campo obligatorio';
              if (value.length < 3) return 'Valor demasiado corto';
              final emailRegEx = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (!emailRegEx.hasMatch(value)) {
                return ' Formato de correo electrónico incorrecto';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) => registerCubit.passwordChanged(value),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo obligatorio';
                if (value.trim().isEmpty) return 'Campo obligatorio';
                if (value.length < 8) return 'Valor demasiado corto';
                return null;
              }),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
              onPressed: () {
                // final isValid = _formKey.currentState?.validate();
                if (_formKey.currentState?.validate() == true) {
                  registerCubit.onSubmit();
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Crear usuario')),
        ],
      ),
    );
  }
}
