; druparcheky make file for d.o. usage
core = "7.x"
api = "2"

; +++++ Core +++++

projects[] = "drupal"

; +++++ Modules +++++

projects[] = "admin_menu"
projects[] = "admin_views"
projects[] = "adminimal_admin_menu"
projects[] = "advanced_help"
projects[] = "backup_migrate"
projects[] = "better_formats"
projects[] = "ctools"
projects[] = "ckeditor"
projects[] = "coffee"
projects[] = "devel"
projects[] = "disable_term_node_listings"
projects[] = "entity"
projects[] = "environment_indicator"
projects[] = "fast_404"
projects[] = "field_group"
projects[] = "field_permissions"
projects[] = "filter_perms"
projects[] = "imageapi_optimize"
projects[] = "imce"
projects[] = "i18n"
projects[] = "l10n_update"
projects[] = "l10n_client"
projects[] = "libraries"
projects[] = "logintoboggan"
projects[] = "masquerade"
projects[] = "module_filter"
projects[] = "paragraphs"
projects[] = "pathauto"
projects[] = "picture"
projects[] = "token"
projects[] = "transliteration"
projects[] = "views"
projects[] = "views_bulk_operations"
projects[] = "views_litepager"

; +++++ Themes +++++

projects[] = "adaptivetheme"
projects[] = "adminimal_theme"


; +++++ Libraries +++++

; CKEditor
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.5.11/ckeditor_4.5.11_full.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][type] = "library"
