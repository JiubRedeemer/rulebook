package com.jiubredeemer.rulebook.dal.repository.room;

import com.jiubredeemer.rulebook.dal.entity.tables.Room;
import com.jiubredeemer.rulebook.dal.entity.tables.records.RoomRecord;
import com.jiubredeemer.rulebook.domain.room.dto.RoomDto;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class RoomRepository {
    private final DSLContext dsl;

    public RoomDto saveOrGetRoom(RoomDto roomDto) {
        return dsl.insertInto(Room.ROOM)
                .set(dsl.newRecord(Room.ROOM, roomDto))
                .onConflictDoNothing()
                .returning()
                .fetchOptional()
                .orElseGet(() -> getRoomsRecordByRoomId(roomDto.getRoomId()).orElseThrow())
                .into(RoomDto.class);
    }

    public Optional<RoomDto> getRoomByRoomId(UUID roomId) {
        return dsl.selectFrom(Room.ROOM)
                .where(Room.ROOM.ROOM_ID.eq(roomId))
                .fetchOptional().map(roomsRecord -> roomsRecord.into(RoomDto.class));
    }

    public Optional<RoomRecord> getRoomsRecordByRoomId(UUID roomId) {
        return dsl.selectFrom(Room.ROOM)
                .where(Room.ROOM.ROOM_ID.eq(roomId))
                .fetchOptional();
    }

    public void deleteById(UUID roomId) {
        dsl.deleteFrom(Room.ROOM)
                .where(Room.ROOM.ROOM_ID.eq(roomId))
                .execute();
    }
}
