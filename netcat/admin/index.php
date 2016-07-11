<?php
/* $Id: index.php 8445 2012-11-21 13:49:24Z vadim $ */
error_reporting(E_ALL);
require_once ("function.inc.php");
$system_env = $nc_core->get_settings();
$an = new nc_AdminNotice();
$adminNotice = $an->check();
?><!DOCTYPE html>
<!--[if lt IE 7]><html style="overflow-y:hidden" class="nc-ie6 nc-oldie"><![endif]-->
<!--[if IE 7]><html style="overflow-y:hidden" class="nc-ie7 nc-oldie"><![endif]-->
<!--[if IE 8]><html style="overflow-y:hidden" class="nc-ie8 nc-oldie"><![endif]-->
<!--[if gt IE 8]><!--><html style="overflow-y:hidden"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?= $nc_core->NC_CHARSET ?>" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <title><?= ($title ? $title : "NetCat ".BEGINHTML_VERSION." ".$VERSION_ID." ".$SYSTEM_NAME) ?></title>
    <script type='text/javascript'>
        var FIRST_TREE_MODE = '<?= $treeMode ?>';
    </script>
    <?= nc_js(); ?>
    <?php
    $js_files = array();
    $js_files[] = $ADMIN_PATH . 'js/main.js';
    $js_files[] = $ADMIN_PATH . 'js/container.js';
    $js_files[] = $ADMIN_PATH . 'js/dispatcher.js';
    $js_files[] = $ADMIN_PATH . 'js/url_routes.js';
    $js_files[] = $ADMIN_PATH . 'js/json2.js';
    ?>
    <?
    // MODULE URL DISPATCHERS
    $modules = $nc_core->modules->get_data();
    //ADMIN_LANGUAGE

    if ( !empty($modules) ) {
        foreach ($modules as $module) {
            if (file_exists($MODULE_FOLDER.$module['Keyword']."/".MAIN_LANG.".lang.php")) {
                require_once ($MODULE_FOLDER.$module['Keyword']."/".MAIN_LANG.".lang.php");
            } else {
                require_once ($MODULE_FOLDER.$module['Keyword']."/en.lang.php");
            }
            if (file_exists($MODULE_FOLDER.$module['Keyword']."/url_routes.js")) {
                $js_files[] = $SUB_FOLDER.$HTTP_ROOT_PATH."modules/".$module['Keyword']."/url_routes.js";
                //echo "<script type='text/javascript' src='".$SUB_FOLDER.$HTTP_ROOT_PATH."modules/".$module['Keyword']."/url_routes.js?".$LAST_LOCAL_PATCH."'></script>\n";
            }
        }
    }

    $js_files[] = $ADMIN_PATH . 'js/main_view.js';
    $js_files[] = $ADMIN_PATH . 'js/drag.js';

    foreach(nc_minify_file($js_files, 'js') as $file) {
        echo "<script type='text/javascript' src='".$file."'></script>\n";
    }

    include($ADMIN_FOLDER."modules/module_list.inc.php");

    /*<script type='text/javascript' src='<?= $ADMIN_PATH ?>js/main_view.js?<?= $LAST_LOCAL_PATCH ?>'></script>
    <script type='text/javascript' src='<?= $ADMIN_PATH ?>js/drag.js?<?= $LAST_LOCAL_PATCH ?>'></script>*/
    ?>

    <script type='text/javascript'>
        var REMIND_SAVE = '<?= $REMIND_SAVE ?>';
        var TEXT_SAVE = '<?= NETCAT_REMIND_SAVE_TEXT ?>';
        var TEXT_REFRESH = '<?= NETCAT_TAB_REFRESH ?>';
    </script>
</head>
<?php
//--------------------------------------------------------------------------
// Собираем главное меню (nc-navbar)
//--------------------------------------------------------------------------

$navbar = $nc_core->ui->navbar();

