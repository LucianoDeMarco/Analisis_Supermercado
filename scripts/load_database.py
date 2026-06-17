import sqlite3
import pandas as pd
import os

# Conexión
os.makedirs("../data/database", exist_ok=True)

conn = sqlite3.connect("../data/database/superstore.db")

print("¡Conexión exitosa a la base de datos!")

# Activar foreign keys
conn.execute("PRAGMA foreign_keys = ON")

# Crear estructura
with open("../sql/create_database.sql", "r") as f:
    conn.executescript(f.read())

# Leer archivos
customers = pd.read_csv("../data/Processed/customers.csv")
products = pd.read_csv("../data/Processed/products.csv")
orders = pd.read_csv("../data/Processed/orders.csv")
locations = pd.read_csv("../data/Processed/locations.csv")
order_details = pd.read_csv("../data/Processed/order_details.csv")

customers.columns = customers.columns.str.lower().str.replace(' ', '_').str.replace('-', '_')
products.columns = products.columns.str.lower().str.replace(' ', '_').str.replace('-', '_')
locations.columns = locations.columns.str.lower().str.replace(' ', '_').str.replace('-', '_')
orders.columns = orders.columns.str.lower().str.replace(' ', '_').str.replace('-', '_')
order_details.columns = order_details.columns.str.lower().str.replace(' ', '_').str.replace('-', '_')

customers = customers.drop_duplicates(subset=['customer_id'])
products = products.drop_duplicates(subset=['product_id'])
orders = orders.drop_duplicates(subset=['order_id'])

# Cargar datos
customers.to_sql("customers", conn, if_exists="append", index=False)

products.to_sql("products", conn, if_exists="append", index=False)

orders.to_sql("orders", conn, if_exists="append", index=False)

locations.to_sql("locations", conn, if_exists="append", index=False)

order_details.to_sql("order_details", conn, if_exists="append", index=False)

# Verificación
tables = [
    "customers",
    "products",
    "orders",
    "locations",
    "order_details"
]

for table in tables:
    result = pd.read_sql(
        f"SELECT COUNT(*) AS total FROM {table}",
        conn
    )
    print(f"{table}: {result['total'][0]}")

conn.close()

print("Base de datos creada correctamente.")
print(os.path.abspath("data/database/superstore.db"))
print(os.path.exists("data/database/superstore.db"))