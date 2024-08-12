// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_db.dart';

// ignore_for_file: type=lint
class $MyProductsTable extends MyProducts
    with TableInfo<$MyProductsTable, MyProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 5000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 5000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favorite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, price, description, url, isFavorite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_products';
  @override
  VerificationContext validateIntegrity(Insertable<MyProduct> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyProduct(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
    );
  }

  @override
  $MyProductsTable createAlias(String alias) {
    return $MyProductsTable(attachedDatabase, alias);
  }
}

class MyProduct extends DataClass implements Insertable<MyProduct> {
  final int id;
  final String name;
  final double price;
  final String description;
  final String url;
  final bool isFavorite;
  const MyProduct(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.url,
      required this.isFavorite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['description'] = Variable<String>(description);
    map['url'] = Variable<String>(url);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  MyProductsCompanion toCompanion(bool nullToAbsent) {
    return MyProductsCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      description: Value(description),
      url: Value(url),
      isFavorite: Value(isFavorite),
    );
  }

  factory MyProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyProduct(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String>(url),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  MyProduct copyWith(
          {int? id,
          String? name,
          double? price,
          String? description,
          String? url,
          bool? isFavorite}) =>
      MyProduct(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        description: description ?? this.description,
        url: url ?? this.url,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  MyProduct copyWithCompanion(MyProductsCompanion data) {
    return MyProduct(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      description:
          data.description.present ? data.description.value : this.description,
      url: data.url.present ? data.url.value : this.url,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyProduct(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, price, description, url, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyProduct &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.description == this.description &&
          other.url == this.url &&
          other.isFavorite == this.isFavorite);
}

class MyProductsCompanion extends UpdateCompanion<MyProduct> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> price;
  final Value<String> description;
  final Value<String> url;
  final Value<bool> isFavorite;
  const MyProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  MyProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double price,
    required String description,
    required String url,
    required bool isFavorite,
  })  : name = Value(name),
        price = Value(price),
        description = Value(description),
        url = Value(url),
        isFavorite = Value(isFavorite);
  static Insertable<MyProduct> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<String>? description,
    Expression<String>? url,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  MyProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? price,
      Value<String>? description,
      Value<String>? url,
      Value<bool>? isFavorite}) {
    return MyProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

abstract class _$ProductDatabase extends GeneratedDatabase {
  _$ProductDatabase(QueryExecutor e) : super(e);
  $ProductDatabaseManager get managers => $ProductDatabaseManager(this);
  late final $MyProductsTable myProducts = $MyProductsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myProducts];
}

typedef $$MyProductsTableCreateCompanionBuilder = MyProductsCompanion Function({
  Value<int> id,
  required String name,
  required double price,
  required String description,
  required String url,
  required bool isFavorite,
});
typedef $$MyProductsTableUpdateCompanionBuilder = MyProductsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> price,
  Value<String> description,
  Value<String> url,
  Value<bool> isFavorite,
});

class $$MyProductsTableTableManager extends RootTableManager<
    _$ProductDatabase,
    $MyProductsTable,
    MyProduct,
    $$MyProductsTableFilterComposer,
    $$MyProductsTableOrderingComposer,
    $$MyProductsTableCreateCompanionBuilder,
    $$MyProductsTableUpdateCompanionBuilder> {
  $$MyProductsTableTableManager(_$ProductDatabase db, $MyProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MyProductsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MyProductsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
          }) =>
              MyProductsCompanion(
            id: id,
            name: name,
            price: price,
            description: description,
            url: url,
            isFavorite: isFavorite,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double price,
            required String description,
            required String url,
            required bool isFavorite,
          }) =>
              MyProductsCompanion.insert(
            id: id,
            name: name,
            price: price,
            description: description,
            url: url,
            isFavorite: isFavorite,
          ),
        ));
}

class $$MyProductsTableFilterComposer
    extends FilterComposer<_$ProductDatabase, $MyProductsTable> {
  $$MyProductsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isFavorite => $state.composableBuilder(
      column: $state.table.isFavorite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MyProductsTableOrderingComposer
    extends OrderingComposer<_$ProductDatabase, $MyProductsTable> {
  $$MyProductsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isFavorite => $state.composableBuilder(
      column: $state.table.isFavorite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $ProductDatabaseManager {
  final _$ProductDatabase _db;
  $ProductDatabaseManager(this._db);
  $$MyProductsTableTableManager get myProducts =>
      $$MyProductsTableTableManager(_db, _db.myProducts);
}
