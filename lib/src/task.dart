// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    String name;
    String mainUrl;
    String dbname;
    String encode;
    int parallelism;
    bool storeEachFile;
    List<TableElement> tables;
    List<Job> job;

    Task({
        this.name,
        this.mainUrl,
        this.dbname,
        this.encode,
        this.parallelism,
        this.storeEachFile,
        this.tables,
        this.job,
    });

    factory Task.fromJson(Map<String, dynamic> json) => new Task(
        name: json["name"] == null ? null : json["name"],
        mainUrl: json["mainURL"] == null ? null : json["mainURL"],
        dbname: json["dbname"] == null ? null : json["dbname"],
        encode: json["encode"] == null ? null : json["encode"],
        parallelism: json["parallelism"] == null ? null : json["parallelism"],
        storeEachFile: json["storeEachFile"] == null ? null : json["storeEachFile"],
        tables: json["tables"] == null ? null : new List<TableElement>.from(json["tables"].map((x) => TableElement.fromJson(x))),
        job: json["job"] == null ? null : new List<Job>.from(json["job"].map((x) => Job.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "mainURL": mainUrl == null ? null : mainUrl,
        "dbname": dbname == null ? null : dbname,
        "encode": encode == null ? null : encode,
        "parallelism": parallelism == null ? null : parallelism,
        "storeEachFile": storeEachFile == null ? null : storeEachFile,
        "tables": tables == null ? null : new List<dynamic>.from(tables.map((x) => x.toJson())),
        "job": job == null ? null : new List<dynamic>.from(job.map((x) => x.toJson())),
    };
}

class Job {
    String ifSite;
    List<Selection> selection;
    List<String> notSite;
    List<JsConf> jsConf;

    Job({
        this.ifSite,
        this.selection,
        this.notSite,
        this.jsConf,
    });

    factory Job.fromJson(Map<String, dynamic> json) => new Job(
        ifSite: json["ifSite"] == null ? null : json["ifSite"],
        selection: json["selection"] == null ? null : new List<Selection>.from(json["selection"].map((x) => Selection.fromJson(x))),
        notSite: json["NotSite"] == null ? null : new List<String>.from(json["NotSite"].map((x) => x)),
        jsConf: json["jsConf"] == null ? null : new List<JsConf>.from(json["jsConf"].map((x) => JsConf.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ifSite": ifSite == null ? null : ifSite,
        "selection": selection == null ? null : new List<dynamic>.from(selection.map((x) => x.toJson())),
        "NotSite": notSite == null ? null : new List<dynamic>.from(notSite.map((x) => x)),
        "jsConf": jsConf == null ? null : new List<dynamic>.from(jsConf.map((x) => x.toJson())),
    };
}

class JsConf {
    String waitVisibleId;

    JsConf({
        this.waitVisibleId,
    });

    factory JsConf.fromJson(Map<String, dynamic> json) => new JsConf(
        waitVisibleId: json["WaitVisibleID"] == null ? null : json["WaitVisibleID"],
    );

    Map<String, dynamic> toJson() => {
        "WaitVisibleID": waitVisibleId == null ? null : waitVisibleId,
    };
}

class Selection {
    String query;
    List<Value> values;

    Selection({
        this.query,
        this.values,
    });

    factory Selection.fromJson(Map<String, dynamic> json) => new Selection(
        query: json["query"] == null ? null : json["query"],
        values: json["values"] == null ? null : new List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "query": query == null ? null : query,
        "values": values == null ? null : new List<dynamic>.from(values.map((x) => x.toJson())),
    };
}

class Value {
    Select select;
    bool visit;
    Store store;
    Strset strset;
    bool generateHash;
    PushDb pushDb;
    String childQuery;

    Value({
        this.select,
        this.visit,
        this.store,
        this.strset,
        this.generateHash,
        this.pushDb,
        this.childQuery,
    });

    factory Value.fromJson(Map<String, dynamic> json) => new Value(
        select: json["select"] == null ? null : selectValues.map[json["select"]],
        visit: json["visit"] == null ? null : json["visit"],
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
        strset: json["strset"] == null ? null : Strset.fromJson(json["strset"]),
        generateHash: json["generateHash"] == null ? null : json["generateHash"],
        pushDb: json["pushDB"] == null ? null : PushDb.fromJson(json["pushDB"]),
        childQuery: json["childQuery"] == null ? null : json["childQuery"],
    );

    Map<String, dynamic> toJson() => {
        "select": select == null ? null : selectValues.reverse[select],
        "visit": visit == null ? null : visit,
        "store": store == null ? null : store.toJson(),
        "strset": strset == null ? null : strset.toJson(),
        "generateHash": generateHash == null ? null : generateHash,
        "pushDB": pushDb == null ? null : pushDb.toJson(),
        "childQuery": childQuery == null ? null : childQuery,
    };
}

class PushDb {
    TableEnum table;
    Type type;
    String where;

    PushDb({
        this.table,
        this.type,
        this.where,
    });

    factory PushDb.fromJson(Map<String, dynamic> json) => new PushDb(
        table: json["table"] == null ? null : tableEnumValues.map[json["table"]],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        where: json["where"] == null ? null : json["where"],
    );

    Map<String, dynamic> toJson() => {
        "table": table == null ? null : tableEnumValues.reverse[table],
        "type": type == null ? null : typeValues.reverse[type],
        "where": where == null ? null : where,
    };
}

enum TableEnum { SONG_ARTIST, ARTIST }

final tableEnumValues = new EnumValues({
    "artist": TableEnum.ARTIST,
    "song_artist": TableEnum.SONG_ARTIST
});

enum Type { INSERT }

final typeValues = new EnumValues({
    "insert": Type.INSERT
});

enum Select { HREF, TEXT }

final selectValues = new EnumValues({
    "href": Select.HREF,
    "text": Select.TEXT
});

class Store {
    TableEnum table;
    String row;
    Type type;

    Store({
        this.table,
        this.row,
        this.type,
    });

    factory Store.fromJson(Map<String, dynamic> json) => new Store(
        table: json["table"] == null ? null : tableEnumValues.map[json["table"]],
        row: json["row"] == null ? null : json["row"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "table": table == null ? null : tableEnumValues.reverse[table],
        "row": row == null ? null : row,
        "type": type == null ? null : typeValues.reverse[type],
    };
}

class Strset {
    String regx;
    String action;
    String options;

    Strset({
        this.regx,
        this.action,
        this.options,
    });

    factory Strset.fromJson(Map<String, dynamic> json) => new Strset(
        regx: json["regx"] == null ? null : json["regx"],
        action: json["action"] == null ? null : json["action"],
        options: json["options"] == null ? null : json["options"],
    );

    Map<String, dynamic> toJson() => {
        "regx": regx == null ? null : regx,
        "action": action == null ? null : action,
        "options": options == null ? null : options,
    };
}

class TableElement {
    String tname;
    List<Attrib> attribs;
    List<String> constraint;

    TableElement({
        this.tname,
        this.attribs,
        this.constraint,
    });

    factory TableElement.fromJson(Map<String, dynamic> json) => new TableElement(
        tname: json["tname"] == null ? null : json["tname"],
        attribs: json["attribs"] == null ? null : new List<Attrib>.from(json["attribs"].map((x) => Attrib.fromJson(x))),
        constraint: json["constraint"] == null ? null : new List<String>.from(json["constraint"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "tname": tname == null ? null : tname,
        "attribs": attribs == null ? null : new List<dynamic>.from(attribs.map((x) => x.toJson())),
        "constraint": constraint == null ? null : new List<dynamic>.from(constraint.map((x) => x)),
    };
}

class Attrib {
    String name;
    String type;
    bool notNull;

    Attrib({
        this.name,
        this.type,
        this.notNull,
    });

    factory Attrib.fromJson(Map<String, dynamic> json) => new Attrib(
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        notNull: json["notNull"] == null ? null : json["notNull"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "notNull": notNull == null ? null : notNull,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
