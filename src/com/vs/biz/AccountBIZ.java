package com.vs.biz;

import java.util.List;

import com.vs.vo.AccountVO;

public interface AccountBIZ {
	public boolean insertViaJSON(List<AccountVO> list);
}
