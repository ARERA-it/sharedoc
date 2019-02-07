# README

## Impostazioni necessarie

Per utilizzare correttamente l'app è necessario configurare tramite variabili d'ambiente
una manciata di variabili:
- `host`, ad es.: 'acme.sharepoint.com'
- `base_path`, ad es. 'sites/Testing_something'
- `username`, ad es.: 'olaf@email.me'
- `password`
- `base_folder`, ad es. 'sites/Testing_something/Documents'


# Uso

``ruby
so = SpecificObjective.find 8

documents = so.documents
doc = documents.first

sp_file = doc.sharepoint_file
``

Lista degli attributi di `sp_file`:
``
:author,
:checked_out_by_user,
:effective_information_rights_management_settings,
:information_rights_management_settings,
:list_item_all_fields,
:locked_by_user,
:modified_by,
:properties,
:version_events,
:versions,
:check_in_comment,
:check_out_type,
:content_tag,
:customized_page_status,
:e_tag,
:exists,
:irm_enabled,
:length,
:level,
:linking_uri,
:linking_url,
:major_version,
:minor_version,
:name,
:server_relative_url,
:time_created,
:time_last_modified,
:title,
:ui_version,
:ui_version_label,
:unique_id
``


E' possibile modificare lo 'stato' di un documento mediante le seguenti funzioni:
- `checkout`
- `checkin`
- `publish`
