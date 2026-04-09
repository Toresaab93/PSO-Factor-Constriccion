# PSO con Factor de Constricción

Implementación del algoritmo Particle Swarm Optimization (PSO) , destacando el uso del Factor de Constricción para el control de la velocidad.

A diferencia del PSO tradicional, este script utiliza el Factor de Constricción ($\chi$), el cual se deriva de un análisis de estabilidad del sistema dinámico:

* **Estabilidad Garantizada:** Evita la divergencia de las partículas sin necesidad de limitar arbitrariamente la velocidad ($V_{max}$).
* **Balance Automático:** Equilibra de forma óptima la exploración (búsqueda global) y la explotación (búsqueda local).
* **Parámetros de Clerc:** Implementa los valores estándar $\phi_1 = 2.05$ y $\phi_2 = 2.05$, resultando en una constante de constricción $\chi \approx 0.729$.
