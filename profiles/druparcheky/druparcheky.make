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
projects[] = "breakpoints"
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
projects[] = "fpa"
projects[] = "imageapi_optimize"
projects[] = "imce"
projects[] = "imce_filefield"
projects[] = "imce_mkdir"
projects[] = "l10n_update"
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
projects[] = "radix"
projects[] = "zen"
projects[] = "adminimal_theme"


; +++++ Libraries +++++

; CKEditor
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.6.2/ckeditor_4.6.2_full.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][type] = "library"
