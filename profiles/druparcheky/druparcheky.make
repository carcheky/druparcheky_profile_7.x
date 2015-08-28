; jfmaguire make file for d.o. usage
core = "7.x"
api = "2"

; +++++ Core +++++

projects[] = "drupal"

; +++++ Modules +++++

projects[] = "views_bulk_operations"
projects[] = "admin_menu"
projects[] = "admin_views"
projects[] = "adminimal_admin_menu"
projects[] = "advanced_help"
projects[] = "backup_migrate"
projects[] = "better_formats"
projects[] = "ctools"
projects[] = "ckeditor"
projects[] = "coffee"
projects[] = "entity"
projects[] = "environment_indicator"
projects[] = "email_registration"
projects[] = "field_permissions"
projects[] = "filter_perms"
projects[] = "imce"
projects[l10n_update] = 1.1
projects[l10n_client] = 1.3
projects[] = "libraries"
projects[] = "masquerade"
projects[] = "module_filter"
projects[] = "pathauto"
projects[] = "token"
projects[] = "transliteration"
projects[] = "views"


; +++++ Themes +++++

projects[] = "adaptivetheme"
projects[] = "adminimal_theme"
projects[] = "zen"


; +++++ Libraries +++++

; CKEditor
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.4.7/ckeditor_4.4.7_full.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][type] = "library"
