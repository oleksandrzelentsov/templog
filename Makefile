EXEC_NAME=templog.sh
EXEC_PATH=/bin

RSYSLOG_CONF=templog.conf
RSYSLOG_CONF_PATH=/etc/rsyslog.d

SERVICE_NAME=templog.service
SERVICE_PATH=/usr/lib/systemd/system

install: ${EXEC_NAME} ${RSYSLOG_CONF} ${SERVICE_NAME}
	cp ${EXEC_NAME} ${EXEC_PATH}/${EXEC_NAME}
	mkdir -p ${SERVICE_PATH}
	cp ${SERVICE_NAME} ${SERVICE_PATH}/${SERVICE_NAME}
	cp ${RSYSLOG_CONF} ${RSYSLOG_CONF_PATH}/${RSYSLOG_CONF}
	systemctl restart rsyslog
	systemctl enable ${SERVICE_NAME}
	systemctl start ${SERVICE_NAME}

uninstall: ${EXEC_PATH}/${EXEC_NAME} ${SERVICE_PATH}/${SERVICE_NAME} ${RSYSLOG_CONF_PATH}/${RSYSLOG_CONF}
	systemctl disable ${SERVICE_NAME}
	rm ${EXEC_PATH}/${EXEC_NAME}
	rm ${SERVICE_PATH}/${SERVICE_NAME}
	rm ${RSYSLOG_CONF_PATH}/${RSYSLOG_CONF}
