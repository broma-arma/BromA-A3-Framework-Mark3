// =============================================================================
_index = player createDiarySubject ["ACE 3","ACE 3 Medical"];
// =============================================================================

player createDiaryRecord ["ACE 3",["

 - Wounds (Advanced Information)
",
// =============================================================================
"
Here you will find information about all wounds.					<br/>
 
<br/>
- x  <font color='#00FFFF'>Abrasions<br/></font color><br/>
    | Sources: falling, ropeburn, vehicle crashes.					<br/>
    | Effects 														<br/>
         | pain - extremely light									<br/>
         | bleeding - extremely slowly								<br/>
    | Best Treatment: <font color='#FFFF00'>Any</font color>											<br/>
																	<br/>
- x  <font color='#ff0000'>Avulsions</font color><br/>
    | Sources:  explosions, vehicle crashes, bullets.				<br/>
    | Effects 														<br/>
         | pain - extremely high	<br/>
         | bleeding - extremely fast (depends on size)<br/>
    | Best Treatment: <font color='#FF0000'>Packing Bandage</font color>								<br/>
																	<br/>
- x  <font color='#00FFFF'>Contusions<br/></font color><br/>
    | Sources:  bullets, backblast, vehicle crashes, falling.		<br/>
    | Effects 														<br/>
         | pain - light												<br/>
         | no bleeding												<br/>
    | Best Treatment: not needed(only treated by PAK's)				<br/>
																	<br/>																	
- x  <font color='#00FFFF'>Crush wounds<br/></font color><br/>
    | Sources:  falling, vehicle crashes.							<br/>
    | Effects 														<br/>
         | pain - light												<br/>
         | bleeding - extremely slowly								<br/>
    | Best Treatment: <font color='#00FF00'>Elastic Bandage</font color>								<br/>
																	<br/>	
- x  <font color='#00FFFF'>Cut wounds<br/></font color><br/>
    | Sources:  vehicle crashes, explosions.						<br/>
    | Effects 														<br/>
         | pain - light												<br/>
         | bleeding - fast (depends on size)						<br/>
    | Best Treatment: <font color='#00FF00'>Elastic Bandage</font color>								<br/>
																	<br/>	
- x  <font color='#00FFFF'>Lacerations<br/></font color><br/>
    | Sources:  vehicle crashes.									<br/>
    | Effects 														<br/>
         | pain - light												<br/>
         | bleeding - slow to medium (depends on size)				<br/>
    | Best Treatment: <font color='#00FF00'>Elastic Bandage</font color>								<br/>
																	<br/>
- x  <font color='#ff0000'>Velocity wounds</font color><br/>
    | Sources:  bullets, grenades, explosions.						<br/>
    | Effects 														<br/>
         | pain - extremely high	<br/>
         | bleeding - medium (depends on size)						<br/>
    | Best Treatment: <font color='#FF0000'>Packing Bandage</font color>								<br/>
																	<br/>
- x  <font color='#00FFFF'>Puncture wounds<br/></font color><br/>
    | Sources:  grenades.											<br/>
    | Effects 														<br/>
         | pain - light												<br/>
         | bleeding - slow											<br/>
    | Best Treatment: <font color='#00FF00'>Elastic Bandage</font color>								<br/>
																	<br/>
																	
																	
"]];

// =============================================================================

player createDiaryRecord ["ACE 3",["

 - Wounds (Basic Information)
",
// =============================================================================
"
Wounds which are bleeding are treated by bandages, which will stop the bleeding. Wounds which are not bleeding can only be treated with PAK's, but are not required to be treated.<br/>
There are two basic types of wounds: 									<br/><br/>
- x <font color='#ff0000'>Gunshot / Explosion Wounds</font color> 		<br/>
    bandaged with <font color='#FFFF00'>Packing Bandages</font color>	<br/>
    caused by bullets and explosions									<br/>
    These wounds bleed fast and should be bandaged ASAP.				<br/>
- x <font color='#00FFFF'>Non-Gunshot Wounds</font color>  				<br/>
    bandaged with <font color='#00FF00'>Elastic Bandages</font color>	<br/>
    caused by vehicle crashes and falling								<br/>
    These wounds bleed alot slower.										<br/>
	
"]];
// =============================================================================


// =============================================================================


player createDiaryRecord ["ACE 3",["

 - Drugs
",
// =============================================================================
"
All of these drugs should only be take one at a time and only when 
required, drug abuse will lead to death.<br/>
<br/>
There are three types of drugs: 										<br/>
- x <font color='#FFFF00'>Morphine</font color> 						<br/>
    Morphine cures pain and reduces heart rate							<br/>
    Should only be used when in a lot of pain							<br/>
    and bleeding has been reduced to minimum							<br/>
    Usage: MAX 1 Every 30 minutes<br/>
    Effects on (HR)heart rate<br/>
    if HR < 45 will drop HR by 10 to 30<br/>
    if HR > 45 will drop HR by 10 to 50<br/>
    if HR > 120 will drop HR by 10 to 40<br/>
- x <font color='#00FFFF'>Epinephrine</font color>  					<br/>
    Cures unconciousness.												<br/>
    Also increases heart rate and blood pressure.						<br/>
	Effects on (HR)heart rate<br/>
	if HR < 45 will increase HR by 10 to 20<br/>
	if HR > 45 will increase HR by 10 to 50<br/>
	if HR > 120 will increase HR by 10 to 40<br/>
- x <font color='#00FF00'>Atropine</font color>  						<br/>
    used to control laughing and crying episodes that are caused by brain tumors.<br/>
																		<br/>

	
"]];
// =============================================================================


// =============================================================================


player createDiaryRecord ["ACE 3",["

 - Equipment
",
// =============================================================================
"

<br/>

- x <font color='#FFFF00'>Personal Aid Kit (PAK)</font color> 			<br/>
    Only used by medics (mission specific)								<br/>
    Can be used everywhere (mission specific)							<br/>
    Treats ALL wounds and heals to MAX health							<br/>
    Used up on treatment (mission specific)								<br/>
- x <font color='#00FFFF'>Surgical Kit</font color>  					<br/>
    Only used by medics (mission specific)								<br/>
    Used to stitch wounds to prevent them re-opening.					<br/>
    Can be used at medical facilities (mission specific)				<br/>
    Not used up on treatment (mission specific)							<br/>
- x <font color='#00FF00'>Tourniquet</font color>  						<br/>
    Used by everyone													<br/>
    Stops blood flow to a limb											<br/>
    Causes immense amounts of pain										<br/>
- x <font color='#ff0000'>Blood Bags</font color>  						<br/>
    Saline IV, Blood IV and Plasma IV									<br/>
    All have the same effect											<br/>
    They increase blood pressure 										<br/>
    Take a while to transfuze after applied								<br/>

	
"]];
// =============================================================================


// =============================================================================
player createDiaryRecord ["ACE 3",["

Medical
",
// =============================================================================
"
Information about using the ACE 3 Advanced medical system.				<br/><br/><font color='#FFFF00'>
To fix ANYONE to full health, does not matter how damaged the patient is use a PAK(Personal Aid Kit)<br/></font color><font color='#ff0000'>
Use Surgical kit's to sew up wounds if they re-open after bandaging<br/><br/></font color>
<br/>
CONSCIOUS Patient:<br/><font color='#00FF00'>
1. - Stop the bleeding:<br/></font color>
    -  packing bandages for avulsions and velocity wounds<br/>
    -  Elastic bandages for everything else<br/>
    -  All bandages work, but these are the best<br/>
    -  Use a tourniquet on limbs if bleeding is heavy<br/>
    -  Remove the tourniquet once bleeding has stopped<br/><font color='#00FFFF'>
2. - If patient is in pain:<br/></font color>
    -  Check the HR(Heart Rate), if it's lower than 80,<br/>
    -  use an epipen to rise the HR.<br/>
    -  HR lower than 35 will cause death.<br/><font color='#FFFF00'>
3. - If patient has lost a lot of blood:<br/></font color>
    -  Using an epipen will increase BP(blood pressure)<br/>
    -  Using Blood/plasma/saline IV's will increase BP<br/><br/>
UNCONSCIOUS Patient:<br/><font color='#00FF00'>
1. - Stop the bleeding<br/></font color><font color='#00FFFF'>
2. - Diagnose why patient is unconscious<br/></font color>
    -  Pain can cause unconsciousness<br/>
    -  Low Blood Pressure can cause unconsciousness<br/>
    -  Explosions/backblast/punches/etc.<br/><font color='#FFFF00'>
3. - Apply appropriate treatment<br/></font color>
    -  Epipen increases HR and BP<br/>
    -  Use a IV bag if BP is very low<br/>
    -  If BP is fine and patient is in pain and won't<br/>
    -  wake use morphine as a last resort<br/>
CARDIAC ARREST/HEART ATTACK:<br/>
    -  Patient has no Heart Rate<br/><font color='#00FF00'>
1. - Bandage wounds<br/></font color>
    -  If very low BP<br/><font color='#00FFFF'>
2. - Administer an IV bag<br/></font color><font color='#FFFF00'>
3. - CPR<br/></font color></font color><font color='#ff0000'>
4. - If CPR keeps failing Administer an epipen<br/></font color>
<br/><br/><br/><br/>

I am still not 100% sure how things work and if some things are features or bugs<br/>
If you have any information about the ACE 3 Advanced Medical System then contact me.<br/>
                    Made by nigel<br/>
                    22.June.2015<br/>
"]];
// =============================================================================