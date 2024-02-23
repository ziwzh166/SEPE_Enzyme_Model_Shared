function i = CalI_livelink(x)
x = num2str(x);
Dis = [x '[um]'];
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('/home/zhao/Downloads/Summary_Pack_new/Catalase/Catalase model/ClassCalculation');

model.label('CatalaseArticle_ksd.mph');

model.param.set('atip', ['1.8 [' native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm]']);
model.param.set('d', ['500 [' native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm]']);
model.param.set('f', 'F/R/T');
model.param.set('F', '96500 [C/mol]');
model.param.set('R', '8.314 [J/mol/K]');
model.param.set('T', '293 [K]');
model.param.set('Etip', '-0.4[V]');
model.param.set('EO2', '0.2 [V]');
model.param.set('O20', '0[mmol/L]');
model.param.set('ksc', '0.015 [cm/s]');
model.param.set('ksd', '1E12 [cm*L/(s*mol)]');
model.param.set('al', '0.5');
model.param.set('Sub0', '10 [mmol/L]');
model.param.set('x', Dis);
model.param.set('re', '5.22 [nm]');

model.component.create('comp1', false);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').curvedInterior(false);

model.result.table.create('tbl1', 'Table');

model.component('comp1').geom('geom1').axisymmetric(true);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);
model.component('comp1').geom('geom1').repairTol(1.0E-5);
model.component('comp1').geom('geom1').repairTolType('auto');
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('pos', [0 450]);
model.component('comp1').geom('geom1').feature('r1').set('size', [25 100]);
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'0' 'd'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'10*atip' '1000-d'});
model.component('comp1').geom('geom1').create('co1', 'Compose');
model.component('comp1').geom('geom1').feature('co1').set('repairtoltype', 'relative');
model.component('comp1').geom('geom1').feature('co1').set('repairtol', 1.0E-6);
model.component('comp1').geom('geom1').feature('co1').set('formula', 'r1-r2');
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('pos', {'0' 'd-14'});
model.component('comp1').geom('geom1').feature('r3').set('size', {'atip' '14'});
model.component('comp1').geom('geom1').create('c1', 'Circle');
model.component('comp1').geom('geom1').feature('c1').set('selresult', true);
model.component('comp1').geom('geom1').feature('c1').set('selresultshow', 'bnd');
model.component('comp1').geom('geom1').feature('c1').set('pos', {'0' 'd-re-x'});
model.component('comp1').geom('geom1').feature('c1').set('rot', 270);
model.component('comp1').geom('geom1').feature('c1').set('r', 0.00522);
model.component('comp1').geom('geom1').feature('c1').set('angle', 180);
model.component('comp1').geom('geom1').create('c2', 'Circle');
model.component('comp1').geom('geom1').feature('c2').set('selresult', true);
model.component('comp1').geom('geom1').feature('c2').set('selresultshow', 'bnd');
model.component('comp1').geom('geom1').feature('c2').set('pos', {'0' 'd-re-x'});
model.component('comp1').geom('geom1').feature('c2').set('rot', 60);
model.component('comp1').geom('geom1').feature('c2').set('r', 0.00522);
model.component('comp1').geom('geom1').feature('c2').set('angle', 32);
model.component('comp1').geom('geom1').run;

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').geom('geom1', 1);
model.component('comp1').selection('sel1').set([1 3 5 6 7 8]);
model.component('comp1').selection.create('int1', 'Intersection');
model.component('comp1').selection('int1').set('entitydim', 1);
model.component('comp1').selection.create('dif1', 'Difference');
model.component('comp1').selection('dif1').set('entitydim', 1);
model.component('comp1').selection('sel1').set('groupcontang', true);
model.component('comp1').selection('int1').set('input', {'geom1_c1_bnd' 'geom1_c2_bnd'});
model.component('comp1').selection('dif1').set('add', {'int1'});
model.component('comp1').selection('dif1').set('subtract', {'sel1'});

