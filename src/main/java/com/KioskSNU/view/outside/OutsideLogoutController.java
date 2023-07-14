package com.KioskSNU.view.outside;

import com.KioskSNU.snu.dto.UsageRoomDTO;
import com.KioskSNU.snu.dto.UsageSeatDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Controller
public class OutsideLogoutController {
    private final Map<Integer, UsageSeatDTO> seatMap;
    private final Map<Integer, UsageRoomDTO> roomMap;

    @Autowired
    public OutsideLogoutController(
            ConcurrentHashMap<Integer, UsageSeatDTO> seatMap,
            ConcurrentHashMap<Integer, UsageRoomDTO> roomMap
    ) {
        this.seatMap = seatMap;
        this.roomMap = roomMap;
    }

    @RequestMapping("/outside/logout")
    public ModelAndView process(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/outside");

        String selectType = (String) session.getAttribute("selectType");
        if (selectType != null) {
            int selectNumber = (int) session.getAttribute("selectNumber");
            switch (selectType) {
                case "seat":
                    seatMap.remove(selectNumber);
                    break;
                case "room":
                    roomMap.remove(selectNumber);
                    break;
            }
            session.removeAttribute("selectType");
            session.removeAttribute("selectNumber");
        }
        session.removeAttribute("author");

        return mav;
    }
}
