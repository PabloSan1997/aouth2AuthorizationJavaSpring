insert into client_app (client_id,client_secret,duration_in_minutes,required_proof_key) values ('client','$2a$10$QHLrXJ8nlnDlOXEDUnV6iefGNOkKaW9pqJwZcpF.5HrO42PRPzjcO',10,false);
insert into client_app_authorization_grant_types (client_app_id,authorization_grant_types) values ((select id from client_app where client_id = 'client'),'authorization_code');
insert into client_app_authorization_grant_types (client_app_id,authorization_grant_types) values ((select id from client_app where client_id = 'client'),'refresh_token');
insert into client_app_authorization_grant_types (client_app_id,authorization_grant_types) values ((select id from client_app where client_id = 'client'),'client_credentials');
insert into client_app_client_authentication_methods (client_app_id,client_authentication_methods) values ((select id from client_app where client_id = 'client'),'client_secret_basic');
insert into client_app_redirect_uris (client_app_id,redirect_uris) values ((select id from client_app where client_id = 'client'),'https://oauthdebugger.com/debug');
insert into client_app_scopes (client_app_id,scopes) values ((select id from client_app where client_id = 'client'),'openid');
insert into client_app_scopes (client_app_id,scopes) values ((select id from client_app where client_id = 'client'),'READ_ALL_PRODUCTS');
insert into client_app_scopes (client_app_id,scopes) values ((select id from client_app where client_id = 'client'),'READ_ONE_PRODUCT');


insert into client_app (client_id,client_secret,duration_in_minutes,required_proof_key) values ('my-own-client','$2a$10$QHLrXJ8nlnDlOXEDUnV6iefGNOkKaW9pqJwZcpF.5HrO42PRPzjcO',10,true);
insert into client_app_authorization_grant_types (client_app_id,authorization_grant_types) values ((select id from client_app where client_id = 'my-own-client'),'authorization_code');
insert into client_app_authorization_grant_types (client_app_id,authorization_grant_types) values ((select id from client_app where client_id = 'my-own-client'),'refresh_token');
insert into client_app_authorization_grant_types (client_app_id,authorization_grant_types) values ((select id from client_app where client_id = 'my-own-client'),'client_credentials');
insert into client_app_client_authentication_methods (client_app_id,client_authentication_methods) values ((select id from client_app where client_id = 'my-own-client'),'client_secret_basic');
insert into client_app_redirect_uris (client_app_id,redirect_uris) values ((select id from client_app where client_id = 'my-own-client'),'https://oauthdebugger.com/debug');
insert into client_app_scopes (client_app_id,scopes) values ((select id from client_app where client_id = 'my-own-client'),'openid');
insert into client_app_scopes (client_app_id,scopes) values ((select id from client_app where client_id = 'my-own-client'),'ALL');





-- CREACIÓN DE MODULOS
INSERT INTO module (name, base_path) VALUES ('PRODUCT', '/products');
INSERT INTO module (name, base_path) VALUES ('CATEGORY', '/categories');
INSERT INTO module (name, base_path) VALUES ('CUSTOMER', '/customers');
INSERT INTO module (name, base_path) VALUES ('AUTH', '/auth');

-- CREACIÓN DE MÓDULO PARA RETO SECCION 11
INSERT INTO module (name, base_path) VALUES ('PERMISSION', '/permissions');


-- CREACIÓN DE OPERACIONES
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_ALL_PRODUCTS','', 'GET', false, 1);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_ONE_PRODUCT','/[0-9]*', 'GET', false, 1);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('CREATE_ONE_PRODUCT','', 'POST', false, 1);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('UPDATE_ONE_PRODUCT','/[0-9]*', 'PUT', false, 1);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('DISABLE_ONE_PRODUCT','/[0-9]*/disabled', 'PUT', false, 1);

INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_ALL_CATEGORIES','', 'GET', false, 2);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_ONE_CATEGORY','/[0-9]*', 'GET', false, 2);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('CREATE_ONE_CATEGORY','', 'POST', false, 2);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('UPDATE_ONE_CATEGORY','/[0-9]*', 'PUT', false, 2);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('DISABLE_ONE_CATEGORY','/[0-9]*/disabled', 'PUT', false, 2);

INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_ALL_CUSTOMERS','', 'GET', false, 3);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('REGISTER_ONE','', 'POST', true, 3);

INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('AUTHENTICATE','/authenticate', 'POST', true, 4);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('VALIDATE-TOKEN','/validate-token', 'GET', true, 4);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_MY_PROFILE','/profile','GET', false, 4);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('LOGOUT','/logout','POST', true, 4);

-- CREACIÓN DE OPERACIONES DE MÓDULO PARA RETO SECCION 11
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_ALL_PERMISSIONS','','GET', false, 5);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('READ_ONE_PERMISSION','/[0-9]*','GET', false, 5);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('CREATE_ONE_PERMISSION','','POST', false, 5);
INSERT INTO operation (name, path, http_method, permit_all, module_id) VALUES ('DELETE_ONE_PERMISSION','/[0-9]*','DELETE', false, 5);


-- CREACIÓN DE ROLES
INSERT INTO role (name) VALUES ('CUSTOMER');
INSERT INTO role (name) VALUES ('ASSISTANT_ADMINISTRATOR');
INSERT INTO role (name) VALUES ('ADMINISTRATOR');

-- CREACIÓN DE USUARIOS
INSERT INTO user (username, name, password, role_id) VALUES ('lmarquez', 'luis márquez', '$2a$10$ywh1O2EwghHmFIMGeHgsx.9lMw5IXpg4jafeFS.Oi6nFv0181gHli', 1);
INSERT INTO user (username, name, password, role_id) VALUES ('fperez', 'fulano pérez', '$2a$10$V29z7/qC9wpHfzRMxGOHye5RMAxCid2/MzJalk0dsiA3zZ9CJfub.', 2);
INSERT INTO user (username, name, password, role_id) VALUES ('mhernandez', 'mengano hernández', '$2a$10$TMbMuEZ8utU5iq8MOoxpmOc6QWQuYuwgx1xJF8lSMNkKP3hIrwYFG', 3);


-- CREACIÓN DE PERMISOS
INSERT INTO granted_permission (role_id, operation_id) VALUES (1, 15);

INSERT INTO granted_permission (role_id, operation_id) VALUES (2, 1);
INSERT INTO granted_permission (role_id, operation_id) VALUES (2, 2);
INSERT INTO granted_permission (role_id, operation_id) VALUES (2, 4);
INSERT INTO granted_permission (role_id, operation_id) VALUES (2, 6);
INSERT INTO granted_permission (role_id, operation_id) VALUES (2, 7);
INSERT INTO granted_permission (role_id, operation_id) VALUES (2, 9);
INSERT INTO granted_permission (role_id, operation_id) VALUES (2, 15);

INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 1);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 2);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 3);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 4);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 5);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 6);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 7);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 8);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 9);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 10);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 15);

-- CREACIÓN DE PERMISOS PARA RETO SECCION 11
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 17);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 18);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 19);
INSERT INTO granted_permission (role_id, operation_id) VALUES (3, 20);


-- CREACIÓN DE CATEGORIAS
--INSERT INTO category (name, status) VALUES ('Electrónica', 'ENABLED');
--INSERT INTO category (name, status) VALUES ('Ropa', 'ENABLED');
--INSERT INTO category (name, status) VALUES ('Deportes', 'ENABLED');
--INSERT INTO category (name, status) VALUES ('Hogar', 'ENABLED');

-- CREACIÓN DE PRODUCTOS
--INSERT INTO product (name, price, status, category_id) VALUES ('Smartphone', 500.00, 'ENABLED', 1);
--INSERT INTO product (name, price, status, category_id) VALUES ('Auriculares Bluetooth', 50.00, 'DISABLED', 1);
--INSERT INTO product (name, price, status, category_id) VALUES ('Tablet', 300.00, 'ENABLED', 1);
--
--INSERT INTO product (name, price, status, category_id) VALUES ('Camiseta', 25.00, 'ENABLED', 2);
--INSERT INTO product (name, price, status, category_id) VALUES ('Pantalones', 35.00, 'ENABLED', 2);
--INSERT INTO product (name, price, status, category_id) VALUES ('Zapatos', 45.00, 'ENABLED', 2);
--
--INSERT INTO product (name, price, status, category_id) VALUES ('Balón de Fútbol', 20.00, 'ENABLED', 3);
--INSERT INTO product (name, price, status, category_id) VALUES ('Raqueta de Tenis', 80.00, 'DISABLED', 3);
--
--INSERT INTO product (name, price, status, category_id) VALUES ('Aspiradora', 120.00, 'ENABLED', 4);
--INSERT INTO product (name, price, status, category_id) VALUES ('Licuadora', 50.00, 'ENABLED', 4);
