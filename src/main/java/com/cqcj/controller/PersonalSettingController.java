package com.cqcj.controller;

import com.cqcj.entity.User;
import com.cqcj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;


@Controller
public class PersonalSettingController {

    @Autowired
    private UserService userService;

    @RequestMapping("/updatePersonal")
    public String UpdatePersonal(Model model, HttpSession session, @RequestParam("password") String password, @RequestParam("email") String email, @RequestParam("imgPath") MultipartFile imgPath, HttpServletRequest request) throws IOException {
        String originalFilename =imgPath.getOriginalFilename();
        String image =  "/static/img/faces/"+imgPath.getOriginalFilename();
        imgPath.transferTo(new File("G:\\IntelliJ IDEA\\data\\SSM\\web\\static\\img\\faces\\"+originalFilename));
        User user= (User) session.getAttribute("user");
        String code = user.getCode();
        userService.updatePersonal(code,password,email,image);
        user.setCode(code);
        user.setPwd(password);
        user.setEmail(email);
        user.setImgPath(image);
        model.addAttribute("user",user);
        return "PersonalSettingsPage";
    }
}
