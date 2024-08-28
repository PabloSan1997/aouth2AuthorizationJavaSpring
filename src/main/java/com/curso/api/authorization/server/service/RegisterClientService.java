package com.curso.api.authorization.server.service;

import com.curso.api.authorization.server.exception.ObjectNotFoundException;
import com.curso.api.authorization.server.mapper.ClientAppMapper;
import com.curso.api.authorization.server.persistence.entity.security.ClientApp;
import com.curso.api.authorization.server.persistence.repository.security.ClientAppRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;
import org.springframework.stereotype.Service;

@Service
public class RegisterClientService implements RegisteredClientRepository {
    @Autowired
    private ClientAppRepository clientAppRepository;
    @Override
    public void save(RegisteredClient registeredClient) {

    }

    @Override
    public RegisteredClient findById(String id) {
       ClientApp clientApp = clientAppRepository.findByClientId(id).orElseThrow(()->{
            throw new ObjectNotFoundException("Client not found");
        });
        return ClientAppMapper.toRegisteredClient(clientApp);
    }

    @Override
    public RegisteredClient findByClientId(String clientId) {
        return this.findById(clientId);
    }
}
