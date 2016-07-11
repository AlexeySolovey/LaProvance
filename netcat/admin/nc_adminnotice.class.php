<?php

/* $Id: nc_adminnotice.class.php 8216 2012-10-15 11:40:59Z vadim $ */

class nc_AdminNotice {

    const NC_CONNECT_TIMEOUT = 3;
    protected $core;
    protected $notices;
    protected $data;

    public function __construct() {
        $this->core = nc_Core::get_object();

        $this->notices = array(
                array('func' => 'demo'),
                array('func' => 'license'),
                array('func' => 'crpatch'),
                array('func' => 'support'),
                array('func' => 'cron'),
                array('func' => 'writeable'),
                array('func' => 'safe_mode')
        );
    }

    public function check() {
        $this->data = @unserialize($this->core->get_settings('AdminNoticeResponse'));

        foreach ($this->notices as $v) {
            $result = call_user_func(array($this, 'check_'.$v['func']));
            if ($result) return $result;
        }

        return false;
    }

    public function check_demo() {
        if (!$this->core->is_trial) return false;
        $text = str_replace("%DAY", (int) ((strtotime($this->core->get_settings('InstallationDateOut')) - time()) / 86400 + 1), TOOLS_ACTIVATION_DAY);
        $type = 'attention';
        return array('text' => $text, 'type' => $type);
    }

    /**
     * Проверка лицензии
     */
    public function check_license() {
        if (!$this->data['lic']) return false;

        if ($this->data['lic'] == 1) {
            $text = NETCAT_ADMIN_NOTICE_LICENSE_ILLEGAL.' <a href="http://netcat.ru/adminhelp/illegal">'.NETCAT_ADMIN_NOTICE_MORE.'</a>';
            $type = 'alarm';
        } else if ($this->data['lic'] == 2) {
            $text = NETCAT_ADMIN_NOTICE_LICENSE_MAYBE_ILLEGAL.' <a href="http://netcat.ru/adminhelp/maybe-illegal">'.NETCAT_ADMIN_NOTICE_MORE.'</a>';
            $type = 'attention';
        }

        return array('text' => $text, 'type' => $type);
    }

    /**
     * Проверка важных обновлений
     * @return <type>
     */
    public function check_crpatch() {
        if (!$this->data['crpatch']) return false;

        $text = NETCAT_ADMIN_NOTICE_SECURITY_UPDATE_SYSTEM.' <a href="'.$this->data['crpatchlink'].'">'.NETCAT_ADMIN_NOTICE_MORE.'</a>';
        $type = 'alarm';

        return array('text' => $text, 'type' => $type);
    }

    /**
     * Техническая поддержка
     */
    public function check_support() {
        if (!$this->data['support']) return false;

        $lic = $this->core->get_settings('ProductNumber');
        $link = $this->data['linkcopy'] ? $this->data['linkcopy'] : 'http://www.netcat.ru/forclients/my/copies/';
        $text = sprintf(NETCAT_ADMIN_NOTICE_SUPPORT_EXPIRED, $lic).' <a href="'.$link.'">'.NETCAT_ADMIN_NOTICE_PROLONG.'</a>';
        $type = 'attention';

        return array('text' => $text, 'type' => $type);
    }

    public function check_cron() {
        //$diff_last_run = $this->core->db->get_var("SELECT MIN(UNIX_TIMESTAMP() - `Cron_Launch`)  FROM `CronTasks`");
        //if ( $diff_last_run < 7*24*60*60 ) return false;

        $text = NETCAT_ADMIN_NOTICE_CRON;
        $type = 'recommend';
        $r = array('text' => $text, 'type' => $type);

        if ($this->core->modules->get_by_keyword('stats', 0)) {
            //if ( $this->core->db->get_var("SELECT `Log_ID` FROM `Stats_Log` LIMIT 1") ) return $r;
        }
        if ($this->core->modules->get_by_keyword('subscriber', 0)) {
            //if ( $this->core->db->get_var("SELECT `ID` FROM `Subscriber_Message` LIMIT 1")) return $r;
            //if ( $this->core->db->get_var("SELECT `ID` FROM `Subscriber_Prepared` LIMIT 1")) return $r;
        }
        if ($this->core->modules->get_by_keyword('search', 0)) {
            //$itable = $this->core->modules->get_vars('search', 'INDEX_TABLE');
            //$last = $this->core->db->get_var("SELECT UNIX_TIMESTAMP() - MAX(UNIX_TIMESTAMP(Created)) from Message".$itable);
            //if ( $last > 7*24*60*60 ) return $r;
        }
        if ($this->core->modules->get_by_keyword('banner', 0)) {
            //if ( $this->core->db->get_var("SELECT `Log_ID` FROM `Banner_Log` LIMIT 1") ) return $r;
        }
        return false;
    }

    public function check_writeable() {
        $text = NETCAT_ADMIN_NOTICE_RIGHTS;
        $type = 'attention';

        $path = $this->core->DOCUMENT_ROOT.$this->core->SUB_FOLDER.$this->core->HTTP_FILES_PATH;
        if (!is_dir($path) || !is_writable($path)) {
            return array('text' => $text.$this->core->HTTP_FILES_PATH, 'type' => $type);
        }

        if (!is_dir($this->core->TMP_FOLDER) || !is_writable($this->core->TMP_FOLDER)) {
            return array('text' => $text.$this->core->HTTP_ROOT_PATH.'tmp/', 'type' => $type);
        }

        $path = $this->core->DOCUMENT_ROOT.$this->core->SUB_FOLDER.$this->core->HTTP_CACHE_PATH;
        if (!is_dir($path) || !is_writable($path)) {
            return array('text' => $text.$this->core->HTTP_CACHE_PATH, 'type' => $type);
        }

        $path = $this->core->DOCUMENT_ROOT.$this->core->SUB_FOLDER.$this->core->HTTP_DUMP_PATH;
        if (!is_dir($path) || !is_writable($path)) {
            return array('text' => $text.$this->core->HTTP_DUMP_PATH, 'type' => $type);
        }
    }

    /**
     * Проверяем на включенный php safe_mode
     */
    public function check_safe_mode() {
        if (!ini_get('safe_mode')) return false;

        $text = NETCAT_ADMIN_NOTICE_SAFE_MODE;
        $type = 'attention';

        return array('text' => $text, 'type' => $type);
    }

    /**
     * Посылка запроса на неткэт.ру
     * @return int следующий патч
     */
    public function update($show_on_error = false) {
        return null;
    }

    /**
     * Посылка запроса на неткэт.ру
     * @return int следующий патч
     */
    public function check_upgrade($to_system) {
        return null;
    }

}