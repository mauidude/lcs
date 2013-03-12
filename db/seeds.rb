# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.create([
  { cost_code: '16-000', description: 'Electrical' },
  { cost_code: '16-024', description: 'Electrical Delivery' },
  { cost_code: '16-050', description: '(Do not use)' },
  { cost_code: '16-100', description: 'Maintenance' },
  { cost_code: '16-150', description: 'Electrical Demo' },
  { cost_code: '16-200', description: 'General Power & Wiring' },
  { cost_code: '16-240', description: 'Hoods, BSC, etc...' },
  { cost_code: '16-250', description: 'HVAC & Wiring' },
  { cost_code: '16-300', description: 'Lights & Wiring' },
  { cost_code: '16-330', description: 'Switches & Wiring' },
  { cost_code: '16-350', description: '(Do not use)' },
  { cost_code: '16-375', description: 'Lighting Frieght' },
  { cost_code: '16-400', description: 'Swgr/PNL/Xfrmr' },
  { cost_code: '16-425', description: 'Swgr/PNL/WFmr/Frieght' },
  { cost_code: '16-450', description: 'Feeders Normal' },
  { cost_code: '16-460', description: 'Feeders U.G.' },
  { cost_code: '16-500', description: 'Tele/Data Rough' },
  { cost_code: '16-550', description: 'Alarm/Security Rough' },
  { cost_code: '16-600', description: '(Do not use)' },
  { cost_code: '16-700', description: 'Electrical Supervision' },
  { cost_code: '16-720', description: 'Electrical Auto - Internal' },
  { cost_code: '16-750', description: '(Do not use)' },
  { cost_code: '16-800', description: 'Alarm Sub' },
  { cost_code: '16-850', description: 'Tele/Data Sub' },
  { cost_code: '16-900', description: 'Security Sub' },
  { cost_code: '16-920', description: '(Do not use)' }
])