package com.curso.api.authorization.server.mapper;

import com.curso.api.authorization.server.persistence.entity.security.ClientApp;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.settings.ClientSettings;
import org.springframework.security.oauth2.server.authorization.settings.TokenSettings;

import java.time.Duration;
import java.util.Date;
import java.util.stream.Collectors;

public class ClientAppMapper {
    public static RegisteredClient toRegisteredClient(ClientApp clientApp){
        RegisteredClient client = RegisteredClient.withId(clientApp.getClientId())
                .clientId(clientApp.getClientId())
                .clientSecret(clientApp.getClientSecret())
                .clientIdIssuedAt(new Date(System.currentTimeMillis()).toInstant())
                .clientAuthenticationMethods(clientAuthMethods -> {
                    clientApp.getClientAuthenticationMethods().stream()
                            .map(ClientAuthenticationMethod::new)
                            .forEach(clientAuthMethods::add);

                })
                .authorizationGrantTypes(authGrantTypes -> {
                    clientApp.getAuthorizationGrantTypes().stream()
                            .map(AuthorizationGrantType::new)
                            .forEach(authGrantTypes::add);
                })
                .redirectUris(redirectUris -> clientApp.getRedirectUris().stream().forEach(redirectUris::add))
                .scopes(scope -> clientApp.getScopes().stream().forEach(scope::add))
                .tokenSettings(TokenSettings.builder()
                        .accessTokenTimeToLive(Duration.ofMinutes(clientApp.getDurationInMinutes()))
                        .refreshTokenTimeToLive(Duration.ofMinutes(clientApp.getDurationInMinutes()* 4L))
                        .build())
                .clientSettings(ClientSettings.builder()
                        .requireProofKey(clientApp.isRequiredProofKey()).build())
                .build();
        return client;
    }
}
