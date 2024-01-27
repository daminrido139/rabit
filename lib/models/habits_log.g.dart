// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitsLogCollection on Isar {
  IsarCollection<HabitsLog> get habitsLogs => this.collection();
}

const HabitsLogSchema = CollectionSchema(
  name: r'HabitsLog',
  id: -3301192170285865524,
  properties: {
    r'completedHabits': PropertySchema(
      id: 0,
      name: r'completedHabits',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'totalHabits': PropertySchema(
      id: 2,
      name: r'totalHabits',
      type: IsarType.long,
    )
  },
  estimateSize: _habitsLogEstimateSize,
  serialize: _habitsLogSerialize,
  deserialize: _habitsLogDeserialize,
  deserializeProp: _habitsLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _habitsLogGetId,
  getLinks: _habitsLogGetLinks,
  attach: _habitsLogAttach,
  version: '3.1.0+1',
);

int _habitsLogEstimateSize(
  HabitsLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _habitsLogSerialize(
  HabitsLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.completedHabits);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeLong(offsets[2], object.totalHabits);
}

HabitsLog _habitsLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitsLog();
  object.completedHabits = reader.readLong(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  object.totalHabits = reader.readLong(offsets[2]);
  return object;
}

P _habitsLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _habitsLogGetId(HabitsLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _habitsLogGetLinks(HabitsLog object) {
  return [];
}

void _habitsLogAttach(IsarCollection<dynamic> col, Id id, HabitsLog object) {
  object.id = id;
}

extension HabitsLogQueryWhereSort
    on QueryBuilder<HabitsLog, HabitsLog, QWhere> {
  QueryBuilder<HabitsLog, HabitsLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HabitsLogQueryWhere
    on QueryBuilder<HabitsLog, HabitsLog, QWhereClause> {
  QueryBuilder<HabitsLog, HabitsLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HabitsLogQueryFilter
    on QueryBuilder<HabitsLog, HabitsLog, QFilterCondition> {
  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition>
      completedHabitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition>
      completedHabitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition>
      completedHabitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition>
      completedHabitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedHabits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> totalHabitsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition>
      totalHabitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> totalHabitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalHabits',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterFilterCondition> totalHabitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalHabits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HabitsLogQueryObject
    on QueryBuilder<HabitsLog, HabitsLog, QFilterCondition> {}

extension HabitsLogQueryLinks
    on QueryBuilder<HabitsLog, HabitsLog, QFilterCondition> {}

extension HabitsLogQuerySortBy on QueryBuilder<HabitsLog, HabitsLog, QSortBy> {
  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> sortByCompletedHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedHabits', Sort.asc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> sortByCompletedHabitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedHabits', Sort.desc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> sortByTotalHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.asc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> sortByTotalHabitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.desc);
    });
  }
}

extension HabitsLogQuerySortThenBy
    on QueryBuilder<HabitsLog, HabitsLog, QSortThenBy> {
  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenByCompletedHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedHabits', Sort.asc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenByCompletedHabitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedHabits', Sort.desc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenByTotalHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.asc);
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QAfterSortBy> thenByTotalHabitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHabits', Sort.desc);
    });
  }
}

extension HabitsLogQueryWhereDistinct
    on QueryBuilder<HabitsLog, HabitsLog, QDistinct> {
  QueryBuilder<HabitsLog, HabitsLog, QDistinct> distinctByCompletedHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedHabits');
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<HabitsLog, HabitsLog, QDistinct> distinctByTotalHabits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalHabits');
    });
  }
}

extension HabitsLogQueryProperty
    on QueryBuilder<HabitsLog, HabitsLog, QQueryProperty> {
  QueryBuilder<HabitsLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HabitsLog, int, QQueryOperations> completedHabitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedHabits');
    });
  }

  QueryBuilder<HabitsLog, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<HabitsLog, int, QQueryOperations> totalHabitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalHabits');
    });
  }
}
