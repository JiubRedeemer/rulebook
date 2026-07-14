package com.jiubredeemer.rulebook.dal.repository.race;

import com.jiubredeemer.rulebook.dal.entity.tables.Default_2024Race;
import com.jiubredeemer.rulebook.dal.entity.tables.Default_5eRace;
import com.jiubredeemer.rulebook.dal.entity.tables.Race;
import com.jiubredeemer.rulebook.dal.entity.tables.Srd_2024Race;
import com.jiubredeemer.rulebook.dal.mapper.race.Default2024RaceMapper;
import com.jiubredeemer.rulebook.dal.mapper.race.Default5eRaceMapper;
import com.jiubredeemer.rulebook.dal.mapper.race.DefaultSrd2024RaceMapper;
import com.jiubredeemer.rulebook.dal.mapper.race.RaceMapper;
import com.jiubredeemer.rulebook.domain.race.dto.RaceDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RaceRepository {
    private static final Table<Record> DEFAULT_2024_RACE = DSL.table(DSL.name("rules", "default_2024_race"));
    private static final Field<String> DEFAULT_2024_RACE_CODE = DSL.field(DSL.name("code"), String.class);
    private static final Field<Boolean> HIDDEN = DSL.field(DSL.name("hidden"), Boolean.class);
    private static final Field<UUID> BUNDLE_ID = DSL.field(DSL.name("bundle_id"), UUID.class);

    private final DSLContext dsl;
    private final RaceMapper raceMapper;
    private final Default5eRaceMapper default5eRaceMapper;
    private final Default2024RaceMapper default2024RaceMapper;
    private final DefaultSrd2024RaceMapper default2024SrdRaceMapper;

    public List<RaceDto> getFullRacesForRoom(UUID roomId) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ROOM_ID.eq(roomId))
                .fetch()
                .map(raceMapper);
    }

    /**
     * Условие "контент комнаты": собственные (room_id) + из включённых бандлов (bundle_id)
     * + точечно включённые элементы (id).
     */
    private org.jooq.Condition roomBundlesOrContent(UUID roomId, Collection<UUID> bundleIds, Collection<UUID> contentIds) {
        org.jooq.Condition condition = Race.RACE.ROOM_ID.eq(roomId);
        if (bundleIds != null && !bundleIds.isEmpty()) {
            condition = condition.or(BUNDLE_ID.in(bundleIds));
        }
        if (contentIds != null && !contentIds.isEmpty()) {
            condition = condition.or(Race.RACE.ID.in(contentIds));
        }
        return condition;
    }

    public List<RaceDto> getRacesForRoomAndBundles(UUID roomId, Collection<UUID> bundleIds, Collection<UUID> contentIds) {
        return dsl.selectFrom(Race.RACE)
                .where(roomBundlesOrContent(roomId, bundleIds, contentIds))
                .fetch()
                .map(raceMapper);
    }

    public Collection<RaceDto> getRootRacesForRoomAndBundles(UUID roomId, Collection<UUID> bundleIds, Collection<UUID> contentIds) {
        return dsl.selectFrom(Race.RACE)
                .where(roomBundlesOrContent(roomId, bundleIds, contentIds))
                .and(Race.RACE.CODE.eq(Race.RACE.SPECIES_CODE).or(Race.RACE.SPECIES_CODE.isNull()))
                .fetch()
                .map(raceMapper);
    }

    public Optional<RaceDto> getRaceByCodeForRoomAndBundles(UUID roomId, Collection<UUID> bundleIds, Collection<UUID> contentIds, String code) {
        return dsl.selectFrom(Race.RACE)
                .where(roomBundlesOrContent(roomId, bundleIds, contentIds))
                .and(Race.RACE.CODE.eq(code))
                .limit(1)
                .fetchOptional()
                .map(raceMapper);
    }

    public Collection<RaceDto> getSubspeciesForRoomAndBundles(UUID roomId, Collection<UUID> bundleIds, Collection<UUID> contentIds, String code) {
        return dsl.selectFrom(Race.RACE)
                .where(roomBundlesOrContent(roomId, bundleIds, contentIds))
                .and(Race.RACE.SPECIES_CODE.eq(code))
                .and(Race.RACE.CODE.notEqual(code))
                .fetch()
                .map(raceMapper);
    }

    /**
     * Поиск расы по коду в любом бандле (без учёта включённости в комнате).
     * Нужен для уже созданных персонажей: их раса должна резолвиться, даже если
     * набор в комнате отключён. Для выбора новым персонажам такие расы не показываются.
     */
    public Optional<RaceDto> getRaceByCodeInAnyBundle(String code) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.CODE.eq(code))
                .and(BUNDLE_ID.isNotNull())
                .limit(1)
                .fetchOptional()
                .map(raceMapper);
    }

    // ---- Авторство: контент, привязанный к бандлу ----

    public List<RaceDto> getRacesByBundle(UUID bundleId) {
        return dsl.selectFrom(Race.RACE)
                .where(BUNDLE_ID.eq(bundleId))
                .fetch()
                .map(raceMapper);
    }

    public RaceDto createRaceForBundle(UUID bundleId, RaceDto raceDto) {
        dsl.insertInto(Race.RACE)
                .set(raceMapper.mapToRecord(raceDto))
                .set(HIDDEN, raceDto.getHidden())
                .set(BUNDLE_ID, bundleId)
                .execute();
        final RaceDto dto = getFullRaceById(raceDto.getId()).orElseThrow();
        dto.setHidden(fetchHiddenById(raceDto.getId()));
        return dto;
    }

    public void deleteById(UUID id) {
        dsl.deleteFrom(Race.RACE).where(Race.RACE.ID.eq(id)).execute();
    }

    public void deleteByBundle(UUID bundleId) {
        dsl.deleteFrom(Race.RACE).where(BUNDLE_ID.eq(bundleId)).execute();
    }

    public List<RaceDto> getFull5eRacesForRoom() {
        return dsl.selectFrom(Default_5eRace.DEFAULT_5E_RACE)
                .fetch()
                .map(default5eRaceMapper);
    }

    public List<RaceDto> getFull2024RacesForRoom() {
        return dsl.selectFrom(DEFAULT_2024_RACE)
                .fetch()
                .map(default2024RaceMapper);
    }

    public List<RaceDto> getFull2024SrdRacesForRoom() {
        return dsl.selectFrom(Srd_2024Race.SRD_2024_RACE)
                .fetch()
                .map(default2024SrdRaceMapper);
    }

    public Optional<RaceDto> getFull5eRaceByCode(String raceCode) {
        return dsl.selectFrom(Default_5eRace.DEFAULT_5E_RACE)
                .where(Default_5eRace.DEFAULT_5E_RACE.CODE.eq(raceCode))
                .fetchOptional()
                .map(default5eRaceMapper);
    }

    public Optional<RaceDto> getFull2024RaceByCode(String raceCode) {
        return dsl.selectFrom(DEFAULT_2024_RACE)
                .where(DEFAULT_2024_RACE_CODE.eq(raceCode))
                .fetchOptional()
                .map(default2024RaceMapper);
    }

    public Optional<RaceDto> getFull2024SrdRaceByCode(String raceCode) {
        return dsl.selectFrom(Srd_2024Race.SRD_2024_RACE)
                .where(Srd_2024Race.SRD_2024_RACE.CODE.eq(raceCode))
                .fetchOptional()
                .map(default2024SrdRaceMapper);
    }

    public Optional<RaceDto> getFullRaceByCode(String raceCode, UUID roomId) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ROOM_ID.eq(roomId))
                .and(Race.RACE.CODE.eq(raceCode))
                .fetchOptional()
                .map(raceMapper);
    }

    public Optional<RaceDto> getFullRaceById(UUID raceId) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ID.eq(raceId))
                .fetchOptional()
                .map(raceMapper)
                .map(dto -> {
                    dto.setHidden(fetchHiddenById(raceId));
                    return dto;
                });
    }

    public Collection<RaceDto> getFull5eRootRacesForRoom() {
        return dsl.selectFrom(Default_5eRace.DEFAULT_5E_RACE)
                .where(Default_5eRace.DEFAULT_5E_RACE.CODE.eq(Default_5eRace.DEFAULT_5E_RACE.SPECIES_CODE)
                        .or(Default_5eRace.DEFAULT_5E_RACE.SPECIES_CODE.isNull()))
                .fetch()
                .map(default5eRaceMapper);
    }

    public Collection<RaceDto> getFull2024RootRacesForRoom() {
        return dsl.selectFrom(Default_2024Race.DEFAULT_2024_RACE)
                .where(Default_2024Race.DEFAULT_2024_RACE.CODE.eq(Default_2024Race.DEFAULT_2024_RACE.SPECIES_CODE)
                        .or(Default_2024Race.DEFAULT_2024_RACE.SPECIES_CODE.isNull()))
                .fetch()
                .map(default2024RaceMapper);
    }

    public Collection<RaceDto> getFullRootRacesForRoom(UUID roomId) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ROOM_ID.eq(roomId))
                .and(Race.RACE.CODE.eq(Race.RACE.SPECIES_CODE)
                        .or(Race.RACE.SPECIES_CODE.isNull()))
                .fetch()
                .map(raceMapper);
    }

    public Collection<RaceDto> getFull5eRaceSubspeciesByCode(String raceCode) {
        return dsl.selectFrom(Default_5eRace.DEFAULT_5E_RACE)
                .where(Default_5eRace.DEFAULT_5E_RACE.SPECIES_CODE.eq(raceCode))
                .and(Default_5eRace.DEFAULT_5E_RACE.CODE.notEqual(raceCode))
                .fetch()
                .map(default5eRaceMapper);
    }

    public Collection<RaceDto> getFull2024RaceSubspeciesByCode(String raceCode) {
        return dsl.selectFrom(Default_2024Race.DEFAULT_2024_RACE)
                .where(Default_2024Race.DEFAULT_2024_RACE.SPECIES_CODE.eq(raceCode))
                .and(Default_2024Race.DEFAULT_2024_RACE.CODE.notEqual(raceCode))
                .fetch()
                .map(default2024RaceMapper);
    }
    public Collection<RaceDto> getFull2024SrdRaceSubspeciesByCode(String raceCode) {
        return dsl.selectFrom(Srd_2024Race.SRD_2024_RACE)
                .where(Srd_2024Race.SRD_2024_RACE.SPECIES_CODE.eq(raceCode))
                .and(Srd_2024Race.SRD_2024_RACE.CODE.notEqual(raceCode))
                .fetch()
                .map(default2024SrdRaceMapper);
    }

    public Collection<RaceDto> getFullRaceSubspeciesByCode(String raceCode, UUID roomId) {
        return dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ROOM_ID.eq(roomId))
                .and(Race.RACE.SPECIES_CODE.eq(raceCode))
                .and(Race.RACE.CODE.notEqual(raceCode))
                .fetch()
                .map(raceMapper);
    }

    public RaceDto createRace(RaceDto raceDto) {
        dsl.insertInto(Race.RACE)
                .set(raceMapper.mapToRecord(raceDto))
                .set(HIDDEN, raceDto.getHidden())
                .execute();
        final RaceDto dto = dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ID.eq(raceDto.getId()))
                .fetchOptional()
                .map(raceMapper)
                .orElseThrow();
        dto.setHidden(fetchHiddenById(raceDto.getId()));
        return dto;
    }


    public RaceDto updateRace(RaceDto raceDto) {
        dsl.update(Race.RACE)
                .set(raceMapper.mapToRecord(raceDto))
                .set(HIDDEN, raceDto.getHidden())
                .where(Race.RACE.ID.eq(raceDto.getId()))
                .execute();
        final RaceDto dto = dsl.selectFrom(Race.RACE)
                .where(Race.RACE.ID.eq(raceDto.getId()))
                .fetchOptional()
                .map(raceMapper)
                .orElseThrow();
        dto.setHidden(fetchHiddenById(raceDto.getId()));
        return dto;
    }

    public RaceDto setHidden(UUID id, Boolean hidden) {
        dsl.update(Race.RACE)
                .set(HIDDEN, hidden)
                .where(Race.RACE.ID.eq(id))
                .execute();
        final RaceDto dto = getFullRaceById(id).orElseThrow();
        dto.setHidden(fetchHiddenById(id));
        return dto;
    }

    private Boolean fetchHiddenById(UUID id) {
        return dsl.select(HIDDEN)
                .from(Race.RACE)
                .where(Race.RACE.ID.eq(id))
                .fetchOne(HIDDEN);
    }
}
