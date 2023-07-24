package com.KioskSNU.snu.mapper;

import com.KioskSNU.snu.dto.LockerDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LockerMapper {
    int insert(LockerDTO lockerDTO);
    int update(LockerDTO lockerDTO);
    int delete(LockerDTO lockerDTO);
    LockerDTO getById(int id);
    List<LockerDTO> getAll();
    List<LockerDTO> getAllByUsable(boolean usable);
}
