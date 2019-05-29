package org.seckill.dao;

import java.util.List;
import org.seckill.entity.Seckill;

public interface SeckillMapper {

    int deleteByPrimaryKey(Long seckillId);

    int insert(Seckill record);

    Seckill selectByPrimaryKey(Long seckillId);

    List<Seckill> selectAll();

    int updateByPrimaryKey(Seckill record);


}