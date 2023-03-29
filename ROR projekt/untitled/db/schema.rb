# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_29_185429) do
  create_table "aq$_internet_agent_privs", id: false, force: :cascade do |t|
    t.string "agent_name", limit: 512, null: false
    t.string "db_username", limit: 128, null: false
    t.index ["agent_name", "db_username"], name: "unq_pairs", unique: true
  end

  create_table "aq$_internet_agents", primary_key: "agent_name", id: { type: :string, limit: 512 }, force: :cascade do |t|
    t.integer "protocol", precision: 38, null: false
    t.string "spare1", limit: 128
  end

  create_table "aq$_key_shard_map", id: false, force: :cascade do |t|
    t.decimal "queue", null: false
    t.string "key", limit: 128, null: false
    t.decimal "shard", null: false
    t.decimal "delay_shard", null: false
    t.index ["queue", "key"], name: "aq$_key_shard_map_pk", unique: true
  end

  create_table "aq$_queue_tables", primary_key: "objno", id: :decimal, force: :cascade do |t|
    t.string "schema", limit: 128, null: false
    t.string "name", limit: 128, null: false
    t.decimal "udata_type", null: false
    t.decimal "flags", null: false
    t.decimal "sort_cols", null: false
    t.string "timezone", limit: 64
    t.string "table_comment", limit: 2000
    t.index ["objno", "schema", "flags"], name: "i1_queue_tables"
  end

