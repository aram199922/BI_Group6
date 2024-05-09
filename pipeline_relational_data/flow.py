import utils
from . import config
from . import tasks

class RelationalDataFlow:
    def __init__(self):
        self.conn_relational = tasks.connect_db_create_cursor("Database1")

    def close_connection(self):
        self.conn_relational.close()

    def exec(self):
        # Ingesting with order (taking into account pk,fk-s)
        tasks.insert_into_Categories(self.conn_relational, 'Categories', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_Customers(self.conn_relational, 'Customers', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_Employees(self.conn_relational, 'Employees', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_Suppliers(self.conn_relational, 'Suppliers', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_Shippers(self.conn_relational, 'Shippers', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_Region(self.conn_relational, 'Region', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_Products(self.conn_relational, 'Products', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_Orders(self.conn_relational, 'Orders', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)
        tasks.insert_into_OrderDetails(self.conn_relational, 'OrderDetails', 'ORDERS_RELATIONAL_DB', 'dbo', config.data_dir)