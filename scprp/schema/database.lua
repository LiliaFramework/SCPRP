return {
    -- Database module to use. Available options:
    -- "mysqloo" for MySQL databases
    -- "sqlite" for SQLite databases
    module = "sqlite",
    -- Hostname of the MySQL server.
    -- Not required if using SQLite.
    hostname = "127.0.0.1",
    -- Username for the MySQL database.
    -- Not required if using SQLite.
    username = "",
    -- Password for the MySQL database.
    -- Not required if using SQLite.
    password = "",
    -- Name of the MySQL database to connect to.
    -- Not required if using SQLite.
    database = "",
    -- Port number for the MySQL server.
    -- Default is 3306.
    -- Not required if using SQLite.
    port = 3306,
}