package com.example.Szpital.controllers;

import com.example.Szpital.entities.Komentarze;
import com.example.Szpital.entities.Pracownicy;
import com.example.Szpital.entities.Wpisy;
import com.example.Szpital.services.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/api/forum")
public class ForumController {

    @Autowired
    private ForumService forumService;

    @Autowired
    private PageController pageController;

    @PostMapping(value = "/loadTopic")
    public String loadTopic(HttpServletRequest request, ModelMap model, @RequestParam int id) {
        Wpisy topic = forumService.getTopic(id);
        model.put("topic", topic);

        List<Komentarze> listOfComments = forumService.getTopicsComments(id);
        model.put("listOfComments", listOfComments);

        return pageController.getLoadTopicPage();
    }

    @GetMapping(value = "/comment/remove")
    public String removeComment(HttpServletRequest request, ModelMap model, @RequestParam int commentId) {
        forumService.removeComment(commentId);
        return pageController.getForumPage(request, model);
    }

    @PostMapping(value = "/comment/edit")
    public String editComment(HttpServletRequest request, ModelMap model, @RequestParam int commentId, @RequestParam String content){
        forumService.editComment(commentId, content);
        return pageController.getForumPage(request, model);
    }

    @PostMapping (value = "/comment/add")
    public String addComment(HttpServletRequest request, ModelMap model, @RequestParam int topicId, @RequestParam String content){
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        String username = currentUser.getImie() + " " + currentUser.getNazwisko();

        forumService.addComment(topicId, content, username);
        return pageController.getForumPage(request, model);
    }

    @PostMapping (value = "/topic/add")
    public String addTopic(HttpServletRequest request, ModelMap model, @RequestParam String topic, @RequestParam String content){
        Pracownicy currentUser = (Pracownicy) request.getSession().getAttribute("pracownik");
        String username = currentUser.getImie() + " " + currentUser.getNazwisko();

        forumService.addTopic(topic, content, username);
        return pageController.getForumPage(request, model);
    }

}
