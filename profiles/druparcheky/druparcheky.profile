<?php
/**
 * @file
 * Enables modules and site configuration for a standard site installation.
 */

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function druparcheky_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  $form['site_information']['site_mail']['#default_value'] = "test@test.test";
  $form['admin_account']['account']['name']['#default_value'] = "admin";
  $form['admin_account']['account']['mail']['#default_value'] = "admin@admin.admin";
  $form['server_settings']['site_default_country']['#default_value'] = "ES";



}


// /**
//  * Implement hook_install_tasks().
//  */
// function druparcheky_install_tasks($install_state) {
//   // Determine whether translation import tasks will need to be performed.
//   $needs_translations = count($install_state['locales']) > 1 && !empty($install_state['parameters']['locale']) && $install_state['parameters']['locale'] != 'en';

//   return array(
//     'druparcheky_import_translation' => array(
//       'display_name' => st('Set up translations'),
//       'display' => $needs_translations,
//       'run' => $needs_translations ? INSTALL_TASK_RUN_IF_NOT_COMPLETED : INSTALL_TASK_SKIP,
//       'type' => 'batch',
//     ),
//   );
// }

// /**
//  * Implement hook_install_tasks_alter().
//  *
//  * Perform actions to set up the site for this profile.
//  */
// function druparcheky_install_tasks_alter(&$tasks, $install_state) {
//   // Remove core steps for translation imports.
//   unset($tasks['install_import_locales']);
//   unset($tasks['install_import_locales_remaining']);
// }

// *
//  * Installation step callback.
//  *
//  * @param $install_state
//  *   An array of information about the current installation state.

//  function druparcheky_import_translation(&$install_state) {
//    // Enable installation language as default site language.
//    include_once DRUPAL_ROOT . '/includes/locale.inc';
//    $install_locale = $install_state['parameters']['locale'];
//    locale_add_language($install_locale, NULL, NULL, NULL, '', NULL, 1, TRUE);

//    // Fetch and batch the translations!
//    module_load_include('fetch.inc', 'l10n_update');
//    $options = _l10n_update_default_update_options();
//    $last_checked = variable_get('l10n_update_last_check');
//    if ($last_checked < REQUEST_TIME - L10N_UPDATE_STATUS_TTL) {
//      l10n_update_clear_status();
//      $batch = l10n_update_batch_update_build(array(), array($install_locale), $options);
//    }
//    else {
//      $batch = l10n_update_batch_fetch_build(array(), array($install_locale), $options);
//    }
//    return $batch;
//  }
