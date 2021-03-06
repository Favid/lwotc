//---------------------------------------------------------------------------------------
//  FILE:    X2LWResistanceOrdersModTemplate.uc
//  AUTHOR:  Peter Ledbrook
//	PURPOSE: Modifies existing Resistance Order templates.
//
//           In particular, it makes sure that disabled ROs (with strength 99)
//           are removed as potential continent bonuses.
//---------------------------------------------------------------------------------------
class X2LWResistanceOrdersModTemplate extends X2LWTemplateModTemplate;

static function UpdateResistanceOrders(X2StrategyElementTemplate Template, int Difficulty)
{
	local X2StrategyCardTemplate CardTemplate;

	CardTemplate = X2StrategyCardTemplate(Template);
	if (CardTemplate == none)
		return;

	if (CardTemplate.Strength == 99)
	{
		`LWTrace("Removing " $ CardTemplate.DataName $ " as a continent bonus as it's disabled");
		CardTemplate.bContinentBonus = false;
	}	
}

defaultproperties
{
	StrategyElementTemplateModFn=UpdateResistanceOrders
}