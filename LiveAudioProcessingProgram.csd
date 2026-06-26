// Desktop program for processing of live audio signals
// Features volume contorl, a low pass filter, a delay effect and the amount of feedback, combined with a mix parameter to adjust the level of overall effect processing. 


<CsoundSynthesizer>
<CsOptions>
-iadc -odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

gaDelayFB init 0


//Signal in and Effect Parameters defined and Controlled:
instr 1
	aMic	inch 1
	
//(Gain) 
	kGain invalue "gain"
	kGain limit kGain, 0, 1
	
//(LowPass Filter Cut-Off)
	kFilter invalue "cutoff"
	kFilter limit kFilter, 50, 12000
	
//(Delay in Seconds)
	kDelay invalue "delay"
	kDelay limit kDelay, 0.05, 2.0
	
//(Amount of feedback given back into the loop)
	kFeedback invalue "feedback"
	kFeedback limit kFeedback, 0, 0.95
	
//Mix between effecteed signal and In-signal)
	kMix invalue "mix"
	kMix limit kMix, 0, 1
	
	
//Input smoothing:
	kPortTime init 0.1
	
	kGainSmooth portk kGain, 0.05
	kFilterSmooth portk kFilter, 0.05
	kDelaySmooth portk kDelay, 0.2
	kFeedbackSmooth portk kFeedback, 0.05
	kMixSmooth portk kMix, 0.5
	

//Delay:

	aDelay interp kDelaySmooth
	aDelayMs = aDelay * 1000
	
//Filter:
	aDry	butterlp aMic, kFilterSmooth

//Overall mix with dry and effected signal:
	
	aDelayIn = aDry + (gaDelayFB * kFeedbackSmooth)
	aWet vdelay3 aDelayIn, aDelayMs, 1500
	
	gaDelayFB = aWet
	
//Signal out:

	aOut = (aWet * kMixSmooth)
	aOut = aOut * kGainSmooth
	
	outs aOut, aOut
endin 


</CsInstruments>
<CsScore>
i 1 0 3600
e

</CsScore>
</CsoundSynthesizer>




<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>gain</objectName>
  <x>22</x>
  <y>13</y>
  <width>20</width>
  <height>100</height>
  <uuid>{94345507-540e-45bb-be44-879ba56b7a80}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description>gain</description>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.80000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>20</x>
  <y>119</y>
  <width>80</width>
  <height>25</height>
  <uuid>{ffc79076-7295-430a-99af-adc063e65691}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Gain
</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>132</r>
   <g>154</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>cutoff</objectName>
  <x>121</x>
  <y>13</y>
  <width>20</width>
  <height>100</height>
  <uuid>{5e859107-664f-4731-a39e-4f7217adef3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description>Low Pass Filter Cutoff</description>
  <minimum>0.00000000</minimum>
  <maximum>12000.00000000</maximum>
  <value>11640.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>118</x>
  <y>118</y>
  <width>96</width>
  <height>35</height>
  <uuid>{c7fa21b2-27f6-4aa1-9b41-644d2245da33}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Low Pass Filter Cut-off</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>delay</objectName>
  <x>233</x>
  <y>13</y>
  <width>20</width>
  <height>100</height>
  <uuid>{8669d955-7689-42e6-927d-db59c2a20bd2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description>Delay Time</description>
  <minimum>0.00000000</minimum>
  <maximum>3.00000000</maximum>
  <value>0.57000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>232</x>
  <y>119</y>
  <width>80</width>
  <height>25</height>
  <uuid>{5fef4b32-7edb-4ad6-9737-d618c6be332d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description>DelayTime</description>
  <label>Delay (Sec)</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>feedback</objectName>
  <x>336</x>
  <y>13</y>
  <width>20</width>
  <height>100</height>
  <uuid>{c3316318-ac93-4df1-889c-7ce6338fa4a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description>Feedback Amount</description>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>333</x>
  <y>116</y>
  <width>107</width>
  <height>33</height>
  <uuid>{f9bc39d5-1484-44ce-87f8-9b982079e768}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description>Feedback Amount</description>
  <label>Feedback Amount</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>mix</objectName>
  <x>451</x>
  <y>14</y>
  <width>20</width>
  <height>100</height>
  <uuid>{2a7ff256-4723-4fb5-9c92-b37a5bb3ac4c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.56000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>448</x>
  <y>118</y>
  <width>80</width>
  <height>25</height>
  <uuid>{90ed94fa-4fc5-44d3-8632-f5fd103f0f70}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Mix</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
