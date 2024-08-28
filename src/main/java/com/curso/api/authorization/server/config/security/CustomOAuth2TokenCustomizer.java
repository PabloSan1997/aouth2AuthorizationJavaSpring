package com.curso.api.authorization.server.config.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.server.authorization.token.JwtEncodingContext;
import org.springframework.security.oauth2.server.authorization.token.OAuth2TokenCustomizer;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class CustomOAuth2TokenCustomizer implements OAuth2TokenCustomizer<JwtEncodingContext> {

    @Override
    public void customize(JwtEncodingContext context) {
        Authentication authentication = context.getPrincipal();//username

        String tokenType = context.getTokenType().getValue();
        if(tokenType.equals("access_token")){
            List<String> authrities = authentication.getAuthorities().stream()
                            .map(GrantedAuthority::getAuthority).toList();
            context.getClaims().claim("permissions", authrities);
        }
    }
}
