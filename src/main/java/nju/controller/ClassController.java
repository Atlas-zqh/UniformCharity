package nju.controller;

import nju.domain.CreditStatistic;
import nju.domain.User;
import nju.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by island on 2017/8/16.
 */
@Controller
@RequestMapping("/classAction")
public class ClassController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/briefClassCredits", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getBriefClassCredits(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();

        String username = request.getParameter("username");
        try {
            User user = userService.findUserByUsername(username);

            String school = user.getSchool();
            String sgrade = user.getSgrade();
            String sclass = user.getSclass();
            CreditStatistic creditStatistics = userService.getAllCreditsByGradeAndClass(school, sgrade, sclass);
            List<CreditStatistic> creditStatisticList = userService.getAllClassCreditsSumByGrade(school, sgrade);
            int rank = 0;
            for (int i = 0; i < creditStatisticList.size(); i++) {
                if (creditStatisticList.get(i).getSclass().equals(sclass)) {
                    rank = i + 1;
                }
            }

            map.put("success", "true");
            map.put("rank", rank);
            map.put("score", creditStatistics.getCredits());
        } catch (Exception e) {
            map.put("success", "false");
        }
        return map;
    }

    @RequestMapping(value = "/briefGradeCredits", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getBriefGlassCredits(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        String username = request.getParameter("username");
        try {
            User user = userService.findUserByUsername(username);
            String school = user.getSchool();
            String sgrade = user.getSgrade();
            CreditStatistic creditStatistics = userService.getAllCreditsByGrade(school, sgrade);
            List<CreditStatistic> creditStatisticList = userService.getAllClassCreditsSumBySchool(school);
            int rank = 0;
            for (int i = 0; i < creditStatisticList.size(); i++) {
                if (creditStatisticList.get(i).getSgrade().equals(sgrade)) {
                    rank = i + 1;
                }
            }

            map.put("success", "true");
            map.put("rank", rank);
            map.put("score", creditStatistics.getCredits());
        } catch (Exception e) {
            map.put("success", "false");
        }
        return map;
    }

    @RequestMapping(value = "/classCredits", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getClassCredits(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();

        String username = request.getParameter("username");
        try {
            User user = userService.findUserByUsername(username);

            String school = user.getSchool();
            String sgrade = user.getSgrade();
            String sclass = user.getSclass();
            List<User> userList = userService.findUserByClass(school, sgrade, sclass);

            map.put("success", "true");
            map.put("user", userList);
        } catch (Exception e) {
            map.put("success", "false");
        }
        return map;
    }

    @RequestMapping(value = "/gradeCredits", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getGradeCredits(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();

        String username = request.getParameter("username");
        try {
            User user = userService.findUserByUsername(username);

            String school = user.getSchool();
            String sgrade = user.getSgrade();
            List<CreditStatistic> creditStatisticList = userService.getAllGradeCreditsSum(school);
            double sum = 0;
            for(int i = 0; i < creditStatisticList.size(); i++){
                sum += creditStatisticList.get(i).getCredits();
            }
            map.put("success", "true");
            map.put("credits", creditStatisticList);
            map.put("sum", sum);
        } catch (Exception e) {
            map.put("success", "false");
        }
        return map;
    }
}
