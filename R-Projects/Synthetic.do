*Install plottig graph scheme used below
ssc install blindschemes

*Install synth and synth_runner if they're not already installed (uncomment these to install)
* ssc install synth, all 
* cap ado uninstall synth_runner //in-case already installed
* net install synth_runner, from(https://raw.github.com/bquistorff/synth_runner/master/) replace

*Import Dataset 
sysuse synth_smoking.dta, clear 

*Need to set the data as time series, using tsset 
tsset state year 


synth cigsale beer lnincome retprice age15to24 cigsale(1988) ///
  cigsale(1980) cigsale(1975), trunit(3) trperiod(1989) fig ///
  nested keep(synth_results_data.dta) replace 	

/*Keeping the synth_results_data.dta stores a dataset of all the time series values of cigsale for each 
  year for California (observed) and synthetic California (constructed using a weighted average of
  observed data from donor states). We can then import this dataset to create a synth plot whose 
  attributes we can control. */
use synth_results_data.dta, clear 
drop _Co_Number _W_Weight // Drops the columns of the data that store the donor state weights
twoway line (_Y_treated _Y_synthetic _time), scheme(plottig) xline(1989) ///
  xtitle(Year) ytitle(Cigarette Sales) legend(pos(6) rows(1))

** Run the analysis using synth_runner
*Import Dataset 
sysuse synth_smoking.dta, clear 

*Need to set the data as time series, using tsset 
tsset state year 

*Estimate Synthetic Control using synth_runner
synth_runner cigsale beer(1984(1)1988) lnincome(1972(1)1988) retprice age15to24 cigsale(1988) cigsale(1980) ///
  cigsale(1975), trunit(3) trperiod(1989) gen_vars
  

  effect_graphs, trlinediff(-1) effect_gname(cigsale1_effect) tc_gname(cigsale1_tc) ///
	effect_options(scheme(plottig)) tc_options(scheme(plottig))
  
/*Graph the outcome paths of all units and (if there is only one treated unit) 
	a second graph that shows prediction differences for all units
*/
single_treatment_graphs, trlinediff(-1) raw_gname(cigsale1_raw) ///
	effects_gname(cigsale1_effects) effects_ylabels(-30(10)30) ///
	effects_ymax(35) effects_ymin(-35)
