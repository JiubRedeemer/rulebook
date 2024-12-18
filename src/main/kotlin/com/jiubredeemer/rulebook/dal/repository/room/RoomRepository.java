package com.jiubredeemer.rulebook.dal.repository.room;

import com.jiubredeemer.rulebook.dal.entity.tables.Rooms;
import com.jiubredeemer.rulebook.dal.entity.tables.records.RoomsRecord;
import com.jiubredeemer.rulebook.domain.rooms.dto.RoomDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RoomRepository {
    private final DSLContext dsl;

    public RoomDto saveOrGetRoom(RoomDto roomDto) {
        return dsl.insertInto(Rooms.ROOMS)
                .set(dsl.newRecord(Rooms.ROOMS, roomDto))
                .onConflictDoNothing()
                .returning()
                .fetchOptional()
                .orElseGet(() -> getRoomsRecordByRoomId(roomDto.getRoomId()).orElseThrow())
                .into(RoomDto.class);
    }

    public Optional<RoomDto> getRoomByRoomId(UUID roomId) {
        return Objects.requireNonNull(dsl.selectFrom(Rooms.ROOMS)
                .where(Rooms.ROOMS.ROOM_ID.eq(roomId))
                .fetchOptional()).map(roomsRecord -> roomsRecord.into(RoomDto.class));
    }

    public Optional<RoomsRecord> getRoomsRecordByRoomId(UUID roomId) {
        return Objects.requireNonNull(dsl.selectFrom(Rooms.ROOMS)
                .where(Rooms.ROOMS.ROOM_ID.eq(roomId))
                .fetchOptional());
    }

    public void deleteById(UUID roomId) {
        dsl.deleteFrom(Rooms.ROOMS)
                .where(Rooms.ROOMS.ROOM_ID.eq(roomId))
                .execute();
    }
}