$navbar->menu->title(SECTION_INDEX_MENU_TITLE)->add_btn('#')->icon_large('logo-white')
    ->title(SECTION_INDEX_MENU_HOME . ': NetCat ' . BEGINHTML_VERSION . ' ' . $VERSION_ID . ' ' . $SYSTEM_NAME, true)
    ->click('return true');

$all_site_admin = $perm->isAccess(NC_PERM_ITEM_SITE, 'viewall', 0, 0);

// получим id всех каталогов, к которому пользователь имеет доступ админа\модер
// или иммет доступ к его разделам, тоже админ\модер
// если ф-ция вернет не массив, то значит есть доступ ко всем
$array_id = $perm->GetAllowSite(MASK_ADMIN | MASK_MODERATE, true);
$sites = $db->get_results("SELECT `Catalogue_ID`, `Catalogue_Name`, `Domain`, `Mirrors`, `Checked`, `ncMobile`, `ncResponsive`
    FROM `Catalogue`".( is_array($array_id) && !empty($array_id) ? " WHERE `Catalogue_ID` IN (".join(',', $array_id).")" : "" )."
    ORDER BY `Priority`", ARRAY_A);

// Cайт
//--------------------------------------------------------------------------
if ($perm->isAccessSiteMap() || $perm->isGuest()) {
    $navbar->menu->site = $navbar->menu->add_btn('#', SECTION_INDEX_MENU_SITE)->submenu();

    if ($sites) {
        foreach ($sites as $site) {
            // each site
            $site_icon = 'site' . ($site['ncMobile'] ? '-mobile' : ($site['ncResponsive'] ? '-adaptive' : ''));
            $navbar->menu->site->add_btn('#site.map(' . $site['Catalogue_ID'] . ')')
                ->text($site['Catalogue_Name'])
                ->icon($site_icon)
                ->disabled(!$site['Checked']);
        }

        $navbar->menu->site->add_divider();

        if ($all_site_admin) {
            $navbar->menu->site->add_btn('#site.list', SECTION_INDEX_SITE_LIST)->icon('site-list');
        }
    }

    if ($all_site_admin) {
        $navbar->menu->site
            ->add_btn('#site.add()', CONTROL_CONTENT_CATALOUGE_FUNCS_SHOWCATALOGUELIST_ADDSITE)->icon('site-add')
            ->add_btn('#site.wizard(1,0)', SECTION_INDEX_WIZARD_SUBMENU_SITE)->icon('site-wizard');
    }
}

// Пользователи
//--------------------------------------------------------------------------
if ($perm->isUserMenuShow()) {
    $navbar->menu->users = $navbar->menu->add_btn('#', CONTROL_CONTENT_CATALOUGE_FUNCS_CATALOGUEFORM_USERS)->submenu();

    $navbar->menu->users->add_btn('#user.list', SECTION_CONTROL_USER_LIST)->icon('user');

    if ( $perm->isAccess(NC_PERM_ITEM_GROUP, 0, 0, 0) ) {
        $navbar->menu->users->add_btn('#usergroup.list', SECTION_CONTROL_USER_GROUP)->icon('user-group');
    }
    if ( $perm->isAccess(NC_PERM_ITEM_USER, NC_PERM_ACTION_ADD, 0, 0) ) {
        $navbar->menu->users->add_btn('#user.add', CONTROL_USER_REG)->icon('user-add');
    }

    if ( $perm->isAccess(NC_PERM_ITEM_GROUP, 0, 0, 0) ) {
        $navbar->menu->users->add_btn('#user.mail', SECTION_INDEX_USER_USER_MAIL)->icon('mod-subscriber')->divider();
    }
}

// Инструменты
//--------------------------------------------------------------------------
if ($perm->isSupervisor() || $perm->isGuest()) {
    $navbar->menu->tools = $navbar->menu->add_btn('#', SECTION_INDEX_MENU_TOOLS)->submenu();

    $navbar->menu->tools
        ->add_btn('#cron.settings', SECTION_SECTIONS_INSTRUMENTS_CRON)->icon('tasks')
        ->add_btn('#redirect.list(1)', TOOLS_REDIRECT)->icon('redirect')
        ->add_divider();


    if ($nc_core->modules->get_by_keyword('stats')) {
        $navbar->menu->tools->add_btn('#module.stats', NETCAT_MODULE_STATS)->icon('mod-stats');
    }
    if ($nc_core->modules->get_by_keyword('banner')) {
        $navbar->menu->tools->add_btn('#module.banner', NETCAT_MODULE_BANNER)->icon('mod-banner');
    }
    if ($nc_core->modules->get_by_keyword('search')) {
        $navbar->menu->tools->add_btn('#module.search.brokenlinks', NETCAT_MODULE_SEARCH_ADMIN_BROKEN_LINKS_MENU_ITEM)->icon('brokenlink');
    }
    if ($nc_core->modules->get_by_keyword('filemanager', 0, 0)) {
        $navbar->menu->tools->add_btn('#module.filemanager', NETCAT_MODULE_FILEMANAGER)->icon('mod-filemanager');
    }

    $navbar->menu->tools
        ->add_btn('#tools.seo('.$HTTP_HOST.')', NETCAT_SITEINFO_LINK)->icon('site-settings')
        ->add_btn('#tools.copy()', TOOLS_COPYSUB)->icon('copy')
        ->add_btn('#trash.list', SECTION_SECTIONS_INSTRUMENTS_TRASH)->icon('trash')
        ->add_divider()
        ->add_btn('#tools.sql', SECTION_SECTIONS_INSTRUMENTS_SQL)->icon('sql-console')
        ->add_divider()
        ->add_btn('#tools.backup', SECTION_SECTIONS_MODDING_ARHIVES)->icon('mod-cache')
        ->add_btn('#tools.databackup.export', TOOLS_DATA_BACKUP)->icon('mod-cache')
        ->add_btn('#tools.csv.export', TOOLS_CSV)->icon('mod-cache')
        ->add_btn('#tools.patch', TOOLS_PATCH)->icon('update')
        ->add_btn('#tools.installmodule', TOOLS_MODULES_MOD_INSTALL)->icon('mod-default');

    if ($nc_core->is_trial) {
        $navbar->menu->tools->add_btn('#tools.activation', TOOLS_ACTIVATION)->icon('')->off()->divider();
    }

    $navbar->menu->tools->add_btn('#tools.totalstat', SECTION_REPORTS_TOTAL)->icon('total-stats')->divider();

    if ($nc_core->modules->get_by_keyword('logging')) {
        $navbar->menu->tools->add_btn('#module.logging', NETCAT_MODULE_LOGGING)->icon('mod-logging');
    }

    $navbar->menu->tools->add_btn('#tools.systemmessages', SECTION_REPORTS_SYSMESSAGES)->icon('docs');
}

// Разработка
//--------------------------------------------------------------------------
if ($perm->isAccessDevelopment() || $perm->isGuest()) {
    $navbar->menu->dev = $navbar->menu->add_btn('#', SECTION_INDEX_MENU_DEVELOPMENT)->submenu();

    //Access to class
    if ($perm->isSupervisor() || $perm->isGuest()) {
        $navbar->menu->dev->add_btn('#dataclass_fs.list', SECTION_CONTROL_CLASS)->icon('dev-components');
    }
    //Access to template
    if ($perm->isSupervisor() || $perm->isGuest()) {
        $navbar->menu->dev->add_btn('#template_fs.list', SECTION_CONTROL_TEMPLATE_SHOW)->icon('dev-templates');
    }
    //Access to system table
    if ($perm->isSupervisor() || $perm->isGuest()) {
        $navbar->menu->dev->add_btn('#systemclass_fs.list', SECTION_SECTIONS_OPTIONS_SYSTEM)->icon('dev-system-tables');
    }
    //Access to classificator
    if ($perm->isAnyClassificator() || $perm->isGuest()) {
        $navbar->menu->dev->add_btn('#classificator.list', SECTION_CONTROL_CONTENT_CLASSIFICATOR)->icon('dev-classificator');
    }
}

// Настройки
//--------------------------------------------------------------------------
if ($perm->isSupervisor() || $perm->isGuest()) {
    $navbar->menu->settings = $navbar->menu->add_btn('#', SECTION_INDEX_MENU_SETTINGS)->submenu();

    $navbar->menu->settings
        ->add_btn('#system.settings', SECTION_SECTIONS_OPTIONS)->icon('settings')
        ->add_btn('#module.list', SECTION_SECTIONS_OPTIONS_MODULE_LIST)->icon('settings')
        ->add_btn('#wysiwyg.ckeditor.settings', SECTION_SECTIONS_OPTIONS_WYSIWYG)->icon('settings')
        ->add_btn((count($sites) == 1 ? "#site.edit(".$sites[0]['Catalogue_ID'].")" : "#site.list"), SECTION_INDEX_SITES_SETTINGS)->icon('site');
}

//--------------------------------------------------------------------------
// Navbar tray
//--------------------------------------------------------------------------

// AJAX Loader
$navbar->tray->add_btn('#')->compact()->icon_large('navbar-loader')->id('nc-navbar-loader')->style('display:none');

// Меню пользователя
$logout_link = $MODULE_VARS['auth'] ? $SUB_FOLDER . $HTTP_ROOT_PATH . "modules/auth/?logoff=1&amp;REQUESTED_FROM=" . $REQUEST_URI  : $ADMIN_PATH . "unauth.php";
$navbar->tray->add_btn('#', $perm->getLogin())
    ->click('return false')
    ->title(BEGINHTML_USER . ': ' . $perm->getLogin())
    ->htext(BEGINHTML_USER)
    ->dropdown()
    ->div(
        NETCAT_ADMIN_AUTH_PERM . " <span class='nc-text-grey'>" . join(', ', Permission::get_all_permission_names_by_id($AUTH_USER_ID)) . "</span><hr>"
        . $nc_core->ui->btn('#', NETCAT_ADMIN_AUTH_CHANGE_PASS)->click('nc_password_change(); return false')->light()->text_darken()->left()
        . $nc_core->ui->btn($logout_link, NETCAT_ADMIN_AUTH_LOGOUT)->red()->right()
    )->class_name('nc-padding-10');


?>
<body class="nc-admin" style="overflow-y:hidden">

    <?php echo $navbar; ?>

    <? if (!$_COOKIE['nc_welcome_is_showed']): ?>
        <?=$nc_core->ui->view(nc_core('ADMIN_FOLDER') . "views/admin/welcome.view.php") ?>
    <? endif ?>

<?php
// Содержание модального окна быстрого изменения пароля
//TODO: Сделать загрузку содержимого окна через ajax
?>
<div id='nc_password_change' class='nc-shadow-large nc--hide'>
    <form class='nc-form' style='width:350px' method='post' action='<?=$ADMIN_PATH ?>user/index.php'>
        <div class='nc-padding-15'>
            <h2 class='nc-h2'><?=NETCAT_ADMIN_AUTH_CHANGE_PASS ?></h2>
            <hr class='nc-hr' style='margin:5px -15px 15px'>
            <div>
                <label><?=CONTROL_USER_NEWPASSWORD ?></label><br>
                <input class='nc--wide' type='password' name='Password1' maxlength='32' placeholder='<?=CONTROL_USER_NEWPASSWORD ?>' />
            </div>
            <div>
                <label><?=CONTROL_USER_NEWPASSWORDAGAIN ?></label><br>
                <input class='nc--wide' type='password' name='Password2' maxlength='32' placeholder='<?=CONTROL_USER_NEWPASSWORDAGAIN ?>' />
            </div>
            <input type='hidden' name='UserID' value='<?=$AUTH_USER_ID ?>' />
            <input type='hidden' name='phase' value='7' />
            <?=$nc_core->token->get_input() ?>
        </div>
    </form>
    <div class='nc-form-actions'>
        <button class='nc-btn nc--bordered nc--red nc--right' onclick='$nc.modal.close()' type='button'><?=CONTROL_BUTTON_CANCEL ?></button>
        <button class='nc_admin_metro_button nc-btn nc--blue nc--right' onclick='$nc("#nc_password_change form").submit()'><?=NETCAT_REMIND_SAVE_SAVE ?></button>
    </div>
</div>
<!-- /#nc_password_change -->


    <div class="middle">
        <div class="middle_left">
            <div class='title' id='tree_mode_name'>
                <?= NETCAT_TREE_SITEMAP ?>
            </div>
            <script>
                var tree_modes = {
                    'sitemap' : '<?= NETCAT_TREE_SITEMAP; ?>',
                    'classificator' : '<?= SECTION_CONTROL_CONTENT_CLASSIFICATOR; ?>',
                    'dataclass' : '<?= SECTION_INDEX_DEV_CLASSES . ' v4'; ?>',
                    'dataclass_fs' : '<?= SECTION_INDEX_DEV_CLASSES; ?>',
                    'systemclass' : '<?= SECTION_SECTIONS_OPTIONS_SYSTEM . ' v4'; ?>',
                    'systemclass_fs' : '<?= SECTION_SECTIONS_OPTIONS_SYSTEM; ?>',
                    'template' : '<?= SECTION_INDEX_DEV_TEMPLATES . ' v4'; ?>',
                    'template_fs' : '<?= SECTION_INDEX_DEV_TEMPLATES; ?>',
                    'widgetclass' : '<?= SECTION_INDEX_DEV_WIDGET . ' v4'; ?>',
                    'widgetclass_fs' : '<?= SECTION_INDEX_DEV_WIDGET; ?>',
                    'modules' : '<?= NETCAT_TREE_MODULES; ?>',
                    'users' : '<?= NETCAT_TREE_USERS; ?>',
                    'redirect' : '<?= TOOLS_REDIRECT; ?>'
                }
            </script>
            <div class="menu_left_opacity"></div>
            <iframe name='treeIframe' id='treeIframe' width="100%" height="100%" frameborder="0" allowtransparency="true" title="<?= NETCAT_TREE_SITEMAP ?>"></iframe>
        </div>
        <div class="middle_right">
            <div class="wrap">
                <div class="wrap_block">
                    <div class="middle_border"></div>
                    <div class="wrap_block_2">
                        <div class="menu_right_opacity"></div>
                        <div class="header_block">
                            <span id='mainViewHeader'></span>

                            <div class="slider_block slider_block_1" id="tabs" style="display: none;">
                                <div class="left_gradient"><div class="gradient"></div></div>
                                <div class="right_gradient"><div class="gradient"></div></div>
                                <a href="#" onclick="return false;" class="arrow left_arrow"></a><a href="#" onclick="return false;" class="arrow right_arrow"></a>
                                <div class="overflow">
                                    <div class="slide">
                                        <ul id='mainViewTabs'></ul>
                                        <ul id='mainViewTabsTray'></ul>
                                    </div>
                                </div>
                            </div>

                            <div class="slider_block slider_block_2" id="sub_tabs" style="display: none;">
                                <div class="left_gradient"><div class="gradient"></div></div>
                                <div class="right_gradient"><div class="gradient"></div></div>
                                <a href="#" onclick="return false;" class="arrow left_arrow"></a><a href="#" onclick="return false;" class="arrow right_arrow"></a>
                                <div class="overflow">
                                    <div class="slide">
                                        <div class='toolbar'>
                                            <ul id='mainViewToolbar'></ul>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="content_block">
                            <div id='mainViewContent'>
                                <iframe id='mainViewIframe' name='mainViewIframe' style='width:100%; height:100%;' frameborder='0'></iframe>
                            </div>
                        </div>


                        <div class="clear clear_footer"></div>
                    </div>
                </div>
            </div>
            <div class="nc_footer">
                <div class='main_view_buttons' id='mainViewButtons'></div>
            </div>
        </div>
    </div>
</body>
</html>