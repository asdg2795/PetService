package com.multi.myapp.controller;

import com.sun.tools.jconsole.JConsoleContext;  
import com.multi.myapp.dto.TradeDetailResponseDto;
import com.multi.myapp.dto.TradeForm;
import com.multi.myapp.dto.TradeResponseDto;
import com.multi.myapp.dto.TradeUpdateDto;
import com.multi.myapp.service.ImageService;
import com.multi.myapp.service.SignService;
import com.multi.myapp.service.TradeService;
import com.multi.myapp.utils.FileUtils;
import com.multi.myapp.vo.ImageVO;
import com.multi.myapp.vo.TradeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.awt.*;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class TradeController {

    @Autowired
    TradeService tradeService;
    @Autowired
    ImageService imageService;

    @Autowired
    FileUtils fileUtils;


    @GetMapping("/trade/add")
    public String addForm(HttpSession session) {
        if (session.getAttribute("logStatus") != "Y") {
            return "sign/login";
        }

        return "trade/tradeForm";
    }


    @PostMapping("/trade/add")
    public String saveTrade(TradeForm tradeForm, HttpSession session, RedirectAttributes redirectAttributes) {

        if (session.getAttribute("logStatus") != "Y") {
            return "sign/login";
        }

        String logId = (String) session.getAttribute("logId");
        String logName = (String) session.getAttribute("logName");

        tradeForm.setUserId(logId);
        tradeForm.setUsername(logName);

        int no = tradeService.save(tradeForm);
        List<ImageVO> images = fileUtils.uploadFiles(tradeForm.getFiles());

        if (images.isEmpty()) {
            ImageVO image = ImageVO.builder()
                    .uploadfilename("no-image.jpg")
                    .storefilename("no-image.jpg")
                    .tradeid(no)
                    .build();
            images.add(image);
        }


        imageService.saveAll(no, images);
        return "redirect:/trade";
    }

    @GetMapping("/trade")
    public ModelAndView trades(String tradeTitle) {
        ModelAndView mav = new ModelAndView();
        List<TradeResponseDto> trades = tradeService.findAll(tradeTitle);
        mav.addObject("trades",trades);
        mav.setViewName("trade/trade");
        return mav;
    }

    @GetMapping("/trade/{no}")
    public String tradeDetail(@PathVariable int no, Model model, HttpSession session) {
        TradeDetailResponseDto trade = tradeService.findById(no);
        String userid = trade.getUserid();
        String logId = (String) session.getAttribute("logId");
        model.addAttribute("trade", trade);
        if (session.getAttribute("logStatus") != "Y" || !userid.equals(logId)) {
            return "trade/tradeDetail";
        }

        return "trade/myTradeDetail";
    }

    @ResponseBody
    @DeleteMapping("/trade/{no}")
    public String deleteTrade(@PathVariable int no, HttpSession session) {
        if (session.getAttribute("logStatus") != "Y") {
            return "sign/login";
        }
        String logId = (String) session.getAttribute("logId");
        TradeDetailResponseDto trade = tradeService.findById(no);
        String userid = trade.getUserid();
        if (!logId.equals(userid)) {
            return "/trade";
        }
        tradeService.delete(no);
        return "redirect:/trade";
    }

    @GetMapping("/trade/{no}/edit")
    public String editTradeForm(@PathVariable int no, Model model, HttpSession session) {
        if (session.getAttribute("logStatus") != "Y") {
            return "sign/login";
        }

        String logId = (String) session.getAttribute("logId");
        TradeDetailResponseDto trade = tradeService.findById(no);
        String userid = trade.getUserid();
        if (!logId.equals(userid)) {
            return "/trade";
        }
        model.addAttribute("trade", trade);
        return "/trade/tradeEdit";
    }

    @PostMapping("/trade/{no}/edit")
    public String editTrade(@PathVariable int no, HttpSession session, TradeUpdateDto tradeUpdateDto) {
        if (session.getAttribute("logStatus") != "Y") {
            return "sign/login";
        }

        String logId = (String) session.getAttribute("logId");
        TradeDetailResponseDto trade = tradeService.findById(no);
        String userid = trade.getUserid();

        if (!logId.equals(userid)) {
            return "/trade";
        }

        List<ImageVO> images = fileUtils.uploadFiles(tradeUpdateDto.getFiles());

        if (!images.isEmpty()) {
            imageService.delete(no);
            imageService.saveAll(no, images);
        }
        tradeService.update(no, tradeUpdateDto);

        return "redirect:/trade";
    }

    @ResponseBody
    @PostMapping("/trade/{no}/updateStatus")
    public String updateStatus(@PathVariable int no, HttpSession session) {
        if (session.getAttribute("logStatus") != "Y") {
            return "sign/login";
        }
        String logId = (String) session.getAttribute("logId");
        TradeDetailResponseDto trade = tradeService.findById(no);
        String userid = trade.getUserid();
        if (!logId.equals(userid)) {
            return "/trade";
        }
        tradeService.updateStatus(no ,0);
        return "redirect:/trade";
    }

}
