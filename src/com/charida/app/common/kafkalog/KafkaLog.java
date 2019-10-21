package com.charida.app.common.kafkalog;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;

@Component
public class KafkaLog {
	protected Log log = LogFactory.getLog(KafkaLog.class);
	public void createLog (String msg) {
		log.debug(msg);
	}
}

