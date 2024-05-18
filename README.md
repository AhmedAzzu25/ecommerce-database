# ecommerce-database

This repository contains the schema, sample data, and queries for an e-commerce database.

## Files

- **schema.sql**: Contains the SQL commands to create the database schema.
- **add_real_data.sql**: Contains the SQL commands to insert sample data into the database.more fake data or small smaple to test using it in file named: **add_fake_data.sql**,**add_sample.sql**
- **queries.sql**: Contains SQL queries for various operations on the database.
-**categorytree_viewcreation.sql**: Contains a view for using Denormalization in category tree,dynamically generates the hierarchical data each time it's queried
## Instructions

1. Initialize the database schema:
   \`\`\`
   psql -U postgres -f schema.sql
   \`\`\`

2. Insert the sample data:
   \`\`\`
   psql -U postgres -f add_real_data.sql
   \`\`\`

3. Run the queries:
   \`\`\`
   psql -U postgres -f queries.sql
   \`\`\`
" > README.md

This repository contains the schema, sample data, and queries for an e-commerce database.

## Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/ecommerce-database.git
   cd ecommerce-database
