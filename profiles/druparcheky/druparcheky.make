; jfmaguire make file for d.o. usage
core = "7.x"
api = "2"

; +++++ Core +++++

projects[drupal][version] = "7.36"


; +++++ Modules +++++

projects[admin_views][subdir] = ""
projects[admin_menu][subdir] = ""
projects[adminimal_admin_menu][subdir] = ""
projects[coffee][subdir] = ""
projects[filter_perms][subdir] = ""
projects[module_filter][subdir] = ""
projects[ctools][subdir] = ""
projects[image_resize_filter][subdir] = ""
projects[imce][subdir] = ""
projects[l10n_update] = 1.1
projects[l10n_client] = 1.3
projects[backup_migrate][subdir] = ""
projects[better_formats][subdir] = ""
projects[entity][subdir] = ""
projects[environment_indicator][subdir] = ""
projects[libraries][subdir] = ""
projects[masquerade][subdir] = ""
projects[pathauto][subdir] = ""
projects[token][subdir] = ""
projects[transliteration][subdir] = ""
projects[ckeditor][subdir] = ""
projects[variable][subdir] = ""
projects[views][subdir] = ""
projects[views_bulk_operations][subdir] = ""
projects[advanced_help][subdir] = ""



; +++++ Themes +++++

; adminimal_theme
projects[adminimal_theme][type] = "theme"
projects[adminimal_theme][version]

; zen_theme
projects[zen][type] = "theme"
projects[zen][version]


; +++++ Libraries +++++

; CKEditor
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][type] = "library"
libraries[ckeditor][destination] = "libraries"
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.4.7/ckeditor_4.4.7_full.zip"

