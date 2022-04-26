/// Database name
const kDataBaseName = "sakura.db";

/// Database table creation
const kInitializeTable = <String>[
  '''
  CREATE TABLE SomeThingTable (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    value TEXT
  );
  ''',
];

/// Database table update
const kMigrations = <String>[
  '''
    ALTER TABLE SomeThingTable ADD COLUMN status TEXT;
  ''',
];
