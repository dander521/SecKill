package org.seckill.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.seckill.entity.SuccessSeckill;

public interface SuccessSeckillMapper {

    int deleteByPrimaryKey(@Param("seckillId") Long seckillId, @Param("userPhone") Long userPhone);

    int insert(SuccessSeckill record);

    SuccessSeckill selectByPrimaryKey(@Param("seckillId") Long seckillId, @Param("userPhone") Long userPhone);

    List<SuccessSeckill> selectAll();

    int updateByPrimaryKey(SuccessSeckill record);
}