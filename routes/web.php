<?php
Route::get('/dms/{id}/barcode', 'Dms\DockController@barcode');
 
Route::get('/dms/login', 'Login\LoginController@show');
Route::post('/dms/login', 'Login\LoginController@login');
Route::get('/dms/logout', 'Login\LoginController@logout');

Route::get('/cms/login', 'Login\LoginController@showcms');
Route::post('/cms/login', 'Login\LoginController@logincms');
Route::get('/cms/logout', 'Login\LoginController@logoutcms');

Route::get('/', 'Dms\DockController@show');
Route::get('/cms/dashboard', 'Cms\Dashboard_cmsController@show');

Route::get('/dms/dashboard', 'Dms\DockController@show');

Route::get('/dms/input', 'Dms\DockController@input');
Route::post('/dms/input_id', 'Dms\DockController@input_id');
Route::get('/dms/all_list', 'Dms\DockController@all_list');

Route::post('/dms/input', 'Dms\DockController@insert');
Route::delete('/dms/{id}/delete', 'Dms\DockController@delete');
Route::get('/dms/{id}/edit','Dms\DockController@edit');
Route::put('/dms/{id}/edit','Dms\DockController@update');

Route::get('/test', 'Dms\DockController@testapi');
Route::get('/plat_no', 'Dms\DockController@plat_no');
Route::get('/driver_phone', 'Dms\DockController@driver_phone');

Route::delete('cms/master_plat/{id}/delete','Cms\Master_platController@delete');




// memanggil blog index
Route::get('/blog', 'BlogController@index');

// memanggil blog single
Route::get('/blog/{id}', 'BlogController@show');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


// plat ==============================================================
Route::get('/cms/master_plat', 'Cms\Master_platController@showcms');
Route::get('/cms/master_plat/input', 'Cms\Master_platController@input');
Route::get('cms/master_plat/{id}/edit','Cms\Master_platController@edit');
// call
Route::post('/cms/master_plat/input','Cms\Master_platController@insert'); 
Route::put('/cms/master_plat/{id}/edit','Cms\Master_platController@update'); 
Route::delete('cms/master_plat/{id}/delete','Cms\Master_platController@delete');

// location ==============================================================
Route::get('/cms/master_location', 'Cms\Master_locationController@showcms');
Route::get('/cms/master_location/input', 'Cms\Master_locationController@input');
Route::get('cms/master_location/{id}/edit','Cms\Master_locationController@edit');
// call
Route::post('/cms/master_location/input','Cms\Master_locationController@insert'); 
Route::put('/cms/master_location/{id}/edit','Cms\Master_locationController@update'); 
Route::delete('cms/master_location/{id}/delete','Cms\Master_locationController@delete');


// phone ==============================================================
Route::get('/cms/master_phone', 'Cms\Master_phoneController@showcms');
Route::get('/cms/master_phone/input', 'Cms\Master_phoneController@input');
Route::get('cms/master_phone/{id}/edit','Cms\Master_phoneController@edit');
// call
Route::post('/cms/master_phone/input','Cms\Master_phoneController@insert'); 
Route::put('/cms/master_phone/{id}/edit','Cms\Master_phoneController@update'); 
Route::delete('cms/master_phone/{id}/delete','Cms\Master_phoneController@delete');

// Status ==============================================================
Route::get('/cms/master_status', 'Cms\Master_statusController@showcms');
Route::get('/cms/master_status/input', 'Cms\Master_statusController@input');
Route::get('cms/master_status/{id}/edit','Cms\Master_statusController@edit');
// call
Route::post('/cms/master_status/input','Cms\Master_statusController@insert'); 
Route::put('/cms/master_status/{id}/edit','Cms\Master_statusController@update'); 
Route::delete('cms/master_status/{id}/delete','Cms\Master_statusController@delete');

// project ==============================================================
Route::get('/cms/master_project', 'Cms\Master_projectController@showcms');
Route::get('/cms/master_project/input', 'Cms\Master_projectController@input');
Route::get('cms/master_project/{id}/edit','Cms\Master_projectController@edit');
// call
Route::post('/cms/master_project/input','Cms\Master_projectController@insert'); 
Route::put('/cms/master_project/{id}/edit','Cms\Master_projectController@update'); 
Route::delete('cms/master_project/{id}/delete','Cms\Master_projectController@delete');

// tc ==============================================================
Route::get('/cms/master_tc', 'Cms\Master_tcController@showcms');
Route::get('/cms/master_tc/input', 'Cms\Master_tcController@input');
Route::get('cms/master_tc/{id}/edit','Cms\Master_tcController@edit');
// call
Route::post('/cms/master_tc/input','Cms\Master_tcController@insert'); 
Route::put('/cms/master_tc/{id}/edit','Cms\Master_tcController@update'); 
Route::delete('cms/master_tc/{id}/delete','Cms\Master_tcController@delete');

// vehicle ==============================================================
Route::get('/cms/master_vehicle', 'Cms\Master_vehicleController@showcms');
Route::get('/cms/master_vehicle/input', 'Cms\Master_vehicleController@input');
Route::get('cms/master_vehicle/{id}/edit','Cms\Master_vehicleController@edit');
// call
Route::post('/cms/master_vehicle/input','Cms\Master_vehicleController@insert'); 
Route::put('/cms/master_vehicle/{id}/edit','Cms\Master_vehicleController@update'); 
Route::delete('cms/master_vehicle/{id}/delete','Cms\Master_vehicleController@delete');

// user_group ==============================================================
Route::get('/cms/user_management', 'Cms\User_managementController@showcms');
Route::get('/cms/user_management/input', 'Cms\User_managementController@input');
Route::get('cms/user_management/{id}/edit','Cms\User_managementController@edit');
// call
Route::post('/cms/user_management/input','Cms\User_managementController@insert'); 
Route::put('/cms/user_management/{id}/edit','Cms\User_managementController@update'); 
Route::delete('cms/user_management/{id}/delete','Cms\User_managementController@delete');

// user_group_management ==============================================================
Route::get('/cms/user_group', 'Cms\User_groupController@showcms');
Route::get('/cms/user_group/input', 'Cms\User_groupController@input');
Route::get('cms/user_group/{id}/edit','Cms\User_groupController@edit');
// call
Route::post('/cms/user_group/input','Cms\User_groupController@insert'); 
Route::put('/cms/user_group/{id}/edit','Cms\User_groupController@update'); 
Route::delete('cms/user_group/{id}/delete','Cms\User_groupController@delete'); 

