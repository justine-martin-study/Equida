package com.equida.api.controller.races_chevaux;

import com.equida.api.dto.RaceChevalDto;
import com.equida.api.dto.filter.BasicFilterDto;
import com.equida.api.route.races_chevaux.RacesChevauxApiRoute;
import com.equida.bdd.entity.RaceCheval;
import com.equida.service.RaceChevalService;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RacesChevauxRestController {
	
	@Autowired
	private RaceChevalService raceChevalService;
	
	@GetMapping(RacesChevauxApiRoute.RAW_URI)
	public List<RaceChevalDto> getRacesChevaux(@Valid BasicFilterDto filterDto) {
		List<RaceCheval> racesChevaux = raceChevalService.getAll(filterDto.getPageRequest());
		
		List<RaceChevalDto> racesChevauxDto = new ArrayList<>();
		
		for(RaceCheval rc : racesChevaux) {			
			racesChevauxDto.add(RaceChevalDto.convertToDto(rc));
		}
		
		return racesChevauxDto;
	}

}
