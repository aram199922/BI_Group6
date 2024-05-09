import configparser
import pyodbc
import os
import pandas as pd

# Util to read the configuration file
def get_sql_config(filename, database):
     cf = configparser.ConfigParser ()
     cf.read (filename) #Read configuration file
     # Read corresponding file parameters
     _driver = cf.get(database,"DRIVER")
     _server = cf.get(database,"Server")
     _database = cf.get(database,"Database")
     _trusted_connection = cf.get(database,"Trusted_Connection")
     return _driver, _server,_database,_trusted_connection

# Extract the tables names of the database (excluding system tables)
def extract_tables_db(cursor, *args):
    results = []
    for x in cursor.execute('exec sp_tables'):
        if x[1] not in args:
            results.append(x[2])
    return results

# Extract the column names of a table given it's name
def extract_table_cols(cursor, table_name):
    result = []
    for row in cursor.columns(table=table_name):
        result.append(row.column_name)
    return result


# A function for finding the primary key of a table
def find_primary_key(cursor, table_name, schema):
    # Find the primary key information
    table_primary_key = cursor.primaryKeys(table_name, schema=schema)

    # Store the info about the PK constraint into a dictionary
    columns = [column[0] for column in cursor.description]
    results = []
    for row in cursor.fetchall():
        results.append(dict(zip(columns, row)))
    try:
        return results[0]
    except:
        pass
    return results

def connect_db_create_cursor(database_conf_name, config):
    # Call to read the configuration file
    db_conf = get_sql_config(config.sql_server_config, database_conf_name)
    # Create a connection string for SQL Server
    db_conn_str = 'Driver={};Server={};Database={};Trusted_Connection={};'.format(*db_conf)
    # Connect to the server and to the desired database
    db_conn = pyodbc.connect(db_conn_str)
    # Create a Cursor class instance for executing T-SQL statements
    db_cursor = db_conn.cursor()
    return db_cursor


def load_query(query_name, config):
    for script in os.listdir(config.input_dir):
        if query_name in script:
            with open(config.input_dir + '\\' + script, 'r') as script_file:
                sql_script = script_file.read()
            break
    return sql_script

def insert_into_table(cursor, table_name, db, schema, source_data):
    # Read the excel table
    df = pd.read_excel(source_data, sheet_name = table_name, header=0)

    insert_into_table_script = load_query('insert_into_{}'.format(table_name)).format(db=db, schema=schema)

    # Populate a table in sql server
    for index, row in df.iterrows():
        cursor.execute(insert_into_table_script, row['BusinessEntityID'], row['FirstName'], row['LastName'])
        cursor.commit()

    print(f"{len(df)} rows have been inserted into the {db}.{schema}.{table_name} table")