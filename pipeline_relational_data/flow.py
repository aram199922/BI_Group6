import utils
from . import config
from . import tasks

class RelationalDataFlow:
    def __init__(self):
        self.conn_relational = utils.connect_db_create_cursor("Database1", config)

    def read_and_insert_Categories(self):
        utils.insert_into_table(self.conn_relational, 'Categories', 'ORDERS_RELATIONAL_DB', 'dbo',
                                 '../raw_data_source.xlsx')