# Métodos Numéricos: Ejercicios de Integración Numérica

Implementación en GNU Octave de métodos numéricos para la evaluación de integrales definidas mediante diferentes reglas de integración (Trapecio, Simpson y Boole), con cálculo de error relativo porcentual.

---

## 📂 Archivos

| Problema               | Descripción                                                                                                                                                                   |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **`Problema_21_1.m`** | Evalúa la integral \(\int_0^4 (1 - e^{-2x}) dx\) aplicando: <br><br> a) solución analítica <br> b) regla del trapecio simple <br> c) regla del trapecio compuesta (n=2,4) <br> d) Simpson 1/3 simple <br> e) Simpson 1/3 compuesta (n=4) <br> f) Simpson 3/8 simple <br> g) Simpson combinado (n=5) <br> Además calcula el error relativo porcentual con base en la solución analítica. |
| **`Problema_21_2.m`** | Evalúa la integral \(\int_0^{\pi/2} (6 + 3 \cos x) dx\) aplicando las mismas reglas numéricas (incisos a-g) y cálculo de error relativo porcentual con base en la solución analítica.|
| **`Problema_21_3.m`** | Evalúa la integral \(\int_{-2}^4 (1 - x - 4x^3 + 2x^5) dx\) aplicando: <br><br> a) solución analítica <br> b) regla del trapecio simple <br> c) regla del trapecio compuesta (n=2,4) <br> d) Simpson 1/3 simple <br> e) Simpson 3/8 simple <br> f) regla de Boole (n=4) <br> Calcula el error relativo porcentual respecto a la solución analítica. |

---

## ⚙️ Requisitos

- [GNU Octave](https://www.gnu.org/software/octave/) (recomendado: versión 7.3 o superior)  
- Alternativamente, puedes usar [Octave Online](https://octave-online.net) para ejecutar los scripts sin instalación local.

---

## 🚀 Instrucciones de uso

1. Descarga los tres archivos `.m` y colócalos en el mismo directorio.  
2. Abre GNU Octave.  
3. Ejecuta cada script por separado desde la consola de Octave, por ejemplo:

```octave
Problema_21_1.m
Problema_21_2.m
Problema_21_3.m
```
Cada script mostrará en consola los resultados de la integral exacta, las aproximaciones por cada método, y el error relativo porcentual correspondiente.

---

## 🧾 Créditos
- **Materia:** Métodos Numéricos
- **Asesor:** Claudio Hiram Carmona Jurado
- **Alumno:** Jonathan Eduardo Olivas Meixueiro
- **Matricula:** 240694
- **Fecha de entrega:** 27/Julio/2025

---
