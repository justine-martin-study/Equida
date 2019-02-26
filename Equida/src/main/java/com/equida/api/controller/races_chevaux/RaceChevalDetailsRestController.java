package com.equida.api.controller.races_chevaux;

import com.equida.api.dto.RaceChevalDto;
import com.equida.api.route.races_chevaux.RaceChevalDetailsApiRoute;
import com.equida.bdd.entity.RaceCheval;
import com.equida.service.RaceChevalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RaceChevalDetailsRestController {
	
	@Autowired
	private RaceChevalService chevalService;
	
	@GetMapping(RaceChevalDetailsApiRoute.RAW_URI)
	public RaceChevalDto getRaceCheval(@PathVariable(value = RaceChevalDetailsApiRoute.PARAM_ID_RACE_CHEVAL) Long idRaceCheval) {
		RaceCheval raceCheval = chevalService.getById(idRaceCheval);
		
		return RaceChevalDto.convertToDto(raceCheval);
	}

}