model.component('comp1').physics.create('tds', 'DilutedSpecies', 'geom1');
model.component('comp1').physics('tds').field('concentration').field('O2');
model.component('comp1').physics('tds').field('concentration').component({'O2' 'Sub' 'prod'});
model.component('comp1').physics('tds').selection.set([1 2]);
model.component('comp1').physics('tds').create('fl1', 'Fluxes', 1);
model.component('comp1').physics('tds').feature('fl1').selection.set([9]);
model.component('comp1').physics('tds').create('fl2', 'Fluxes', 1);
model.component('comp1').physics('tds').feature('fl2').selection.set([16]);

model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
model.component('comp1').mesh('mesh1').feature('ftri1').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftri1').create('size2', 'Size');
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').selection.set([2]);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size2').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size2').selection.set([1]);

model.result.table('tbl1').comments('Line Integration 1');

model.thermodynamics.label('Thermodynamics Package');
% 
% model.component('comp1').view('view1').axis.set('xmin', -1.9606950283050537);
% model.component('comp1').view('view1').axis.set('xmax', 40.190311431884766);
% model.component('comp1').view('view1').axis.set('ymin', 478.3402099609375);
% model.component('comp1').view('view1').axis.set('ymax', 524.7464599609375);

model.component('comp1').physics('tds').prop('MassConsistentStabilization').set('glim_mass', '(0.1[mol/m^3])/tds.helem');
model.component('comp1').physics('tds').prop('AdvancedSettings').set('BackCompState', 0);
model.component('comp1').physics('tds').prop('TransportMechanism').set('VolatilizationInPartiallySaturatedPorousMedia', true);
model.component('comp1').physics('tds').prop('TransportMechanism').set('Convection', false);
model.component('comp1').physics('tds').feature('sp1').label('Species Properties');
model.component('comp1').physics('tds').feature('cdm1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('tds').feature('cdm1').set('D_prod', {'1.71*(10^-9)'; '0'; '0'; '0'; '1.71*(10^-9)'; '0'; '0'; '0'; '1.71*(10^-9)'});
model.component('comp1').physics('tds').feature('cdm1').set('D_O2', {'1.76*(10^-9)'; '0'; '0'; '0'; '1.76*(10^-9)'; '0'; '0'; '0'; '1.76*(10^-9)'});
model.component('comp1').physics('tds').feature('cdm1').set('D_Sub', {'1.71*(10^-9)'; '0'; '0'; '0'; '1.71*(10^-9)'; '0'; '0'; '0'; '1.71*(10^-9)'});
model.component('comp1').physics('tds').feature('nflx1').set('IncludeConvection', true);
model.component('comp1').physics('tds').feature('init1').set('initc', {'O20'; 'Sub0'; '0'});
model.component('comp1').physics('tds').feature('dcont1').set('pairDisconnect', true);
model.component('comp1').physics('tds').feature('dcont1').label('Continuity');
model.component('comp1').physics('tds').feature('fl1').set('species', [1; 0; 1]);
model.component('comp1').physics('tds').feature('fl1').set('N0', {'ksc*(prod*exp(al*f*(Etip-EO2))-O2*exp(-al*f*(Etip-EO2)))'; '-ksc*(prod*exp(al*f*(Etip-Echa))-cha*exp(-al*f*(Etip-Echa)))'; '-ksc*(prod*exp(al*f*(Etip-EO2))-O2*exp(-al*f*(Etip-EO2)))'});
model.component('comp1').physics('tds').feature('fl2').set('species', [1; 1; 0]);
model.component('comp1').physics('tds').feature('fl2').set('N0', {'ksd*Sub*Sub'; '-2*ksd*Sub*Sub'; '0'});

model.component('comp1').mesh('mesh1').feature('size').set('hauto', 1);
model.component('comp1').mesh('mesh1').feature('size').set('table', 'cfd');
model.component('comp1').mesh('mesh1').feature('ftri1').set('smoothmaxiter', 8);
model.component('comp1').mesh('mesh1').feature('ftri1').set('smoothmaxdepth', 8);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('custom', 'on');
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('table', 'cfd');
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hmax', 1.13);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hmin', 0.05);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hnarrow', 6);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hnarrowactive', true);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hgrad', 1.15);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hmaxactive', false);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hminactive', false);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hcurveactive', false);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hgradactive', false);
model.component('comp1').mesh('mesh1').feature('ftri1').feature('size2').set('table', 'cfd');
model.component('comp1').mesh('mesh1').run;

