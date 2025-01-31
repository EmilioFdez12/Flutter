import 'package:flutter/material.dart';
import 'package:relacion1/screens/drawer.dart';

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    final _formKey = GlobalKey<FormState>(); // Clave para el formulario
    final _dateController = TextEditingController(); // Controlador para la fecha

    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Formulario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Permite hacer scroll
          child: Form(
            key: _formKey, // Asignar la clave al formulario
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingrese sus datos',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),

                // Campo de nombre
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo de correo electrónico
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su correo electrónico';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Por favor, ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo de contraseña
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese una contraseña';
                    }
                    if (!RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$').hasMatch(value)) {
                      return 'La contraseña debe tener al menos 8 caracteres, una mayúscula y un número';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo de fecha de nacimiento
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dateController, // Controlador para la fecha
                        decoration: const InputDecoration(
                          labelText: 'Fecha de nacimiento',
                          labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                        readOnly: true, // Evita que el usuario escriba manualmente
                        onTap: () async {
                          // Abrir el selector de fecha al tocar el campo
                          selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (selectedDate != null) {
                            // Actualizar el campo con la fecha seleccionada
                            _dateController.text =
                                "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () async {
                        selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          // Actualizar el campo con la fecha seleccionada
                          _dateController.text =
                              "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                        minimumSize: const Size(50, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child:
                          const Icon(Icons.calendar_today, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Botón de enviar
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validar el formulario
                      if (_formKey.currentState!.validate()) {
                        // Si el formulario es válido, mostrar un mensaje
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Formulario enviado')),
                        );
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}