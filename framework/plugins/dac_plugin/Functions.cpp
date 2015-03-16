class BRM_DAC
{
	class Functions {
		file = "framework\plugins\dac_plugin\functions";
		class preinit {preInit = 1;};
		class postinit {postInit = 1;};
		class setParams {postInit = 1;};
		class new {};
		class createDACCamp {};
		class createDACZone {};
		class getDACStat {};
		class scaleUnits {};
	};
}; 