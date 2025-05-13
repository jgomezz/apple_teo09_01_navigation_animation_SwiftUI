//
//  ContentView.swift
//  apple_teo09_01_navigation_animation_SwiftUI
//
//  Created by developer on 5/12/25.
//

// Ejemplos de Código para Demostración en Clase
// SwiftUI - Diseño de Interfaces Gráficas

import SwiftUI

// MARK: - 1. Ejemplo Básico de Stacks
struct StacksBasicoView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("VStack Example")
                .font(.title)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Rating: 5.0")
            }
            
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 100, height: 100)
                
                Text("Z")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

// MARK: - 2. Ejemplo de Modificadores y Orden
struct ModificadoresView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Orden 1: padding -> background
            Text("Padding → Background")
                .padding()
                .background(Color.red)
                .cornerRadius(10)
            
            // Orden 2: background -> padding
            Text("Background → Padding")
                .background(Color.red)
                .padding()
                .cornerRadius(10)
            
            // Ejemplo complejo
            Text("Modificadores Encadenados")
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.purple, .blue]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
        }
        .padding()
    }
}

// MARK: - 3. Animación Simple
struct AnimacionSimpleView: View {
    @State private var isExpanded = false
    @State private var rotation = 0.0
    
    var body: some View {
        VStack(spacing: 40) {
            // Animación de escala
            Circle()
                .fill(Color.blue)
                .frame(width: isExpanded ? 150 : 100,
                       height: isExpanded ? 150 : 100)
                .animation(.spring(), value: isExpanded)
                .onTapGesture {
                    isExpanded.toggle()
                }
            
            // Animación de rotación
            Image(systemName: "gear")
                .font(.system(size: 60))
                .rotationEffect(.degrees(rotation))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1)) {
                        rotation += 360
                    }
                }
            
            Text("Toca los elementos para animar")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

// MARK: - 4. Tarjeta de Perfil Completa
struct TarjetaPerfilView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header con imagen
            ZStack(alignment: .bottom) {
                // Imagen de fondo
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 200)
                
                // Overlay oscuro
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .frame(height: 200)
                
                // Foto de perfil
                VStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.gray)
                        )
                        .shadow(radius: 5)
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                    
                    Text("Ana García")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)
            }
            
            // Información del perfil
            VStack(alignment: .leading, spacing: 15) {
                ForEach(datosContacto) { dato in
                    HStack {
                        Image(systemName: dato.icono)
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        Text(dato.valor)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 20)
            
            // Botón de acción
            Button(action: {
                withAnimation(.spring()) {
                    isAnimating.toggle()
                }
            }) {
                Text("Contactar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

// Modelo de datos para el perfil
struct DatoContacto: Identifiable {
    let id = UUID()
    let icono: String
    let valor: String
}

let datosContacto = [
    DatoContacto(icono: "envelope.fill", valor: "ana.garcia@email.com"),
    DatoContacto(icono: "phone.fill", valor: "+52 123 456 7890"),
    DatoContacto(icono: "location.fill", valor: "Ciudad de México")
]

// MARK: - 5. Transiciones Animadas
struct TransicionesView: View {
    @State private var mostrarDetalles = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Ejemplo de Transiciones")
                .font(.title)
            
            Button("Mostrar/Ocultar Detalles") {
                withAnimation(.spring()) {
                    mostrarDetalles.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            
            if mostrarDetalles {
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Información adicional")
                    }
                    .font(.headline)
                    
                    Text("Las transiciones en SwiftUI permiten animar la aparición y desaparición de vistas de manera fluida.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(15)
                .transition(.asymmetric(
                    insertion: .scale.combined(with: .opacity),
                    removal: .slide
                ))
            }
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - 6. Animación Compleja con Estados
struct AnimacionCompletaView: View {
    @State private var progreso: CGFloat = 0
    @State private var isLoading = false
    @State private var completado = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Animación de Proceso")
                .font(.title)
            
            // Barra de progreso
            ZStack(alignment: .leading) {
                // Fondo
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 20)
                
                // Progreso
                RoundedRectangle(cornerRadius: 10)
                    .fill(completado ? Color.green : Color.blue)
                    .frame(width: progreso * 250, height: 20)
                    .animation(.easeInOut(duration: 1), value: progreso)
            }
            .frame(width: 250)
            
            // Indicador de carga
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            }
            
            // Estado completado
            if completado {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title)
                    Text("¡Completado!")
                        .font(.headline)
                }
                .transition(.scale.combined(with: .opacity))
            }
            
            // Botón de inicio
            Button(action: iniciarProceso) {
                Text(isLoading ? "Procesando..." : "Iniciar Proceso")
                    .foregroundColor(.white)
                    .padding()
                    .background(isLoading ? Color.gray : Color.blue)
                    .cornerRadius(10)
            }
            .disabled(isLoading)
        }
        .padding()
    }
    
    func iniciarProceso() {
        isLoading = true
        progreso = 0
        completado = false
        
        // Simular progreso
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            withAnimation {
                progreso += 0.2
                
                if progreso >= 1.0 {
                    timer.invalidate()
                    isLoading = false
                    withAnimation(.spring()) {
                        completado = true
                    }
                }
            }
        }
    }
}

// MARK: - 7. Modificador Personalizado
struct EstiloBotonPersonalizado: ViewModifier {
    let color: Color
    let isPressed: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(10)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .shadow(color: color.opacity(0.5), radius: isPressed ? 2 : 5, x: 0, y: isPressed ? 1 : 3)
    }
}

extension View {
    func estiloBotonPersonalizado(color: Color = .blue, isPressed: Bool = false) -> some View {
        self.modifier(EstiloBotonPersonalizado(color: color, isPressed: isPressed))
    }
}

// Ejemplo de uso del modificador personalizado
struct EjemploModificadorView: View {
    @State private var isPressed = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Modificadores Personalizados")
                .font(.title)
            
            Button("Botón Verde") {
                // Acción
            }
            .estiloBotonPersonalizado(color: .green)
            
            Button("Botón Rojo") {
                // Acción
            }
            .estiloBotonPersonalizado(color: .red)
            
            Button("Botón Animado") {
                // Acción
            }
            .estiloBotonPersonalizado(color: .purple, isPressed: isPressed)
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isPressed = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isPressed = false
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - View Principal para Demo
struct ContentView: View {
    @State private var selectedExample = 0
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("1. Stacks Básicos", destination: StacksBasicoView())
                NavigationLink("2. Modificadores y Orden", destination: ModificadoresView())
                NavigationLink("3. Animaciones Simples", destination: AnimacionSimpleView())
                NavigationLink("4. Tarjeta de Perfil", destination: TarjetaPerfilView())
                NavigationLink("5. Transiciones", destination: TransicionesView())
                NavigationLink("6. Animación Completa", destination: AnimacionCompletaView())
                NavigationLink("7. Modificadores Personalizados", destination: EjemploModificadorView())
            }
            .navigationTitle("Ejemplos SwiftUI")
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
