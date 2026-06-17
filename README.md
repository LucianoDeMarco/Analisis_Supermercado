# Análisis de Ventas - Global Superstore

## Descripción

Proyecto de análisis de datos realizado sobre el dataset **Global Superstore**.

El objetivo es explorar las ventas, clientes, productos y mercados para obtener información útil para la toma de decisiones de negocio.

## Tecnologías utilizadas

* Python
* Pandas
* SQLite
* SQL
* Matplotlib
* Jupyter Notebook

## Estructura del proyecto

* **01_exploration.ipynb:** exploración inicial de los datos.
* **02_cleaning.ipynb:** limpieza y preparación del dataset.
* **03_data_modeling.ipynb:** creación del modelo dimensional.
* **04_analysis.ipynb:** análisis de negocio y visualizaciones.
* **create_database.sql:** creación de la base de datos.
* **business_questions.sql:** consultas SQL utilizadas en el análisis.
* **load_database.py:** carga de datos en SQLite.

## Análisis realizados

* Ventas por categoría.
* Top 10 clientes por ventas.
* Profit por mercado.
* Top 10 productos por ventas.
* Ventas por país.
* Ventas por segmento de cliente.
* Profit por categoría.
* Descuento promedio por categoría.
* Productos más rentables.
* Evolución de ventas por año.

## Principales objetivos

* Identificar categorías y productos con mejor desempeño.
* Analizar la rentabilidad por mercado.
* Detectar clientes de alto valor.
* Evaluar el impacto de los descuentos.
* Observar la evolución de las ventas a lo largo del tiempo.

## Cómo ejecutar el proyecto

Instalar dependencias:

```bash
pip install -r requirements.txt
```

Ejecutar la carga de la base de datos:

```bash
python scripts/load_database.py
```

Luego abrir los notebooks para explorar el análisis.