# Could not dump table "aq$_queues" because of following StandardError
#   Unknown type 'SYS.AQ$_SUBSCRIBERS' for column 'subscribers'

  create_table "aq$_schedules", primary_key: ["oid", "destination"], force: :cascade do |t|
    t.raw "oid", limit: 16, null: false
    t.string "destination", limit: 390, null: false
    t.date "start_time"
    t.string "duration", limit: 8
    t.string "next_time", limit: 128
    t.string "latency", limit: 8
    t.date "last_time"
    t.decimal "jobno"
    t.index ["jobno"], name: "aq$_schedules_check", unique: true
  end

  create_table "ertekels",  primary_key: ["felhaszn_id", "hirdetes_id"],force: :cascade do |t|
    t.integer "felhaszn_id", precision: 38
    t.integer "hirdetes_id", precision: 38
    t.integer "csillag", precision: 38
    t.string "leiras"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "felhasznalos", force: :cascade do |t|
    t.string "nev"
    t.string "email"
    t.string "jelszo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "help", primary_key: ["topic", "seq"], force: :cascade do |t|
    t.string "topic", limit: 50, null: false
    t.decimal "seq", null: false
    t.string "info", limit: 80
  end

  create_table "hirdetes", force: :cascade do |t|
    t.string "termek_nev"
    t.float "mennyiseg"
    t.float "ar_kg"
    t.integer "min_vasarlas", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hirdets", primary_key: ["felhaszn_id", "hirdetes_id"], force: :cascade do |t|
    t.integer "felhaszn_id", precision: 38
    t.integer "hirdetes_id", precision: 38
    t.date "mikor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kiszallits", primary_key: ["rendel_id", "szallito_id"], force: :cascade do |t|
    t.integer "rendel_id", precision: 38
    t.integer "szallito_id", precision: 38
    t.float "mennyiseg"
    t.string "hova"
    t.float "koltseg"
    t.date "varhato_szallitas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logmnr_age_spill$", primary_key: ["session#", "pdbid", "xidusn", "xidslt", "xidsqn", "chunk", "sequence#"], force: :cascade do |t|
    t.decimal "session#", null: false
    t.decimal "xidusn", null: false
    t.decimal "xidslt", null: false
    t.decimal "xidsqn", null: false
    t.decimal "chunk", null: false
    t.decimal "sequence#", null: false
    t.decimal "offset"
    t.binary "spill_data"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "pdbid", null: false
  end

  create_table "logmnr_attrcol$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "intcol#"
    t.string "name", limit: 4000
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1attrcol$"
  end

  create_table "logmnr_attribute$", primary_key: ["logmnr_uid", "toid", "version#", "attribute#"], force: :cascade do |t|
    t.decimal "version#"
    t.string "name", limit: 384
    t.decimal "attribute#"
    t.raw "attr_toid", limit: 16
    t.decimal "attr_version#"
    t.decimal "synobj#"
    t.decimal "properties"
    t.decimal "charsetid"
    t.decimal "charsetform"
    t.decimal "length"
    t.decimal "precision#"
    t.decimal "scale"
    t.string "externname", limit: 4000
    t.decimal "xflags"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.decimal "spare4"
    t.decimal "spare5"
    t.decimal "setter"
    t.decimal "getter"
    t.raw "toid", limit: 16, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "toid", "version#", "attribute#"], name: "logmnr_i1attribute$"
  end

  create_table "logmnr_ccol$", primary_key: ["logmnr_uid", "con#", "intcol#"], force: :cascade do |t|
    t.decimal "con#"
    t.decimal "obj#"
    t.decimal "col#"
    t.decimal "pos#"
    t.decimal "intcol#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "con#", "intcol#"], name: "logmnr_i1ccol$"
  end

  create_table "logmnr_cdef$", primary_key: ["logmnr_uid", "con#"], force: :cascade do |t|
    t.decimal "con#"
    t.decimal "cols"
    t.decimal "type#"
    t.decimal "robj#"
    t.decimal "rcon#"
    t.decimal "enabled"
    t.decimal "defer"
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "con#"], name: "logmnr_i1cdef$"
    t.index ["logmnr_uid", "obj#"], name: "logmnr_i3cdef$"
    t.index ["logmnr_uid", "robj#"], name: "logmnr_i2cdef$"
  end

  create_table "logmnr_col$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.integer "col#", limit: 22, precision: 22
    t.integer "segcol#", limit: 22, precision: 22
    t.string "name", limit: 384
    t.integer "type#", limit: 22, precision: 22
    t.integer "length", limit: 22, precision: 22
    t.integer "precision#", limit: 22, precision: 22
    t.integer "scale", limit: 22, precision: 22
    t.integer "null$", limit: 22, precision: 22
    t.integer "intcol#", limit: 22, precision: 22
    t.decimal "property"
    t.integer "charsetid", limit: 22, precision: 22
    t.integer "charsetform", limit: 22, precision: 22
    t.integer "spare1", limit: 22, precision: 22
    t.integer "spare2", limit: 22, precision: 22
    t.integer "obj#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.decimal "collid"
    t.decimal "collintcol#"
    t.decimal "acdrrescol#"
    t.index ["logmnr_uid", "obj#", "col#"], name: "logmnr_i3col$"
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1col$"
    t.index ["logmnr_uid", "obj#", "name"], name: "logmnr_i2col$"
  end

  create_table "logmnr_coltype$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "col#"
    t.decimal "intcol#"
    t.raw "toid", limit: 16
    t.decimal "version#"
    t.decimal "packed"
    t.decimal "intcols"
    t.raw "intcol#s"
    t.decimal "flags"
    t.decimal "typidcol#"
    t.decimal "synobj#"
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1coltype$"
  end

  create_table "logmnr_con$", primary_key: ["logmnr_uid", "con#"], force: :cascade do |t|
    t.decimal "owner#", null: false
    t.string "name", limit: 384, null: false
    t.decimal "con#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.decimal "start_scnbas"
    t.decimal "start_scnwrp"
    t.index ["logmnr_uid", "con#"], name: "logmnr_i1con$"
  end

  create_table "logmnr_container$", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.decimal "obj#", null: false
    t.decimal "con_id#", null: false
    t.decimal "dbid", null: false
    t.decimal "con_uid", null: false
    t.decimal "create_scnwrp", null: false
    t.decimal "create_scnbas", null: false
    t.decimal "flags"
    t.decimal "status", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.decimal "vsn"
    t.decimal "fed_root_con_id#"
    t.index ["logmnr_uid", "con_id#"], name: "logmnr_i1container$"
  end

  create_table "logmnr_dictionary$", primary_key: "logmnr_uid", id: { limit: 22, precision: 22 }, force: :cascade do |t|
    t.string "db_name", limit: 27
    t.integer "db_id", limit: 20, precision: 20
    t.string "db_created", limit: 20
    t.string "db_dict_created", limit: 20
    t.integer "db_dict_scn", limit: 22, precision: 22
    t.raw "db_thread_map", limit: 8
    t.integer "db_txn_scnbas", limit: 22, precision: 22
    t.integer "db_txn_scnwrp", limit: 22, precision: 22
    t.integer "db_resetlogs_change#", limit: 22, precision: 22
    t.string "db_resetlogs_time", limit: 20
    t.string "db_version_time", limit: 20
    t.string "db_redo_type_id", limit: 8
    t.string "db_redo_release", limit: 60
    t.string "db_character_set", limit: 192
    t.string "db_version", limit: 240
    t.string "db_status", limit: 240
    t.string "db_global_name", limit: 384
    t.integer "db_dict_maxobjects", limit: 22, precision: 22
    t.integer "db_dict_objectcount", limit: 22, precision: 22, null: false
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.string "pdb_name", limit: 384
    t.decimal "pdb_id"
    t.decimal "pdb_uid"
    t.decimal "pdb_dbid"
    t.raw "pdb_guid", limit: 16
    t.decimal "pdb_create_scn"
    t.decimal "pdb_count"
    t.string "pdb_global_name", limit: 384
    t.decimal "fed_root_con_id#"
    t.index ["logmnr_uid"], name: "logmnr_i1dictionary$"
  end

  create_table "logmnr_dictstate$", primary_key: "logmnr_uid", id: { limit: 22, precision: 22 }, force: :cascade do |t|
    t.decimal "start_scnbas"
    t.decimal "start_scnwrp"
    t.decimal "end_scnbas"
    t.decimal "end_scnwrp"
    t.decimal "redo_thread"
    t.decimal "rbasqn"
    t.decimal "rbablk"
    t.decimal "rbabyte"
    t.integer "logmnr_flags", limit: 22, precision: 22
  end

  create_table "logmnr_did$", primary_key: "session#", id: :decimal, force: :cascade do |t|
    t.decimal "logmnr_did"
    t.decimal "flags", default: "0.0"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.datetime "spare4"
  end

  create_table "logmnr_enc$", primary_key: ["logmnr_uid", "obj#", "owner#"], force: :cascade do |t|
    t.decimal "obj#"
    t.decimal "owner#"
    t.decimal "encalg"
    t.decimal "intalg"
    t.raw "colklc"
    t.decimal "klclen"
    t.decimal "flag"
    t.string "mkeyid", limit: 192, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "owner#"], name: "logmnr_i1enc$"
  end

  create_table "logmnr_error$", id: false, force: :cascade do |t|
    t.decimal "session#"
    t.date "time_of_error"
    t.decimal "code"
    t.string "message", limit: 4000
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.string "spare4", limit: 4000
    t.string "spare5", limit: 4000
  end

  create_table "logmnr_filter$", id: false, force: :cascade do |t|
    t.decimal "session#"
    t.string "filter_type", limit: 30
    t.decimal "attr1"
    t.decimal "attr2"
    t.decimal "attr3"
    t.decimal "attr4"
    t.decimal "attr5"
    t.decimal "attr6"
    t.decimal "filter_scn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.date "spare3"
    t.string "attr7", limit: 128
    t.string "attr8", limit: 128
    t.string "attr9", limit: 128
    t.string "attr10", limit: 128
    t.string "attr11", limit: 128
  end

  create_table "logmnr_global$", id: false, force: :cascade do |t|
    t.decimal "high_recid_foreign"
    t.decimal "high_recid_deleted"
    t.decimal "local_reset_scn"
    t.decimal "local_reset_timestamp"
    t.decimal "version_timestamp"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.string "spare4", limit: 2000
    t.date "spare5"
    t.decimal "session#"
  end

  create_table "logmnr_gt_tab_include$", temporary: true, id: false, force: :cascade do |t|
    t.string "schema_name", limit: 390
    t.string "table_name", limit: 390
    t.string "pdb_name", limit: 390
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
  end

  create_table "logmnr_gt_user_include$", temporary: true, id: false, force: :cascade do |t|
    t.string "user_name", limit: 390
    t.decimal "user_type"
    t.string "pdb_name", limit: 390
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
  end

  create_table "logmnr_gt_xid_include$", temporary: true, id: false, force: :cascade do |t|
    t.decimal "xidusn"
    t.decimal "xidslt"
    t.decimal "xidsqn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.decimal "pdbid"
    t.string "pdb_name", limit: 390
  end

  create_table "logmnr_icol$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "obj#"
    t.decimal "bo#"
    t.decimal "col#"
    t.decimal "pos#"
    t.decimal "segcol#"
    t.decimal "intcol#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1icol$"
  end

  create_table "logmnr_idnseq$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "obj#", null: false
    t.decimal "intcol#", null: false
    t.decimal "seqobj#", null: false
    t.decimal "startwith", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1idnseq$"
    t.index ["logmnr_uid", "seqobj#"], name: "logmnr_i2idnseq$"
  end

  create_table "logmnr_ind$", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.integer "bo#", limit: 22, precision: 22
    t.integer "cols", limit: 22, precision: 22
    t.integer "type#", limit: 22, precision: 22
    t.decimal "flags"
    t.decimal "property"
    t.integer "obj#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "bo#"], name: "logmnr_i2ind$"
    t.index ["logmnr_uid", "obj#"], name: "logmnr_i1ind$"
  end

  create_table "logmnr_indcompart$", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.decimal "obj#"
    t.decimal "dataobj#"
    t.decimal "bo#"
    t.decimal "part#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#"], name: "logmnr_i1indcompart$"
  end

  create_table "logmnr_indpart$", primary_key: ["logmnr_uid", "obj#", "bo#"], force: :cascade do |t|
    t.decimal "obj#"
    t.decimal "bo#"
    t.decimal "part#"
    t.decimal "ts#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "bo#"], name: "logmnr_i2indpart$"
    t.index ["logmnr_uid", "obj#", "bo#"], name: "logmnr_i1indpart$"
  end

  create_table "logmnr_indsubpart$", primary_key: ["logmnr_uid", "obj#", "pobj#"], force: :cascade do |t|
    t.integer "obj#", limit: 22, precision: 22
    t.integer "dataobj#", limit: 22, precision: 22
    t.integer "pobj#", limit: 22, precision: 22
    t.integer "subpart#", limit: 22, precision: 22
    t.integer "ts#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "pobj#"], name: "logmnr_i1indsubpart$"
  end

  create_table "logmnr_kopm$", primary_key: ["logmnr_uid", "name"], force: :cascade do |t|
    t.decimal "length"
    t.raw "metadata", limit: 255
    t.string "name", limit: 384, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "name"], name: "logmnr_i1kopm$"
  end

  create_table "logmnr_lob$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "obj#"
    t.decimal "intcol#"
    t.decimal "col#"
    t.decimal "lobj#"
    t.decimal "chunk", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1lob$"
  end

  create_table "logmnr_lobfrag$", primary_key: ["logmnr_uid", "fragobj#"], force: :cascade do |t|
    t.decimal "fragobj#"
    t.decimal "parentobj#"
    t.decimal "tabfragobj#"
    t.decimal "indfragobj#"
    t.decimal "frag#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "fragobj#"], name: "logmnr_i1lobfrag$"
  end

  create_table "logmnr_log$", primary_key: ["session#", "thread#", "sequence#", "first_change#", "db_id", "resetlogs_change#", "reset_timestamp"], force: :cascade do |t|
    t.decimal "session#", null: false
    t.decimal "thread#", null: false
    t.decimal "sequence#", null: false
    t.decimal "first_change#", null: false
    t.decimal "next_change#"
    t.date "first_time"
    t.date "next_time"
    t.string "file_name", limit: 513
    t.decimal "status"
    t.string "info", limit: 32
    t.date "timestamp"
    t.string "dict_begin", limit: 3
    t.string "dict_end", limit: 3
    t.string "status_info", limit: 32
    t.decimal "db_id", null: false
    t.decimal "resetlogs_change#", null: false
    t.decimal "reset_timestamp", null: false
    t.decimal "prev_resetlogs_change#"
    t.decimal "prev_reset_timestamp"
    t.decimal "blocks"
    t.decimal "block_size"
    t.decimal "flags"
    t.decimal "contents"
    t.decimal "recid"
    t.decimal "recstamp"
    t.decimal "mark_delete_timestamp"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.decimal "spare4"
    t.decimal "spare5"
    t.index ["file_name", "status"], name: "logmnr_log$_purge_idx1", tablespace: "sysaux"
    t.index ["first_change#"], name: "logmnr_log$_first_change#", tablespace: "sysaux"
    t.index ["flags"], name: "logmnr_log$_flags", tablespace: "sysaux"
    t.index ["recid"], name: "logmnr_log$_recid", tablespace: "sysaux"
    t.index ["session#", "reset_timestamp", "next_change#", "status"], name: "logmnr_log$_purge_idx2", tablespace: "sysaux"
  end

  create_table "logmnr_logmnr_buildlog", primary_key: ["logmnr_uid", "initial_xid"], force: :cascade do |t|
    t.string "build_date", limit: 20
    t.decimal "db_txn_scnbas"
    t.decimal "db_txn_scnwrp"
    t.decimal "current_build_state"
    t.decimal "completion_status"
    t.decimal "marked_log_file_low_scn"
    t.string "initial_xid", limit: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.string "cdb_xid", limit: 22
    t.decimal "spare1"
    t.string "spare2", limit: 4000
    t.index ["logmnr_uid", "initial_xid"], name: "logmnr_i1logmnr_buildlog"
  end

  create_table "logmnr_ntab$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "col#"
    t.decimal "intcol#"
    t.decimal "ntab#"
    t.string "name", limit: 4000
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "ntab#"], name: "logmnr_i2ntab$"
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1ntab$"
  end

  create_table "logmnr_obj$", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.integer "objv#", limit: 22, precision: 22
    t.integer "owner#", limit: 22, precision: 22
    t.string "name", limit: 384
    t.integer "namespace", limit: 22, precision: 22
    t.string "subname", limit: 384
    t.integer "type#", limit: 22, precision: 22
    t.raw "oid$", limit: 16
    t.string "remoteowner", limit: 384
    t.string "linkname", limit: 384
    t.integer "flags", limit: 22, precision: 22
    t.integer "spare3", limit: 22, precision: 22
    t.date "stime"
    t.integer "obj#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.decimal "start_scnbas"
    t.decimal "start_scnwrp"
    t.index ["logmnr_uid", "name"], name: "logmnr_i3obj$"
    t.index ["logmnr_uid", "obj#"], name: "logmnr_i1obj$"
    t.index ["logmnr_uid", "oid$"], name: "logmnr_i2obj$"
  end

  create_table "logmnr_opqtype$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "intcol#", null: false
    t.decimal "type"
    t.decimal "flags"
    t.decimal "lobcol"
    t.decimal "objcol"
    t.decimal "extracol"
    t.raw "schemaoid", limit: 16
    t.decimal "elemnum"
    t.string "schemaurl", limit: 4000
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1opqtype$"
  end

  create_table "logmnr_parameter$", id: false, force: :cascade do |t|
    t.decimal "session#", null: false
    t.string "name", limit: 384, null: false
    t.string "value", limit: 2000
    t.decimal "type"
    t.decimal "scn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
    t.index ["session#", "name"], name: "logmnr_parameter_indx"
  end

  create_table "logmnr_partobj$", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.decimal "parttype"
    t.decimal "partcnt"
    t.decimal "partkeycols"
    t.decimal "flags"
    t.decimal "defts#"
    t.decimal "defpctfree"
    t.decimal "defpctused"
    t.decimal "defpctthres"
    t.decimal "definitrans"
    t.decimal "defmaxtrans"
    t.decimal "deftiniexts"
    t.decimal "defextsize"
    t.decimal "defminexts"
    t.decimal "defmaxexts"
    t.decimal "defextpct"
    t.decimal "deflists"
    t.decimal "defgroups"
    t.decimal "deflogging"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.decimal "definclcol"
    t.string "parameters", limit: 3000
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#"], name: "logmnr_i1partobj$"
  end

  create_table "logmnr_pdb_info$", primary_key: ["logmnr_did", "logmnr_mdh", "plugin_scn"], force: :cascade do |t|
    t.decimal "logmnr_did", null: false
    t.decimal "logmnr_mdh", null: false
    t.string "pdb_name", limit: 384
    t.decimal "pdb_id"
    t.decimal "pdb_uid"
    t.decimal "plugin_scn", null: false
    t.decimal "unplug_scn"
    t.decimal "flags"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.datetime "spare4"
    t.string "pdb_global_name", limit: 384
  end

  create_table "logmnr_processed_log$", primary_key: ["session#", "thread#"], force: :cascade do |t|
    t.decimal "session#", null: false
    t.decimal "thread#", null: false
    t.decimal "sequence#"
    t.decimal "first_change#"
    t.decimal "next_change#"
    t.date "first_time"
    t.date "next_time"
    t.string "file_name", limit: 513
    t.decimal "status"
    t.string "info", limit: 32
    t.date "timestamp"
  end

  create_table "logmnr_profile_plsql_stats$", primary_key: ["pkgowner", "pkgname", "name"], force: :cascade do |t|
    t.string "pkgowner", limit: 384, null: false
    t.string "pkgname", limit: 384, null: false
    t.decimal "name", null: false
    t.decimal "pragmaop"
    t.decimal "opnum"
    t.decimal "tlsbyunsuppopnum"
    t.decimal "oggunsuppopnum"
    t.decimal "redosize"
    t.decimal "redorate"
    t.string "spare1", limit: 384
    t.string "spare2", limit: 384
    t.decimal "spare3"
    t.decimal "spare4"
    t.decimal "spare5"
    t.decimal "spare6"
  end

  create_table "logmnr_profile_table_stats$", primary_key: "objid", id: :decimal, force: :cascade do |t|
    t.string "owner", limit: 384
    t.string "name", limit: 384
    t.decimal "opnum"
    t.decimal "tlsbyunsuppopnum"
    t.decimal "oggunsuppopnum"
    t.decimal "oggfetchopnum"
    t.decimal "oggplsqlopnum"
    t.decimal "partnum"
    t.decimal "insertnum"
    t.decimal "updatenum"
    t.decimal "deletenum"
    t.decimal "ddlnum"
    t.decimal "property1"
    t.decimal "property2"
    t.decimal "partitionattr"
    t.decimal "redosize"
    t.decimal "maxlobsize"
    t.decimal "redorate"
    t.string "spare1", limit: 384
    t.string "spare2", limit: 384
    t.decimal "spare3"
    t.decimal "spare4"
    t.decimal "spare5"
    t.decimal "spare6"
  end

  create_table "logmnr_props$", primary_key: ["logmnr_uid", "name"], force: :cascade do |t|
    t.string "value$", limit: 4000
    t.string "comment$", limit: 4000
    t.string "name", limit: 384, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "name"], name: "logmnr_i1props$"
  end

  create_table "logmnr_refcon$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.decimal "col#"
    t.decimal "intcol#"
    t.decimal "reftyp"
    t.raw "stabid", limit: 16
    t.raw "expctoid", limit: 16
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1refcon$"
  end

  create_table "logmnr_restart_ckpt$", primary_key: ["session#", "ckpt_scn", "xidusn", "xidslt", "xidsqn", "pdbid", "session_num", "serial_num"], force: :cascade do |t|
    t.decimal "session#", null: false
    t.decimal "valid"
    t.decimal "ckpt_scn", null: false
    t.decimal "xidusn", null: false
    t.decimal "xidslt", null: false
    t.decimal "xidsqn", null: false
    t.decimal "session_num", null: false
    t.decimal "serial_num", null: false
    t.binary "ckpt_info"
    t.decimal "flag"
    t.decimal "offset"
    t.binary "client_data"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "pdbid", null: false
  end

  create_table "logmnr_restart_ckpt_txinfo$", primary_key: ["session#", "xidusn", "xidslt", "xidsqn", "session_num", "serial_num", "effective_scn"], force: :cascade do |t|
    t.decimal "session#", null: false
    t.decimal "xidusn", null: false
    t.decimal "xidslt", null: false
    t.decimal "xidsqn", null: false
    t.decimal "session_num", null: false
    t.decimal "serial_num", null: false
    t.decimal "flag"
    t.decimal "start_scn"
    t.decimal "effective_scn", null: false
    t.decimal "offset"
    t.binary "tx_data"
  end

  create_table "logmnr_seed$", primary_key: ["logmnr_uid", "obj#", "intcol#"], force: :cascade do |t|
    t.integer "seed_version", limit: 22, precision: 22
    t.integer "gather_version", limit: 22, precision: 22
    t.string "schemaname", limit: 384
    t.decimal "obj#"
    t.integer "objv#", limit: 22, precision: 22
    t.string "table_name", limit: 384
    t.string "col_name", limit: 384
    t.decimal "col#"
    t.decimal "intcol#"
    t.decimal "segcol#"
    t.decimal "type#"
    t.decimal "length"
    t.decimal "precision#"
    t.decimal "scale"
    t.decimal "null$", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#"], name: "logmnr_i1seed$"
    t.index ["logmnr_uid", "schemaname", "table_name", "col_name", "obj#", "intcol#"], name: "logmnr_i2seed$"
  end

  create_table "logmnr_session$", primary_key: "session#", id: :decimal, force: :cascade do |t|
    t.decimal "client#"
    t.string "session_name", limit: 128, null: false
    t.decimal "db_id"
    t.decimal "resetlogs_change#"
    t.decimal "session_attr"
    t.string "session_attr_verbose", limit: 400
    t.decimal "start_scn"
    t.decimal "end_scn"
    t.decimal "spill_scn"
    t.date "spill_time"
    t.decimal "oldest_scn"
    t.decimal "resume_scn"
    t.string "global_db_name", limit: 384
    t.decimal "reset_timestamp"
    t.decimal "branch_scn"
    t.string "version", limit: 64
    t.string "redo_compat", limit: 20
    t.decimal "spare1"
    t.decimal "purge_scn"
    t.decimal "spare3"
    t.decimal "spare4"
    t.decimal "spare5"
    t.date "spare6"
    t.string "spare7", limit: 1000
    t.string "spare8", limit: 1000
    t.decimal "spare9"
    t.index ["session_name"], name: "logmnr_session_uk1", unique: true
  end

  create_table "logmnr_session_actions$", primary_key: ["logmnrsession#", "actionname"], force: :cascade do |t|
    t.decimal "flagsruntime", default: "0.0"
    t.decimal "dropscn"
    t.datetime "modifytime"
    t.datetime "dispatchtime"
    t.datetime "droptime"
    t.decimal "lcrcount", default: "0.0"
    t.string "actionname", limit: 30, null: false
    t.decimal "logmnrsession#", null: false
    t.decimal "processrole#", null: false
    t.decimal "actiontype#", null: false
    t.decimal "flagsdefinetime"
    t.datetime "createtime"
    t.decimal "xidusn"
    t.decimal "xidslt"
    t.decimal "xidsqn"
    t.decimal "thread#"
    t.decimal "startscn"
    t.decimal "startsubscn"
    t.decimal "endscn"
    t.decimal "endsubscn"
    t.decimal "rbasqn"
    t.decimal "rbablk"
    t.decimal "rbabyte"
    t.decimal "session#"
    t.decimal "obj#"
    t.decimal "attr1"
    t.decimal "attr2"
    t.decimal "attr3"
    t.decimal "spare1"
    t.decimal "spare2"
    t.datetime "spare3"
    t.string "spare4", limit: 2000
    t.decimal "pdbid"
    t.string "pdb_name", limit: 390
  end

  create_table "logmnr_session_evolve$", primary_key: ["session#", "db_id", "reset_scn", "reset_timestamp"], force: :cascade do |t|
    t.decimal "branch_level"
    t.decimal "session#", null: false
    t.decimal "db_id", null: false
    t.decimal "reset_scn", null: false
    t.decimal "reset_timestamp", null: false
    t.decimal "prev_reset_scn"
    t.decimal "prev_reset_timestamp"
    t.decimal "status"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.date "spare4"
  end

  create_table "logmnr_shard_ts", primary_key: ["logmnr_uid", "tablespace_name"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.string "tablespace_name", limit: 90, null: false
    t.decimal "chunk_number", null: false
    t.decimal "start_scnbas"
    t.decimal "start_scnwrp"
    t.index ["logmnr_uid", "tablespace_name"], name: "logmnr_i1shard_ts"
  end

  create_table "logmnr_spill$", primary_key: ["session#", "pdbid", "xidusn", "xidslt", "xidsqn", "chunk", "startidx", "endidx", "flag", "sequence#"], force: :cascade do |t|
    t.decimal "session#", null: false
    t.decimal "xidusn", null: false
    t.decimal "xidslt", null: false
    t.decimal "xidsqn", null: false
    t.decimal "chunk", null: false
    t.decimal "startidx", null: false
    t.decimal "endidx", null: false
    t.decimal "flag", null: false
    t.decimal "sequence#", null: false
    t.binary "spill_data"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "pdbid", null: false
  end

  create_table "logmnr_subcoltype$", primary_key: ["logmnr_uid", "obj#", "intcol#", "toid"], force: :cascade do |t|
    t.decimal "intcol#", null: false
    t.raw "toid", limit: 16, null: false
    t.decimal "version#", null: false
    t.decimal "intcols"
    t.raw "intcol#s"
    t.decimal "flags"
    t.decimal "synobj#"
    t.decimal "obj#", null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "intcol#", "toid"], name: "logmnr_i1subcoltype$"
  end

  create_table "logmnr_tab$", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.integer "ts#", limit: 22, precision: 22
    t.integer "cols", limit: 22, precision: 22
    t.decimal "property"
    t.integer "intcols", limit: 22, precision: 22
    t.integer "kernelcols", limit: 22, precision: 22
    t.integer "bobj#", limit: 22, precision: 22
    t.integer "trigflag", limit: 22, precision: 22
    t.integer "flags", limit: 22, precision: 22
    t.integer "obj#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.decimal "acdrflags"
    t.decimal "acdrtsobj#"
    t.decimal "acdrrowtsintcol#"
    t.index ["logmnr_uid", "bobj#"], name: "logmnr_i2tab$"
    t.index ["logmnr_uid", "obj#"], name: "logmnr_i1tab$"
  end

  create_table "logmnr_tabcompart$", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.integer "obj#", limit: 22, precision: 22
    t.integer "bo#", limit: 22, precision: 22
    t.integer "part#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "bo#"], name: "logmnr_i2tabcompart$"
    t.index ["logmnr_uid", "obj#"], name: "logmnr_i1tabcompart$"
  end

  create_table "logmnr_tabpart$", primary_key: ["logmnr_uid", "obj#", "bo#"], force: :cascade do |t|
    t.integer "obj#", limit: 22, precision: 22
    t.integer "ts#", limit: 22, precision: 22
    t.decimal "part#"
    t.integer "bo#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "bo#"], name: "logmnr_i2tabpart$"
    t.index ["logmnr_uid", "obj#", "bo#"], name: "logmnr_i1tabpart$"
  end

  create_table "logmnr_tabsubpart$", primary_key: ["logmnr_uid", "obj#", "pobj#"], force: :cascade do |t|
    t.integer "obj#", limit: 22, precision: 22
    t.integer "dataobj#", limit: 22, precision: 22
    t.integer "pobj#", limit: 22, precision: 22
    t.integer "subpart#", limit: 22, precision: 22
    t.integer "ts#", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "obj#", "pobj#"], name: "logmnr_i1tabsubpart$"
    t.index ["logmnr_uid", "pobj#"], name: "logmnr_i2tabsubpart$"
  end

  create_table "logmnr_ts$", primary_key: ["logmnr_uid", "ts#"], force: :cascade do |t|
    t.integer "ts#", limit: 22, precision: 22
    t.string "name", limit: 90
    t.integer "owner#", limit: 22, precision: 22
    t.integer "blocksize", limit: 22, precision: 22, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.decimal "start_scnbas"
    t.decimal "start_scnwrp"
    t.index ["logmnr_uid", "ts#"], name: "logmnr_i1ts$"
  end

  create_table "logmnr_type$", primary_key: ["logmnr_uid", "toid", "version#"], force: :cascade do |t|
    t.decimal "version#"
    t.string "version", limit: 384
    t.raw "tvoid", limit: 16
    t.decimal "typecode"
    t.decimal "properties"
    t.decimal "attributes"
    t.decimal "methods"
    t.decimal "hiddenmethods"
    t.decimal "supertypes"
    t.decimal "subtypes"
    t.decimal "externtype"
    t.string "externname", limit: 4000
    t.string "helperclassname", limit: 4000
    t.decimal "local_attrs"
    t.decimal "local_methods"
    t.raw "typeid", limit: 16
    t.raw "roottoid", limit: 16
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.raw "supertoid", limit: 16
    t.raw "hashcode", limit: 17
    t.raw "toid", limit: 16, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.index ["logmnr_uid", "toid", "version#"], name: "logmnr_i1type$"
  end

  create_table "logmnr_uid$", primary_key: "logmnr_uid", id: { limit: 22, precision: 22 }, force: :cascade do |t|
    t.decimal "logmnr_did"
    t.decimal "logmnr_mdh"
    t.string "pdb_name", limit: 384
    t.decimal "pdb_id"
    t.decimal "pdb_uid"
    t.decimal "start_scn"
    t.decimal "end_scn"
    t.decimal "flags"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.datetime "spare4"
  end

  create_table "logmnr_user$", primary_key: ["logmnr_uid", "user#"], force: :cascade do |t|
    t.integer "user#", limit: 22, precision: 22
    t.string "name", limit: 384, null: false
    t.integer "logmnr_uid", limit: 22, precision: 22
    t.integer "logmnr_flags", limit: 22, precision: 22
    t.decimal "spare1"
    t.index ["logmnr_uid", "name"], name: "logmnr_i2user$"
    t.index ["logmnr_uid", "user#"], name: "logmnr_i1user$"
  end

  create_table "logmnrc_con_gg", primary_key: ["logmnr_uid", "con#", "commit_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "con#", null: false
    t.string "name", limit: 384, null: false
    t.decimal "commit_scn", null: false
    t.decimal "drop_scn"
    t.decimal "baseobj#", null: false
    t.decimal "baseobjv#", null: false
    t.decimal "flags", null: false
    t.decimal "indexobj#"
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.string "spare4", limit: 4000
    t.string "spare5", limit: 4000
    t.string "spare6", limit: 4000
    t.index ["logmnr_uid", "baseobj#", "baseobjv#", "commit_scn"], name: "logmnrc_i1congg"
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrc_i2congg"
  end

  create_table "logmnrc_concol_gg", primary_key: ["logmnr_uid", "con#", "commit_scn", "intcol#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "con#", null: false
    t.decimal "commit_scn", null: false
    t.decimal "intcol#", null: false
    t.decimal "pos#"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
  end

  create_table "logmnrc_dbname_uid_map", primary_key: ["global_name", "logmnr_mdh"], force: :cascade do |t|
    t.string "global_name", limit: 384, null: false
    t.decimal "logmnr_uid"
    t.decimal "flags"
    t.string "pdb_name", limit: 384
    t.decimal "logmnr_mdh", null: false
  end

  create_table "logmnrc_gsba", primary_key: ["logmnr_uid", "as_of_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "as_of_scn", null: false
    t.decimal "fdo_length"
    t.raw "fdo_value", limit: 255
    t.decimal "charsetid"
    t.decimal "ncharsetid"
    t.decimal "dbtimezone_len"
    t.string "dbtimezone_value", limit: 192
    t.decimal "logmnr_spare1"
    t.decimal "logmnr_spare2"
    t.string "logmnr_spare3", limit: 1000
    t.date "logmnr_spare4"
    t.string "db_global_name", limit: 384
  end

  create_table "logmnrc_gsii", primary_key: ["logmnr_uid", "obj#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "obj#", null: false
    t.decimal "bo#", null: false
    t.decimal "indtype#", null: false
    t.decimal "drop_scn"
    t.decimal "logmnr_spare1"
    t.decimal "logmnr_spare2"
    t.string "logmnr_spare3", limit: 1000
    t.date "logmnr_spare4"
  end

  create_table "logmnrc_gtcs", primary_key: ["logmnr_uid", "obj#", "objv#", "intcol#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "obj#", null: false
    t.decimal "objv#", null: false
    t.decimal "segcol#", null: false
    t.decimal "intcol#", null: false
    t.string "colname", limit: 384, null: false
    t.decimal "type#", null: false
    t.decimal "length"
    t.decimal "precision"
    t.decimal "scale"
    t.decimal "interval_leading_precision"
    t.decimal "interval_trailing_precision"
    t.decimal "property"
    t.raw "toid", limit: 16
    t.decimal "charsetid"
    t.decimal "charsetform"
    t.string "typename", limit: 384
    t.string "fqcolname", limit: 4000
    t.decimal "numintcols"
    t.decimal "numattrs"
    t.decimal "adtorder"
    t.decimal "logmnr_spare1"
    t.decimal "logmnr_spare2"
    t.string "logmnr_spare3", limit: 1000
    t.date "logmnr_spare4"
    t.decimal "logmnr_spare5"
    t.decimal "logmnr_spare6"
    t.decimal "logmnr_spare7"
    t.decimal "logmnr_spare8"
    t.decimal "logmnr_spare9"
    t.decimal "col#"
    t.string "xtypeschemaname", limit: 384
    t.string "xtypename", limit: 4000
    t.string "xfqcolname", limit: 4000
    t.decimal "xtopintcol"
    t.decimal "xreffedtableobjn"
    t.decimal "xreffedtableobjv"
    t.decimal "xcoltypeflags"
    t.decimal "xopqtypetype"
    t.decimal "xopqtypeflags"
    t.decimal "xopqlobintcol"
    t.decimal "xopqobjintcol"
    t.decimal "xxmlintcol"
    t.decimal "eaowner#"
    t.string "eamkeyid", limit: 192
    t.decimal "eaencalg"
    t.decimal "eaintalg"
    t.raw "eacolklc"
    t.decimal "eaklclen"
    t.decimal "eaflags"
    t.decimal "logmnrderivedflags"
    t.decimal "collid"
    t.decimal "collintcol#"
    t.decimal "acdrrescol#"
    t.index ["logmnr_uid", "obj#", "objv#", "segcol#", "intcol#"], name: "logmnrc_i2gtcs"
  end

  create_table "logmnrc_gtlo", primary_key: ["logmnr_uid", "keyobj#", "baseobjv#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "keyobj#", null: false
    t.decimal "lvlcnt", null: false
    t.decimal "baseobj#", null: false
    t.decimal "baseobjv#", null: false
    t.decimal "lvl1obj#"
    t.decimal "lvl2obj#"
    t.decimal "lvl0type#", null: false
    t.decimal "lvl1type#"
    t.decimal "lvl2type#"
    t.decimal "owner#"
    t.string "ownername", limit: 384, null: false
    t.string "lvl0name", limit: 384, null: false
    t.string "lvl1name", limit: 384
    t.string "lvl2name", limit: 384
    t.decimal "intcols", null: false
    t.decimal "cols"
    t.decimal "kernelcols"
    t.decimal "tab_flags"
    t.decimal "trigflag"
    t.decimal "assoc#"
    t.decimal "obj_flags"
    t.decimal "ts#"
    t.string "tsname", limit: 90
    t.decimal "property"
    t.decimal "start_scn", null: false
    t.decimal "drop_scn"
    t.decimal "xidusn"
    t.decimal "xidslt"
    t.decimal "xidsqn"
    t.decimal "flags"
    t.decimal "logmnr_spare1"
    t.decimal "logmnr_spare2"
    t.string "logmnr_spare3", limit: 1000
    t.date "logmnr_spare4"
    t.decimal "logmnr_spare5"
    t.decimal "logmnr_spare6"
    t.decimal "logmnr_spare7"
    t.decimal "logmnr_spare8"
    t.decimal "logmnr_spare9"
    t.decimal "parttype"
    t.decimal "subparttype"
    t.decimal "unsupportedcols"
    t.decimal "complextypecols"
    t.decimal "ntparentobjnum"
    t.decimal "ntparentobjversion"
    t.decimal "ntparentintcolnum"
    t.decimal "logmnrtloflags"
    t.string "logmnrmcv", limit: 30
    t.decimal "acdrflags"
    t.decimal "acdrtsobj#"
    t.decimal "acdrrowtsintcol#"
    t.index ["logmnr_uid", "baseobj#", "baseobjv#"], name: "logmnrc_i2gtlo"
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrc_i3gtlo"
  end

  create_table "logmnrc_ind_gg", primary_key: ["logmnr_uid", "obj#", "commit_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "obj#", null: false
    t.string "name", limit: 384, null: false
    t.decimal "commit_scn", null: false
    t.decimal "drop_scn"
    t.decimal "baseobj#", null: false
    t.decimal "baseobjv#", null: false
    t.decimal "flags", null: false
    t.decimal "owner#", null: false
    t.string "ownername", limit: 384, null: false
    t.decimal "spare1"
    t.decimal "spare2"
    t.decimal "spare3"
    t.string "spare4", limit: 4000
    t.string "spare5", limit: 4000
    t.string "spare6", limit: 4000
    t.index ["logmnr_uid", "baseobj#", "baseobjv#", "commit_scn"], name: "logmnrc_i1indgg"
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrc_i2indgg"
  end

  create_table "logmnrc_indcol_gg", primary_key: ["logmnr_uid", "obj#", "commit_scn", "intcol#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "obj#", null: false
    t.decimal "commit_scn", null: false
    t.decimal "intcol#", null: false
    t.decimal "pos#", null: false
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
  end

  create_table "logmnrc_seq_gg", primary_key: ["logmnr_uid", "obj#", "commit_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "obj#", null: false
    t.decimal "commit_scn", null: false
    t.decimal "drop_scn"
    t.decimal "seq_flags", null: false
    t.decimal "owner#", null: false
    t.string "ownername", limit: 384, null: false
    t.string "objname", limit: 384, null: false
    t.decimal "seqcache"
    t.decimal "seqinc"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.string "spare4", limit: 4000
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrc_i2seqgg"
  end

  create_table "logmnrc_shard_ts", primary_key: ["logmnr_uid", "tablespace_name", "start_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.string "tablespace_name", limit: 90, null: false
    t.decimal "chunk_number", null: false
    t.decimal "start_scn", null: false
    t.decimal "drop_scn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrc_i1shard_ts"
  end

  create_table "logmnrc_ts", primary_key: ["logmnr_uid", "ts#", "start_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.integer "ts#", limit: 22, precision: 22, null: false
    t.string "name", limit: 90
    t.decimal "start_scn", null: false
    t.decimal "drop_scn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrc_i1ts"
  end

  create_table "logmnrc_tspart", primary_key: ["logmnr_uid", "obj#", "start_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "obj#", null: false
    t.decimal "ts#", null: false
    t.decimal "start_scn", null: false
    t.decimal "drop_scn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 4000
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrc_i1tspart"
  end

  create_table "logmnrc_user", primary_key: ["logmnr_uid", "user#", "start_scn"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.integer "user#", limit: 22, precision: 22, null: false
    t.decimal "spare1"
    t.string "name", limit: 384, null: false
    t.decimal "start_scn", null: false
    t.decimal "drop_scn"
    t.decimal "spare1_c"
    t.decimal "spare2_c"
    t.string "spare3_c", limit: 4000
    t.index ["logmnr_uid", "name", "start_scn"], name: "logmnrc_i1user"
  end

  create_table "logmnrggc_gtcs", primary_key: ["logmnr_uid", "obj#", "objv#", "intcol#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "obj#", null: false
    t.decimal "objv#", null: false
    t.decimal "segcol#", null: false
    t.decimal "intcol#", null: false
    t.string "colname", limit: 384, null: false
    t.decimal "type#", null: false
    t.decimal "length"
    t.decimal "precision"
    t.decimal "scale"
    t.decimal "interval_leading_precision"
    t.decimal "interval_trailing_precision"
    t.decimal "property"
    t.raw "toid", limit: 16
    t.decimal "charsetid"
    t.decimal "charsetform"
    t.string "typename", limit: 384
    t.string "fqcolname", limit: 4000
    t.decimal "numintcols"
    t.decimal "numattrs"
    t.decimal "adtorder"
    t.decimal "logmnr_spare1"
    t.decimal "logmnr_spare2"
    t.string "logmnr_spare3", limit: 1000
    t.date "logmnr_spare4"
    t.decimal "logmnr_spare5"
    t.decimal "logmnr_spare6"
    t.decimal "logmnr_spare7"
    t.decimal "logmnr_spare8"
    t.decimal "logmnr_spare9"
    t.decimal "col#"
    t.string "xtypeschemaname", limit: 384
    t.string "xtypename", limit: 4000
    t.string "xfqcolname", limit: 4000
    t.decimal "xtopintcol"
    t.decimal "xreffedtableobjn"
    t.decimal "xreffedtableobjv"
    t.decimal "xcoltypeflags"
    t.decimal "xopqtypetype"
    t.decimal "xopqtypeflags"
    t.decimal "xopqlobintcol"
    t.decimal "xopqobjintcol"
    t.decimal "xxmlintcol"
    t.decimal "eaowner#"
    t.string "eamkeyid", limit: 192
    t.decimal "eaencalg"
    t.decimal "eaintalg"
    t.raw "eacolklc"
    t.decimal "eaklclen"
    t.decimal "eaflags"
    t.decimal "logmnrderivedflags"
    t.decimal "collid"
    t.decimal "collintcol#"
    t.decimal "acdrrescol#"
    t.index ["logmnr_uid", "obj#", "objv#", "segcol#", "intcol#"], name: "logmnrggc_i2gtcs"
  end

  create_table "logmnrggc_gtlo", primary_key: ["logmnr_uid", "keyobj#", "baseobjv#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "keyobj#", null: false
    t.decimal "lvlcnt", null: false
    t.decimal "baseobj#", null: false
    t.decimal "baseobjv#", null: false
    t.decimal "lvl1obj#"
    t.decimal "lvl2obj#"
    t.decimal "lvl0type#", null: false
    t.decimal "lvl1type#"
    t.decimal "lvl2type#"
    t.decimal "owner#"
    t.string "ownername", limit: 384, null: false
    t.string "lvl0name", limit: 384, null: false
    t.string "lvl1name", limit: 384
    t.string "lvl2name", limit: 384
    t.decimal "intcols", null: false
    t.decimal "cols"
    t.decimal "kernelcols"
    t.decimal "tab_flags"
    t.decimal "trigflag"
    t.decimal "assoc#"
    t.decimal "obj_flags"
    t.decimal "ts#"
    t.string "tsname", limit: 90
    t.decimal "property"
    t.decimal "start_scn", null: false
    t.decimal "drop_scn"
    t.decimal "xidusn"
    t.decimal "xidslt"
    t.decimal "xidsqn"
    t.decimal "flags"
    t.decimal "logmnr_spare1"
    t.decimal "logmnr_spare2"
    t.string "logmnr_spare3", limit: 1000
    t.date "logmnr_spare4"
    t.decimal "logmnr_spare5"
    t.decimal "logmnr_spare6"
    t.decimal "logmnr_spare7"
    t.decimal "logmnr_spare8"
    t.decimal "logmnr_spare9"
    t.decimal "parttype"
    t.decimal "subparttype"
    t.decimal "unsupportedcols"
    t.decimal "complextypecols"
    t.decimal "ntparentobjnum"
    t.decimal "ntparentobjversion"
    t.decimal "ntparentintcolnum"
    t.decimal "logmnrtloflags"
    t.string "logmnrmcv", limit: 30
    t.decimal "acdrflags"
    t.decimal "acdrtsobj#"
    t.decimal "acdrrowtsintcol#"
    t.index ["logmnr_uid", "baseobj#", "baseobjv#"], name: "logmnrggc_i2gtlo"
    t.index ["logmnr_uid", "drop_scn"], name: "logmnrggc_i3gtlo"
  end

  create_table "logmnrp_ctas_part_map", primary_key: ["logmnr_uid", "baseobjv#", "keyobj#"], force: :cascade do |t|
    t.decimal "logmnr_uid", null: false
    t.decimal "baseobj#", null: false
    t.decimal "baseobjv#", null: false
    t.decimal "keyobj#", null: false
    t.decimal "part#", null: false
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 1000
    t.index ["logmnr_uid", "baseobj#", "baseobjv#", "part#"], name: "logmnrp_ctas_part_map_i"
  end

# Could not dump table "logmnrt_mddl$" because of following StandardError
#   Unknown type 'ROWID' for column 'source_rowid'

  create_table "logstdby$apply_milestone", id: false, force: :cascade do |t|
    t.decimal "session_id", null: false
    t.decimal "commit_scn", null: false
    t.date "commit_time"
    t.decimal "synch_scn", null: false
    t.decimal "epoch", null: false
    t.decimal "processed_scn", null: false
    t.date "processed_time"
    t.decimal "fetchlwm_scn", default: "0.0", null: false
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
    t.decimal "flags"
    t.date "lwm_upd_time"
    t.decimal "spare4"
    t.decimal "spare5"
    t.decimal "spare6"
    t.date "spare7"
    t.decimal "pto_recovery_scn"
    t.decimal "pto_recovery_incarnation"
  end

  create_table "logstdby$apply_progress", id: false, force: :cascade do |t|
    t.decimal "xidusn"
    t.decimal "xidslt"
    t.decimal "xidsqn"
    t.decimal "commit_scn"
    t.date "commit_time"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
  end

  create_table "logstdby$eds_tables", primary_key: ["owner", "table_name"], force: :cascade do |t|
    t.string "owner", limit: 128, null: false
    t.string "table_name", limit: 128, null: false
    t.string "shadow_table_name", limit: 128
    t.string "base_trigger_name", limit: 128
    t.string "shadow_trigger_name", limit: 128
    t.string "dblink"
    t.decimal "flags"
    t.string "state"
    t.decimal "objv"
    t.decimal "obj#"
    t.decimal "sobj#"
    t.datetime "ctime"
    t.decimal "spare1"
    t.string "spare2"
    t.decimal "spare3"
    t.string "mview_name", limit: 128
    t.string "mview_log_name", limit: 128
    t.string "mview_trigger_name", limit: 128
  end

  create_table "logstdby$events", id: false, force: :cascade do |t|
    t.datetime "event_time", null: false
    t.decimal "current_scn"
    t.decimal "commit_scn"
    t.decimal "xidusn"
    t.decimal "xidslt"
    t.decimal "xidsqn"
    t.decimal "errval"
    t.string "event", limit: 2000
    t.text "full_event"
    t.string "error", limit: 2000
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
    t.string "con_name", limit: 30
    t.decimal "con_id"
    t.index ["commit_scn"], name: "logstdby$events_ind_scn", tablespace: "sysaux"
    t.index ["event_time"], name: "logstdby$events_ind", tablespace: "sysaux"
    t.index ["xidusn", "xidslt", "xidsqn"], name: "logstdby$events_ind_xid", tablespace: "sysaux"
  end

  create_table "logstdby$flashback_scn", primary_key: "primary_scn", id: :decimal, force: :cascade do |t|
    t.date "primary_time"
    t.decimal "standby_scn"
    t.date "standby_time"
    t.decimal "spare1"
    t.decimal "spare2"
    t.date "spare3"
  end

  create_table "logstdby$history", id: false, force: :cascade do |t|
    t.decimal "stream_sequence#"
    t.decimal "lmnr_sid"
    t.decimal "dbid"
    t.decimal "first_change#"
    t.decimal "last_change#"
    t.decimal "source"
    t.decimal "status"
    t.date "first_time"
    t.date "last_time"
    t.string "dgname"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
  end

  create_table "logstdby$parameters", id: false, force: :cascade do |t|
    t.string "name", limit: 30
    t.string "value", limit: 2000
    t.decimal "type"
    t.decimal "scn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
  end

  create_table "logstdby$plsql", id: false, force: :cascade do |t|
    t.decimal "session_id"
    t.decimal "start_finish"
    t.text "call_text"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
  end

  create_table "logstdby$scn", id: false, force: :cascade do |t|
    t.decimal "obj#"
    t.string "objname", limit: 4000
    t.string "schema", limit: 128
    t.string "type", limit: 20
    t.decimal "scn"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
  end

  create_table "logstdby$skip", id: false, force: :cascade do |t|
    t.decimal "error"
    t.string "statement_opt", limit: 128
    t.string "schema", limit: 128
    t.string "name", limit: 261
    t.decimal "use_like"
    t.string "esc", limit: 1
    t.string "proc", limit: 392
    t.decimal "active"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
    t.index ["statement_opt"], name: "logstdby$skip_idx2", tablespace: "sysaux"
    t.index ["use_like", "schema", "name"], name: "logstdby$skip_idx1", tablespace: "sysaux"
  end

  create_table "logstdby$skip_support", id: false, force: :cascade do |t|
    t.decimal "action", null: false
    t.string "name", limit: 128, null: false
    t.string "name2", limit: 128
    t.string "name3", limit: 128
    t.string "name4", limit: 128
    t.string "name5", limit: 128
    t.integer "reg", precision: 38
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
    t.index ["name", "action"], name: "logstdby$skip_ind", tablespace: "sysaux"
  end

  create_table "logstdby$skip_transaction", id: false, force: :cascade do |t|
    t.decimal "xidusn"
    t.decimal "xidslt"
    t.decimal "xidsqn"
    t.decimal "active"
    t.decimal "commit_scn"
    t.decimal "spare2"
    t.string "spare3", limit: 2000
    t.string "con_name", limit: 384
  end

  create_table "mitszallits", primary_key: ["szallito_id", "mit"], force: :cascade do |t|
    t.integer "szallito_id", precision: 38
    t.string "mit"
    t.float "mennyiseg"
    t.float "ar_kg"
    t.integer "min_vasarlas", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mview$_adv_ajg", primary_key: "ajgid#", id: :decimal, comment: "Anchor-join graph representation", force: :cascade do |t|
    t.decimal "runid#", null: false
    t.decimal "ajgdeslen", null: false
    t.raw "ajgdes", null: false
    t.decimal "hashvalue", null: false
    t.decimal "frequency"
  end

  create_table "mview$_adv_basetable", id: false, comment: "Base tables refered by a query", force: :cascade do |t|
    t.decimal "collectionid#", null: false
    t.decimal "queryid#", null: false
    t.string "owner", limit: 128
    t.string "table_name", limit: 128
    t.decimal "table_type"
    t.index ["queryid#"], name: "mview$_adv_basetable_idx_01"
  end

  create_table "mview$_adv_clique", primary_key: "cliqueid#", id: :decimal, comment: "Table for storing canonical form of Clique queries", force: :cascade do |t|
    t.decimal "runid#", null: false
    t.decimal "cliquedeslen", null: false
    t.raw "cliquedes", null: false
    t.decimal "hashvalue", null: false
    t.decimal "frequency", null: false
    t.decimal "bytecost", null: false
    t.decimal "rowsize", null: false
    t.decimal "numrows", null: false
  end

  create_table "mview$_adv_eligible", primary_key: ["sumobjn#", "runid#"], comment: "Summary management rewrite eligibility information", force: :cascade do |t|
    t.decimal "sumobjn#", null: false
    t.decimal "runid#", null: false
    t.decimal "bytecost", null: false
    t.decimal "flags", null: false
    t.decimal "frequency", null: false
  end

# Could not dump table "mview$_adv_exceptions" because of following StandardError
#   Unknown type 'ROWID' for column 'bad_rowid'

  create_table "mview$_adv_filter", primary_key: ["filterid#", "subfilternum#"], comment: "Table for workload filter definition", force: :cascade do |t|
    t.decimal "filterid#", null: false
    t.decimal "subfilternum#", null: false
    t.decimal "subfiltertype", null: false
    t.string "str_value", limit: 1028
    t.decimal "num_value1"
    t.decimal "num_value2"
    t.date "date_value1"
    t.date "date_value2"
  end

  create_table "mview$_adv_filterinstance", id: false, comment: "Table for workload filter instance definition", force: :cascade do |t|
    t.decimal "runid#", null: false
    t.decimal "filterid#"
    t.decimal "subfilternum#"
    t.decimal "subfiltertype"
    t.string "str_value", limit: 1028
    t.decimal "num_value1"
    t.decimal "num_value2"
    t.date "date_value1"
    t.date "date_value2"
  end

  create_table "mview$_adv_fjg", primary_key: "fjgid#", id: :decimal, comment: "Representation for query join sub-graph not in AJG ", force: :cascade do |t|
    t.decimal "ajgid#", null: false
    t.decimal "fjgdeslen", null: false
    t.raw "fjgdes", null: false
    t.decimal "hashvalue", null: false
    t.decimal "frequency"
  end

  create_table "mview$_adv_gc", primary_key: "gcid#", id: :decimal, comment: "Group-by columns of a query", force: :cascade do |t|
    t.decimal "fjgid#", null: false
    t.decimal "gcdeslen", null: false
    t.raw "gcdes", null: false
    t.decimal "hashvalue", null: false
    t.decimal "frequency"
  end

  create_table "mview$_adv_info", primary_key: ["runid#", "seq#"], comment: "Internal table for passing information from the SQL analyzer", force: :cascade do |t|
    t.decimal "runid#", null: false
    t.decimal "seq#", null: false
    t.decimal "type", null: false
    t.decimal "infolen", null: false
    t.raw "info"
    t.decimal "status"
    t.decimal "flag"
  end

# Could not dump table "mview$_adv_journal" because of following StandardError
#   Unknown type 'LONG' for column 'text'

  create_table "mview$_adv_level", primary_key: ["runid#", "levelid#"], comment: "Level definition", force: :cascade do |t|
    t.decimal "runid#", null: false
    t.decimal "levelid#", null: false
    t.decimal "dimobj#"
    t.decimal "flags", null: false
    t.decimal "tblobj#", null: false
    t.raw "columnlist", limit: 70, null: false
    t.string "levelname", limit: 128
  end

  create_table "mview$_adv_log", primary_key: "runid#", id: :decimal, comment: "Log all calls to summary advisory functions", force: :cascade do |t|
    t.decimal "filterid#"
    t.date "run_begin"
    t.date "run_end"
    t.decimal "run_type"
    t.string "uname", limit: 128
    t.decimal "status", null: false
    t.string "message", limit: 2000
    t.decimal "completed"
    t.decimal "total"
    t.string "error_code", limit: 20
  end

# Could not dump table "mview$_adv_output" because of following StandardError
#   Unknown type 'LONG' for column 'query_text'

  create_table "mview$_adv_parameters", primary_key: "parameter_name", id: { type: :string, limit: 128 }, comment: "Summary advisor tuning parameters", force: :cascade do |t|
    t.decimal "parameter_type", null: false
    t.string "string_value", limit: 30
    t.date "date_value"
    t.decimal "numerical_value"
  end

# Could not dump table "mview$_adv_plan" because of following StandardError
#   Unknown type 'LONG' for column 'other'

# Could not dump table "mview$_adv_pretty" because of following StandardError
#   Unknown type 'LONG' for column 'sql_text'

  create_table "mview$_adv_rollup", primary_key: ["runid#", "clevelid#", "plevelid#"], comment: "Each row repesents either a functional dependency or join-key relationship", force: :cascade do |t|
    t.decimal "runid#", null: false
    t.decimal "clevelid#", null: false
    t.decimal "plevelid#", null: false
    t.decimal "flags", null: false
  end

  create_table "mview$_adv_sqldepend", id: false, comment: "Temporary table for workload collections", force: :cascade do |t|
    t.decimal "collectionid#"
    t.decimal "inst_id"
    t.raw "from_address", limit: 16
    t.decimal "from_hash"
    t.string "to_owner", limit: 128
    t.string "to_name", limit: 1000
    t.decimal "to_type"
    t.decimal "cardinality"
    t.index ["collectionid#", "from_address", "from_hash", "inst_id"], name: "mview$_adv_sqldepend_idx_01"
  end

# Could not dump table "mview$_adv_temp" because of following StandardError
#   Unknown type 'LONG' for column 'text'

# Could not dump table "mview$_adv_workload" because of following StandardError
#   Unknown type 'LONG' for column 'sql_text'

# Could not dump table "ol$" because of following StandardError
#   Unknown type 'LONG' for column 'sql_text'

  create_table "ol$hints", temporary: true, id: false, force: :cascade do |t|
    t.string "ol_name", limit: 128
    t.decimal "hint#"
    t.string "category", limit: 128
    t.decimal "hint_type"
    t.string "hint_text", limit: 512
    t.decimal "stage#"
    t.decimal "node#"
    t.string "table_name", limit: 128
    t.decimal "table_tin"
    t.decimal "table_pos"
    t.decimal "ref_id"
    t.string "user_table_name", limit: 260
    t.float "cost", limit: 126
    t.float "cardinality", limit: 126
    t.float "bytes", limit: 126
    t.decimal "hint_textoff"
    t.decimal "hint_textlen"
    t.string "join_pred", limit: 2000
    t.decimal "spare1"
    t.decimal "spare2"
    t.text "hint_string"
    t.index ["ol_name", "hint#"], name: "ol$hnt_num", unique: true
  end

  create_table "ol$nodes", temporary: true, id: false, force: :cascade do |t|
    t.string "ol_name", limit: 128
    t.string "category", limit: 128
    t.decimal "node_id"
    t.decimal "parent_id"
    t.decimal "node_type"
    t.decimal "node_textlen"
    t.decimal "node_textoff"
    t.string "node_name", limit: 64
  end

  create_table "redo_db", id: false, force: :cascade do |t|
    t.decimal "dbid", null: false
    t.string "global_dbname", limit: 129
    t.string "dbuname", limit: 32
    t.string "version", limit: 32
    t.decimal "thread#", null: false
    t.decimal "resetlogs_scn_bas"
    t.decimal "resetlogs_scn_wrp"
    t.decimal "resetlogs_time", null: false
    t.decimal "presetlogs_scn_bas"
    t.decimal "presetlogs_scn_wrp"
    t.decimal "presetlogs_time", null: false
    t.decimal "seqno_rcv_cur"
    t.decimal "seqno_rcv_lo"
    t.decimal "seqno_rcv_hi"
    t.decimal "seqno_done_cur"
    t.decimal "seqno_done_lo"
    t.decimal "seqno_done_hi"
    t.decimal "gap_seqno"
    t.decimal "gap_ret"
    t.decimal "gap_done"
    t.decimal "apply_seqno"
    t.decimal "apply_done"
    t.decimal "purge_done"
    t.decimal "has_child"
    t.decimal "error1"
    t.decimal "status"
    t.date "create_date"
    t.decimal "ts1"
    t.decimal "ts2"
    t.decimal "gap_next_scn"
    t.decimal "gap_next_time"
    t.decimal "curscn_time"
    t.decimal "resetlogs_scn", null: false
    t.decimal "presetlogs_scn", null: false
    t.decimal "gap_ret2"
    t.decimal "curlog"
    t.decimal "endian"
    t.decimal "enqidx"
    t.decimal "spare4"
    t.date "spare5"
    t.string "spare6", limit: 65
    t.string "spare7", limit: 129
    t.decimal "ts3"
    t.decimal "curblkno"
    t.decimal "spare8"
    t.decimal "spare9"
    t.decimal "spare10"
    t.decimal "spare11"
    t.decimal "spare12"
    t.decimal "tenant_key", null: false
    t.index ["tenant_key", "dbid", "thread#", "resetlogs_scn", "resetlogs_time"], name: "redo_db_idx", tablespace: "sysaux"
  end

  create_table "redo_log", id: false, force: :cascade do |t|
    t.decimal "dbid", null: false
    t.string "global_dbname", limit: 129
    t.string "dbuname", limit: 32
    t.string "version", limit: 32
    t.decimal "thread#", null: false
    t.decimal "resetlogs_scn_bas"
    t.decimal "resetlogs_scn_wrp"
    t.decimal "resetlogs_time", null: false
    t.decimal "presetlogs_scn_bas"
    t.decimal "presetlogs_scn_wrp"
    t.decimal "presetlogs_time", null: false
    t.decimal "sequence#", null: false
    t.decimal "dupid"
    t.decimal "status1"
    t.decimal "status2"
    t.string "create_time", limit: 32
    t.string "close_time", limit: 32
    t.string "done_time", limit: 32
    t.decimal "first_scn_bas"
    t.decimal "first_scn_wrp"
    t.decimal "first_time"
    t.decimal "next_scn_bas"
    t.decimal "next_scn_wrp"
    t.decimal "next_time"
    t.decimal "first_scn"
    t.decimal "next_scn"
    t.decimal "resetlogs_scn", null: false
    t.decimal "blocks"
    t.decimal "block_size"
    t.decimal "old_blocks"
    t.date "create_date"
    t.decimal "error1"
    t.decimal "error2"
    t.string "filename", limit: 513
    t.decimal "ts1"
    t.decimal "ts2"
    t.decimal "endian"
    t.decimal "spare2"
    t.decimal "spare3"
    t.decimal "spare4"
    t.date "spare5"
    t.string "spare6", limit: 65
    t.string "spare7", limit: 129
    t.decimal "ts3"
    t.decimal "presetlogs_scn", null: false
    t.decimal "spare8"
    t.decimal "spare9"
    t.decimal "spare10"
    t.decimal "old_status1"
    t.decimal "old_status2"
    t.string "old_filename", limit: 513
    t.decimal "tenant_key", null: false
    t.index ["tenant_key", "dbid", "thread#", "resetlogs_scn", "resetlogs_time"], name: "redo_log_idx", tablespace: "sysaux"
  end

  create_table "rendels", force: :cascade do |t|
    t.integer "felhaszn_id", precision: 38
    t.integer "hirdetes_id", precision: 38
    t.integer "szallito_id", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repl_support_matrix", primary_key: ["bmap1", "bmap2", "repl_product", "support_mode"], force: :cascade do |t|
    t.string "feature_name", limit: 100
    t.decimal "reason_code"
    t.decimal "bmap1", null: false
    t.decimal "bmap2", null: false
    t.decimal "repl_product", null: false
    t.decimal "support_mode", null: false
    t.decimal "min_compat"
    t.decimal "max_compat"
  end

  create_table "repl_valid_compat", id: false, force: :cascade do |t|
    t.decimal "compat"
  end

  create_table "rolling$connections", id: false, force: :cascade do |t|
    t.decimal "source_rdbid"
    t.decimal "dest_rdbid"
    t.decimal "attributes"
    t.string "service_name", limit: 256
    t.decimal "conn_handle"
    t.datetime "connect_time"
    t.datetime "send_time"
    t.datetime "disconnect_time"
    t.datetime "update_time"
    t.decimal "source_pid"
    t.decimal "dest_pid"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 128
  end

  create_table "rolling$databases", id: false, force: :cascade do |t|
    t.decimal "rdbid"
    t.decimal "attributes"
    t.decimal "attributes2"
    t.string "dbun", limit: 128
    t.decimal "dbid"
    t.decimal "prod_rscn"
    t.decimal "prod_rid"
    t.decimal "prod_scn"
    t.decimal "cons_rscn"
    t.decimal "cons_rid"
    t.decimal "cons_scn"
    t.decimal "engine_status"
    t.string "version", limit: 128
    t.decimal "redo_source"
    t.datetime "update_time"
    t.decimal "revision"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 128
  end

  create_table "rolling$directives", id: false, force: :cascade do |t|
    t.decimal "directid"
    t.decimal "phase"
    t.decimal "taskid"
    t.string "feature", limit: 32
    t.string "description", limit: 256
    t.decimal "target"
    t.string "flags", limit: 64
    t.decimal "opcode"
    t.string "p1", limit: 256
    t.string "p2", limit: 256
    t.string "p3", limit: 256
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 256
  end

  create_table "rolling$events", id: false, force: :cascade do |t|
    t.decimal "eventid"
    t.decimal "instid"
    t.decimal "revision"
    t.datetime "event_time"
    t.string "type", limit: 16
    t.decimal "status"
    t.string "message", limit: 256
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 128
  end

  create_table "rolling$parameters", id: false, force: :cascade do |t|
    t.decimal "scope"
    t.string "name", limit: 32
    t.decimal "id"
    t.string "descrip", limit: 256
    t.decimal "type"
    t.decimal "datatype"
    t.decimal "attributes"
    t.string "curval", limit: 1024
    t.string "lstval", limit: 1024
    t.string "defval", limit: 1024
    t.decimal "minval"
    t.decimal "maxval"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 128
  end

  create_table "rolling$plan", id: false, force: :cascade do |t|
    t.decimal "instid"
    t.decimal "batchid"
    t.decimal "directid"
    t.decimal "taskid"
    t.decimal "revision"
    t.decimal "phase"
    t.decimal "status"
    t.decimal "progress"
    t.decimal "source"
    t.decimal "target"
    t.decimal "rflags"
    t.decimal "opcode"
    t.string "p1", limit: 256
    t.string "p2", limit: 256
    t.string "p3", limit: 256
    t.string "p4", limit: 256
    t.string "description", limit: 256
    t.decimal "exec_status"
    t.string "exec_info", limit: 256
    t.datetime "exec_time"
    t.datetime "finish_time"
    t.decimal "post_status"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 256
  end

  create_table "rolling$statistics", id: false, force: :cascade do |t|
    t.decimal "statid"
    t.decimal "rdbid"
    t.decimal "attributes"
    t.decimal "type"
    t.string "name", limit: 256
    t.string "valuestr", limit: 256
    t.decimal "valuenum"
    t.datetime "valuets"
    t.integer "valueint", limit: 3
    t.datetime "update_time"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 128
  end

  create_table "rolling$status", id: false, force: :cascade do |t|
    t.decimal "revision"
    t.decimal "phase"
    t.decimal "batchid"
    t.decimal "status"
    t.decimal "coordid"
    t.decimal "oprimary"
    t.decimal "fprimary"
    t.decimal "pid"
    t.decimal "instance"
    t.decimal "dbtotal"
    t.decimal "dbactive"
    t.string "location", limit: 128
    t.datetime "init_time"
    t.datetime "build_time"
    t.datetime "start_time"
    t.datetime "switch_time"
    t.datetime "finish_time"
    t.decimal "last_instid"
    t.decimal "last_batchid"
    t.decimal "spare1"
    t.decimal "spare2"
    t.string "spare3", limit: 128
  end

# Could not dump table "scheduler_job_args_tbl" because of following StandardError
#   Unknown type 'SYS.ANYDATA' for column 'anydata_value'

# Could not dump table "scheduler_program_args_tbl" because of following StandardError
#   Unknown type 'SYS.ANYDATA' for column 'default_anydata_value'

# Could not dump table "sqlplus_product_profile" because of following StandardError
#   Unknown type 'LONG' for column 'long_value'

  create_table "szallitos", force: :cascade do |t|
    t.float "km_ar"
    t.float "ar_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "aq$_internet_agent_privs", "aq$_internet_agents", column: "agent_name", primary_key: "agent_name", name: "agent_must_be_created", on_delete: :cascade
  add_foreign_key "mview$_adv_ajg", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_ajg_fk"
  add_foreign_key "mview$_adv_basetable", "mview$_adv_workload", column: "queryid#", primary_key: "queryid#", name: "mview$_adv_basetable_fk"
  add_foreign_key "mview$_adv_clique", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_clique_fk"
  add_foreign_key "mview$_adv_eligible", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_eligible_fk"
  add_foreign_key "mview$_adv_exceptions", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_exception_fk"
  add_foreign_key "mview$_adv_filterinstance", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_filterinstance_fk"
  add_foreign_key "mview$_adv_fjg", "mview$_adv_ajg", column: "ajgid#", primary_key: "ajgid#", name: "mview$_adv_fjg_fk"
  add_foreign_key "mview$_adv_gc", "mview$_adv_fjg", column: "fjgid#", primary_key: "fjgid#", name: "mview$_adv_gc_fk"
  add_foreign_key "mview$_adv_info", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_info_fk"
  add_foreign_key "mview$_adv_journal", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_journal_fk"
  add_foreign_key "mview$_adv_level", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_level_fk"
  add_foreign_key "mview$_adv_output", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_output_fk"
  add_foreign_key "mview$_adv_rollup", "mview$_adv_level", column: "clevelid#", primary_key: "levelid#", name: "mview$_adv_rollup_cfk"
  add_foreign_key "mview$_adv_rollup", "mview$_adv_level", column: "plevelid#", primary_key: "levelid#", name: "mview$_adv_rollup_pfk"
  add_foreign_key "mview$_adv_rollup", "mview$_adv_level", column: "runid#", primary_key: "runid#", name: "mview$_adv_rollup_cfk"
  add_foreign_key "mview$_adv_rollup", "mview$_adv_level", column: "runid#", primary_key: "runid#", name: "mview$_adv_rollup_pfk"
  add_foreign_key "mview$_adv_rollup", "mview$_adv_log", column: "runid#", primary_key: "runid#", name: "mview$_adv_rollup_fk"
  add_synonym "syscatalog", "sys.syscatalog", force: true
  add_synonym "catalog", "sys.catalog", force: true
  add_synonym "tab", "sys.tab", force: true
  add_synonym "col", "sys.col", force: true
  add_synonym "tabquotas", "sys.tabquotas", force: true
  add_synonym "sysfiles", "sys.sysfiles", force: true
  add_synonym "publicsyn", "sys.publicsyn", force: true
  add_synonym "product_user_profile", "system.sqlplus_product_profile", force: true

end
