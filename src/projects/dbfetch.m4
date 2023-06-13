divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [dbfetch and Sensor Data])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([iwz_a_repo([dbfetch], [indigoparadox], [dbfetch]) is a utility that will fetch a JSON object (or list of JSON objects) from a web source and flatten it to store relevant fields into a traditional SQL-based relational database. Fields and transformations for flattening JSON blobs are provided in YAML files, the format of which is outlined below.])

iwz_p([The notes on this page mostly apply to the iwz_var([classic]) branch. The iwz_var([master]) branch went in a slightly new direction that hasn't been tested as thoroughly and may not be as compatible as we'd like.])

iwz_sect([YAML Model Definition])

iwz_p([Models are defined in YAML files under the iwz_filename([models]) subdirectory. dbfetch will try to create a table and add columns to match the model. If a column is added to the model for an existing table, dbfetch will attempt to add those columns to the existing table.])

iwz_p([All models must have at least one field with the iwz_struct([primary_key]) property.])

iwz_subsect([Top Level])

iwz_suml([
   iwz_suml_item(
      [tablename],
      [The name of the SQL table in which to store processed JSON objects as rows.])
   iwz_suml_item(
      [options],
      [Options pertaining to fetch operations. See iwz_a_anchor([#iwz_index-Options], [Options]) for more information.])
   iwz_suml_item(
      [transformations],
      [A list of field names, each containing a list of iwz_a_anchor([#iwz_index-Transformations], [Transformations]) that should be applied to each object field before it is stored in a column.])
   iwz_suml_item(
      [fields],
      [A list of field names, each containing a set of iwz_a_anchor([#iwz_index-Field-Properties], [Field Properties]) for the database column it defines.])
])

iwz_subsect([Options])

iwz_suml([
   iwz_suml_item(
      [delete_undef],
      [Delete all fields of the JSON object which are not listed in the iwz_var([fields]) list before pushing to the database.])
])

iwz_subsect([Transformations])

iwz_suml([
   iwz_suml_item(
      [Requester.format_date],
      [Takes a UNIX epoch timestamp or ISO-ish date string and attempts to turn it into a iwz_struct([DateTime]) object compatible with an SQL iwz_struct([DateTime]) field.])
   iwz_suml_item(
      [Requester.format_flatten],
      [Pulls the fields inside of an object field up to the same level as their parent, adding the parent's key as a prefix to each child's key. Removes the parent object field.])
])

iwz_subsect([Field Properties])

iwz_suml([
   iwz_suml_item(
      [type],
dnl TODO: varchar formatting.
      [The SQL type of the column. Generally, iwz_struct(int), iwz_struct(datetime), iwz_struct(float) should be usable, among others.])
   iwz_suml_item(
      [primary_key],
      [A value of iwz_var(true) or iwz_var(false), indicating the whether this field is part of the primary key in the database. iwz_b([All models should have at least one primary key, and this should not be modified after the table is created!])])
])

iwz_sect([Configuration])

iwz_p([With some models present, dbfetch can then be configured to fetch JSON objects from various sources and process them using those models. The configuration file is iwz_filename([dbfetch.ini]) by default, but this can be changed using the iwz_cmd([-c]) command-line argument.])

iwz_p([The configuration file is split into stanzas, with one stanza per model to define options for that model and multiple iwz_struct([location]) stanzas per model to define different sources to pull JSON objects from for processing and storage with that model.])

iwz_subsect([Model Stanza Options])

iwz_suml([
   iwz_suml_item(
      [connection],
      [The database connection string (any iwz_a([https://docs.sqlalchemy.org/en/20/core/engines.html], [SQLAlchemy-compatible connection string]) should work).])
   iwz_suml_item(
      [locations],
      [Comma-separated list of integers matched to location stanzas.])
])

iwz_subsect([Location Stanza Options])

iwz_suml([
   iwz_suml_item(
      [url],
      [Web URL from which to fetch JSON objects.])
])

iwz_sect([Basic Example])

iwz_p([This example will attempt to process the following JSON object, fetched from iwz_var([http://example.com/aqi.json]):])

iwz_diff(
   [aqi.json], [
   iwz_diffl([], [1], [{])
   iwz_diffl([], [2], [   "pm25_standard": 24,])
   iwz_diffl([], [3], [   "relative_humidity": 39.67132568359375,])
   iwz_diffl([], [4], [}])
])

iwz_p([This example will also use a simplified version of the model iwz_filename([i2cerv.yml]), with irrelevant parts (e.g. for plotting) stripped out.])

iwz_diff(
   [i2cerv.yml], [
   iwz_diffl([], [1], [---])
   iwz_diffl([], [2], [tablename: i2cerv])
   iwz_diffl([], [3], [options: {}])
   iwz_diffl([], [4], [transformations:])
   iwz_diffl([], [5], [  updated:])
   iwz_diffl([], [6], [  - Requester.format_date])
   iwz_diffl([], [7], [fields:])
   iwz_diffl([], [8], [  location:])
   iwz_diffl([], [9], [    type: int])
   iwz_diffl([], [10], [    primary_key: true])
   iwz_diffl([], [11], [  updated:])
   iwz_diffl([], [12], [    type: datetime])
   iwz_diffl([], [13], [    primary_key: true])
   iwz_diffl([], [14], [  pm25_standard:])
   iwz_diffl([], [15], [    type: float])
   iwz_diffl([], [16], [  relative_humidity:])
   iwz_diffl([], [17], [    type: float])
])

iwz_p([Finally, the following stanza in the configuration file, iwz_filename([dbfetch.ini]) will activate the model above when it is placed in the iwz_filename([models]) directory and use it to process the JSON object fetched from the example URL into an SQLite database (any valid SQLAlchemy connection string should work):])

iwz_diff(
   [dbfetch.ini], [
   iwz_diffl([], [1], [[[i2cerv]]])
   iwz_diffl([], [2], [connection = sqlite:///i2cerv.db])
   iwz_diffl([], [3], [locations = 1])
   iwz_diffl([], [4], [])
   iwz_diffl([], [5], [[[dbfetch-location-1]]])
   iwz_diffl([], [6], [url = http://example.com/aqi.json])
])

iwz_sect([Flattening Example])

iwz_block_construction

iwz_p([Please see iwz_filename([models/waqi.yml]) for an example of a model that pulls the children from the iwz_struct([object.data.x]) fields up to multiple iwz_struct([object.data_x]) fields.])

iwz_sect([Plotting])

iwz_block_construction

iwz_sect([MQTT])

iwz_block_construction

include([footer.m4])
