package com.example.Szpital.services;

import com.example.Szpital.entities.Komentarze;
import com.example.Szpital.entities.Wpisy;
import com.example.Szpital.repositories.IKomentarzeRepository;
import com.example.Szpital.repositories.IWpisyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForumService {

    @Autowired
    private IWpisyRepository iWpisyRepository;

    @Autowired
    private IKomentarzeRepository iKomentarzeRepository;

    public List<Wpisy> getAllTopics() {
        return iWpisyRepository.findAll();
    }

    public Wpisy getTopic(int id) {
        return iWpisyRepository.getById(id);
    }

    public List<Komentarze> getTopicsComments(int topicId) {
        return iKomentarzeRepository.findAllByIdWpis(topicId);
    }

    public void removeComment(int commentId) {
        Komentarze comment = iKomentarzeRepository.findById(commentId).orElse(null);
        if (comment != null) {
            iKomentarzeRepository.delete(comment);
        }
    }

    public void editComment(int commentId, String content) {
        Komentarze comment = iKomentarzeRepository.findById(commentId).orElse(null);
        if (comment != null) {
            comment.setTrescKomentarza(content);
            iKomentarzeRepository.save(comment);
        }
    }

    public void addComment(int topicId, String content, String username) {
        Komentarze comment = new Komentarze(username, content, topicId);
        iKomentarzeRepository.save(comment);
    }

    public void addTopic(String topic, String content, String username) {
        Wpisy entry = new Wpisy(username, topic, content);
        iWpisyRepository.save(entry);
    }
}