model.study.create('std1');
model.study('std1').create('time', 'Transient');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sl1', 'SORLine');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sl1', 'SORLine');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature.remove('fcDef');

model.result.dataset.create('rev1', 'Revolve2D');
model.result.numerical.create('int1', 'IntLine');
model.result.numerical('int1').selection.set([9]);
model.result.numerical('int1').set('probetag', 'none');

model.study('std1').feature('time').set('tunit', [native2unicode(hex2dec({'00' 'b5'}), 'unicode') 's']);
model.study('std1').feature('time').set('tlist', {});
model.study('std1').feature('time').setIndex('tlist', '1000', 0);

model.sol('sol1').attach('std1');
model.sol('sol1').feature('st1').label('Compile Equations: Time Dependent');
model.sol('sol1').feature('v1').label('Dependent Variables 1.1');
model.sol('sol1').feature('v1').set('clist', {'0 1000' ['0.1[' native2unicode(hex2dec({'00' 'b5'}), 'unicode') 's]']});
model.sol('sol1').feature('t1').label('Time-Dependent Solver 1.1');
model.sol('sol1').feature('t1').set('tunit', [native2unicode(hex2dec({'00' 'b5'}), 'unicode') 's']);
model.sol('sol1').feature('t1').set('tlist', 1000);
model.sol('sol1').feature('t1').set('rtol', 0.005);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('stabcntrl', true);
model.sol('sol1').feature('t1').feature('dDef').label('Direct 2');
model.sol('sol1').feature('t1').feature('aDef').label('Advanced 1');
model.sol('sol1').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('t1').feature('fc1').label('Fully Coupled 1.1');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 8);
model.sol('sol1').feature('t1').feature('fc1').set('damp', '0.9');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('stabacc', 'aacc');
model.sol('sol1').feature('t1').feature('fc1').set('aaccdim', 5);
model.sol('sol1').feature('t1').feature('fc1').set('aaccmix', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('aaccdelay', 1);
model.sol('sol1').feature('t1').feature('d1').label('Direct, concentrations (tds)');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('t1').feature('i1').label('AMG, concentrations (tds)');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 50);
model.sol('sol1').feature('t1').feature('i1').feature('ilDef').label('Incomplete LU 1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').label('Multigrid 1.1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('usesmooth', false);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').label('Presmoother 1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('soDef').label('SOR 1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sl1').label('SOR Line 1.1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sl1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sl1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sl1').set('linerelax', 0.7);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sl1').set('relax', 0.5);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').label('Postsmoother 1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('soDef').label('SOR 1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sl1').label('SOR Line 1.1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sl1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sl1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sl1').set('linerelax', 0.7);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sl1').set('relax', 0.5);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').label('Coarse Solver 1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('dDef').label('Direct 2');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').label('Direct 1.1');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').runAll;

model.result.dataset('rev1').set('startangle', -90);
model.result.dataset('rev1').set('revangle', 225);
model.result.numerical('int1').set('table', 'tbl1');
model.result.numerical('int1').set('expr', {'(tds.ndflux_prod)*96500[C/mol]'});
model.result.numerical('int1').set('unit', {'A'});
model.result.numerical('int1').set('descr', {''});
model.result.numerical('int1').set('intsurface', true);
model.result.numerical('int1').setResult; 
%Data for time depend 7ms 
ResultTable = mphtable(model,'tbl1');
i = ResultTable.data(2,2);
end