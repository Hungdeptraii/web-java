package com.nhl.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhl.model.User;
import com.nhl.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String loginPage() {
        return "web/auth/login";
    }

    @PostMapping("/login")
    public String doLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam(value = "remember", required = false) String remember,
            HttpSession session
    ) {
        User user = userRepository.findByEmail(email);

        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            session.setAttribute("user", user);
            if (user.getLevel() == 3) {
                return "redirect:/admin";
            } else {
                return "redirect:/";
            }
        }

        session.setAttribute("notice", "Sai tài khoản hoặc mật khẩu");
        session.setAttribute("status", "danger");
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "web/auth/register";
    }

    @PostMapping("/register")
    public String doRegister(
            @RequestParam("fullname") String fullname,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpSession session
    ) {
        if (!password.equals(confirmPassword)) {
            session.setAttribute("error", "Mật khẩu xác nhận không khớp");
            return "redirect:/register";
        }
        User existing = userRepository.findByEmail(email);
        if (existing != null) {
            session.setAttribute("error", "Email đã tồn tại");
            return "redirect:/register";
        }
        User existingPhone = userRepository.findByPhone(phone);
        if (existingPhone != null) {
            session.setAttribute("error", "Số điện thoại đã tồn tại");
            return "redirect:/register";
        }
        User user = new User();
        user.setFullname(fullname);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(org.springframework.security.crypto.bcrypt.BCrypt.hashpw(password, org.springframework.security.crypto.bcrypt.BCrypt.gensalt()));
        user.setLevel(2); // 2: user
        userRepository.save(user);
        session.setAttribute("success", "Đăng ký thành công. Vui lòng đăng nhập.");
        return "redirect:/login";
    }
}
