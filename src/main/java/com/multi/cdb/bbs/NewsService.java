<<<<<<< HEAD
package com.multi.cdb.bbs;

public class NewsService {

}
=======
package com.multi.cdb.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsService {
	@Autowired
	NewsDAO dao;
	
	public List<NewsVO> list() {
		return dao.list();
	}
}
>>>>>>> 8d1c19413864fe343b5f33f875caa98114e6c76d
