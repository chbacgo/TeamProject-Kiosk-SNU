package com.KioskSNU.view.admin;

import com.KioskSNU.interceptor.AdminLoginRequired;
import com.KioskSNU.snu.dto.NoticeDTO;
import com.KioskSNU.snu.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class AdminNoticeDeleteController {
    private final NoticeService noticeService;

    @Autowired
    public AdminNoticeDeleteController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @RequestMapping("/ajax/deleteNotification")
    @AdminLoginRequired
    public ResponseEntity<Map<String, String>> deleteNotice(@RequestBody Map<String,String> map){

        int id = Integer.parseInt(map.get("noticeId"));

        NoticeDTO noticeDTO = noticeService.getById(id);

        if(noticeDTO!=null){
            noticeService.delete(noticeDTO);
        }
        return ResponseEntity.ok(Map.of("result","success"));
    }

}
