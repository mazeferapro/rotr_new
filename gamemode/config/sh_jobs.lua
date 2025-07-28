TEAM_CADET = NextRP.createJob('Кадет', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'cadet', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/olive/cadet/cadet.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Cadet',
    ranks = {
        ['Cadet'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/olive/cadet/cadet.mdl'
            },
            hp = 100, -- ХП
            ar = 0, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Кадеты',
            speed = {500, 500}, -- Значения скорости: {walkSpeed, runSpeed}
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = true,
    walkspead = 100,
    runspead = 250,
    -- Категория
    category = 'Кадеты'
})




--[[----------------------------------------------------------------------------------

    #:ВАР

------------------------------------------------------------------------------------]]

TEAM_CTRP = NextRP.createJob('Боец 882-го', {
    id = 'ctrp',
    model = {'models/ct_pvt/ct_pvt.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17',
                },
                ammunition = {
                    'arccw_k_dc15s',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17',
                },
                ammunition = {
                    'arccw_k_dc15s',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17',
                },
                ammunition = {
                    'arccw_k_dc15s',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17',
                },
                ammunition = {
                    'arccw_k_dc15s',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_flashbang',
                    'arccw_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_flashbang',
                    'arccw_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_flashbang',
                    'arccw_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17_akimbo',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17_akimbo',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17_akimbo',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17_akimbo',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17ext',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17ext',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
        ['СС'] = {
            sortOrder = 16,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон-Коммандер',
            whitelist = false,
        },
        ['SCC'] = {
            sortOrder = 17,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Клон-Коммандер',
            whitelist = false,
        },
        ['MC'] = {
            sortOrder = 18,
            model = {
                'models/solder/mq_gq_sol/ct/clone_ct.mdl',
                'models/solder/mq_gq_sol/evo/evo_882.mdl',
                'models/solder/mq_gq_sol/marine/marine.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_k_dc15a_stun',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Маршал-Коммандер',
            whitelist = false,
        },
    },
    flags = {
        ['СН|АРФ'] = {
            id = 'SN|ARF',
            model = {
                'models/solder/mq_gq_sol/arf/arf.mdl',
            },
            weapon = {
                ammunition = {
                'arccw_k_nade_thermal',
                'arccw_k_nade_flashbang',
                'arccw_k_nade_smoke',
                'arccw_k_nade_sonar',
                'arccw_k_dc15le',
                'arccw_k_dc19'
                },
                default = {
                'arccw_k_dc17_akimbo',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['SN'] = {
            id = 'SN',
            model = {
                'models/solder/mq_gq_sol/arf/arf.mdl',
            },
            weapon = {
                ammunition = {
                'arccw_k_nade_thermal',
                'arccw_k_nade_flashbang',
                'arccw_k_nade_smoke',
                'arccw_k_nade_sonar',
                'arccw_k_dc15x',
                'arccw_sops_republic_t702'
                },
                default = {
                'arccw_k_dc17_akimbo',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик | Ряд+'] = {
            id = 'MED | PVT+',
            model = {
                'models/solder/mq_gq_sol/med/med.mdl',
                'models/navy/gnavymedic.mdl',
                'models/solder/mq_gq_sol/evo_med/evo_882_med.mdl'
            },
            weapon = {
                ammunition = {
                    'arccw_k_republic_e9',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_k_nade_smoke',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                },
                default = {
                    'arccw_k_dc17ext'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик | Cерж+'] = {
            id = 'MED | SGT+',
            model = {
                'models/solder/mq_gq_sol/med/med.mdl',
                'models/navy/gnavymedic.mdl',
                'models/solder/mq_gq_sol/evo_med/evo_882_med.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_republic_e9',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_k_nade_smoke',
                    'arccw_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_stun',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                },
                default = {
                    'arccw_k_dc17_stun'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Инженер | Ряд+'] = {
            id = 'ENG | PVT+',
            model = {
                'models/solder/mq_gq_sol/pilot/pilot.mdl',
                'models/navy/gnavyengineer2.mdl',
                'models/solder/mq_gq_sol/eng/eng.mdl'
            },
            weapon = {
                ammunition = {
                    'arccw_k_dp24',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arccw_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                    'arccw_k_dc17',
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Инженер | Серж+'] = {
            id = 'ENG | SGT+',
            model = {
                'models/solder/mq_gq_sol/pilot/pilot.mdl',
                'models/navy/gnavyengineer2.mdl',
                'models/solder/mq_gq_sol/eng/eng.mdl'
            },
            weapon = {
                ammunition = {
                    'arccw_k_dp23',
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arccw_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                    'arccw_k_dc17_stun',
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Десантник | Cерж+'] = {
            id = 'PAR | SGT+',
            model = {
                'models/solder/mq_gq_sol/para/para.mdl',
            },
            weapon = {
                ammunition = {
                    'jet_mk1',
                    'arccw_k_dc15le',
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17_akimbo',
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Десантник | Тяж'] = {
            id = 'PAR | Heavy',
            model = {
                'models/solder/mq_gq_sol/para/para.mdl',
            },
            weapon = {
                ammunition = {
                    'jet_mk1',
                    'arccw_k_dp23c',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17',
                },
            },
            hp = 250,
            ar = 55,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Десантник | Ряд+'] = {
            id = 'PAR | PVT+',
            model = {
                'models/solder/mq_gq_sol/para/para.mdl',
            },
            weapon = {
                ammunition = {
                    'jet_mk1',
                    'arccw_k_dc15s',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17',
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Гранатометчик | Ряд+'] = {
            id = 'GREN | PVT+',
            model = {
                'models/ct_heavy/ct_heavy.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_dc15s_grenadier',
                    'arccw_k_launcher_rps6',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17'
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Гранатометчик | Серж+'] = {
            id = 'GREN | PVT+',
            model = {
                'models/solder/mq_gq_sol/heavy/heavy.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_dc15a_grenadier',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17_stun'
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Тяж боец | Серж+'] = {
            id = 'HT | SGT+',
            model = {
                'models/solder/mq_gq_sol/heavy/heavy.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_z6adv',
                    'arccw_k_republicshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_flashbang',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_stun'
                },
                default = {
                    'arccw_k_dc17_stun',
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Тяж боец | Ряд+'] = {
            id = 'HT | PVT+',
            model = {
                'models/solder/mq_gq_sol/heavy/heavy.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_z6',
                    'arccw_k_republicshield',
                    'arccw_k_nade_smoke',
                    'arccw_k_nade_flashbang',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17'
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = true,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = '882-й Горный Батальон'
})

TEAM_TSGRP = NextRP.createJob('Боец ТСГ', {
    id = 'tsbrp',
    model = {'models/aussiwozzi/cgi/base/arc_gen.mdl'},
    color = Color(127,143,166),
    default_rank = 'PVT',
    ranks = {
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 300,
            ar = 45,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 300,
            ar = 45,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 350,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 350,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 350,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 400,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 400,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl'
            },
            hp = 400,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 500,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 500,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/aussiwozzi/cgi/base/arc_gen.mdl',
            },
            hp = 600,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_launcher_plx1',
                    'weapon_imperial_flamethrower',
                    'weapon_defibrillator',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arccw_sops_galactic_a180',
                    'arccw_sops_vibroknife',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
    },
    flags = {
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = 'ARC TSG'
})

TEAM_BRAVORP = NextRP.createJob('Боец ARC Браво', {
    id = 'bravorp',
    model = {'models/chet/bso/trooper/trooper.mdl'},
    color = Color(127,143,166),
    default_rank = 'PVT',
    ranks = {
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 300,
            ar = 45,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 300,
            ar = 45,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 300,
            ar = 45,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 300,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 300,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 300,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 400,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 400,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/chet/bso/trooper/trooper.mdl'
            },
            hp = 400,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 500,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 500,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/chet/bso/trooper/trooper.mdl',
            },
            hp = 500,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
    },
    flags = {
        ['Штурмовой отдел'] = {
            id = 'Assault Department',
            model = {
                'models/chet/bso/officer/officer.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17_stun',
                },
            },
            hp = 400,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Рекрутёр'] = {
            id = 'Recruitment',
            model = {
                'models/player/gary/commission/starwars/strife.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17_stun',
                },
            },
            hp = 400,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Прокурор'] = {
            id = 'Prosecutor',
            model = {
                'models/golomp/tc13_redline/ct.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17_stun',
                },
            },
            hp = 400,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Инструктор'] = {
            id = 'Instructor',
            model = {
                'models/chet/bso/commander/commander.mdl',
            },
            weapon = {
                ammunition = {
                    'arccw_k_dc15x',
                    'arccw_k_dc15sa',
                    'arccw_k_republicshield',
                    'arccw_k_westarm5',
                    'arccw_sops_vibroknife',
                    'arccw_k_launcher_rps6',
                    'arccw_k_sb2',
                    'weapon_cuff_elastic',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'jet_mk1',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_k_nade_thermal',
                },
                default = {
                    'arccw_k_dc17_stun',
                },
            },
            hp = 400,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = 'ARC BRAVO'
})

TEAM_ARCRP = NextRP.createJob('Боец ARC', {
    id = 'saweq',
    model = {'models/arc_pvt/arc_pvt.mdl'},
    color = Color(127,143,166),
    default_rank = 'REC',
    ranks = {
        ['REC'] = {
            sortOrder = 1,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17ext',
                },
                ammunition = {
                    'arccw_k_dc15a',
                    'arccw_k_nade_thermal',
                },
            },
            fullRank = 'Рекрут ЭРК',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/arc_sgt/arc_sgt.mdl',
            },
            hp = 350,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/arc_sgt/arc_sgt.mdl',
            },
            hp = 350,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/arc_sgt/arc_sgt.mdl',
            },
            hp = 350,
            ar = 55,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/arc_lt/arc_lt.mdl',
            },
            hp = 400,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/arc_lt/arc_lt.mdl',
            },
            hp = 400,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/arc_lt/arc_lt.mdl'
            },
            hp = 400,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/arc_cpt/arc_cpt.mdl',
            },
            hp = 500,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/arc_cpt/arc_cpt.mdl',
            },
            hp = 500,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/arc_cpt/arc_cpt.mdl',
            },
            hp = 500,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17sa_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_c14',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
    },
    flags = {
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = 'Батальон ЭРК'
})

TEAM_RCRP = NextRP.createJob('Республиканский коммандос', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'rcrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/budds/cgi_clone_commandos/unmarked/cgi_unmarked_rc.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'RC',
    ranks = {
        ['RC'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/budds/cgi_clone_commandos/unmarked/cgi_unmarked_rc.mdl',
                'models/player/budds/cgi_clone_commandos/geonosis/cgi_geonosis_rc.mdl',
                'models/player/budds/cgi_clone_commandos/kashyyyk/cgi_kashyyyk_rc.mdl'
            },
            hp = 500, -- ХП
            ar = 40, -- Армор
            weapon = { -- Оружие
                default = {
                    'arccw_k_dc15sa',
                }, -- При спавне
                ammunition = {
                    'arccw_k_dc17m_rifle_republic',
                    'arccw_k_dc17m_shotgun_republic',
                    'arccw_k_dc17m_sniper_republic',
                    'realistic_hook',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_nade_smoke',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Республиканский коммандос',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'Республиканский коммандос'
})

TEAM_WRECKERRCRP = NextRP.createJob('Республиканский коммандос Wrecker', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'wreckerrcrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/budds/cgi_clone_commandos/unmarked/cgi_unmarked_rc.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'RC',
    ranks = {
        ['RC'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/budds/cgi_clone_commandos/unmarked/cgi_unmarked_rc.mdl'
            },
            hp = 500, -- ХП
            ar = 40, -- Армор
            weapon = { -- Оружие
                default = {
                    'arccw_k_dc15sa',
                }, -- При спавне
                ammunition = {
                    'arccw_k_dc17m_rifle_republic',
                    'arccw_k_dc17m_shotgun_republic',
                    'arccw_k_dc17m_sniper_republic',
                    'realistic_hook',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_nade_smoke',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Республиканский коммандос',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {
        ['Leadfoot'] = {
            id = 'Leadfoot',
            model = {
                'models/aussiwozzi/cgi/commando/rc_vale.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                },
            },
            hp = 500,
            ar = 40,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Roadbuster'] = {
            id = 'Roadbuster',
            model = {
                'models/aussiwozzi/cgi/commando/rc_witt.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                },
            },
            hp = 500,
            ar = 40,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'Республиканский коммандос'
})

TEAM_ARCALPHARP = NextRP.createJob('Боец ARC Alpha', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'arcalpharp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/alpha_dotr/alpha_dotr.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'CPL',
    ranks = {
        ['CPL'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/aussiwozzi/cgi/base/arc_sgt.mdl'
            },
            hp = 300, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arccw_k_dc17s_dual',
                }, -- При спавне
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                }
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капрал',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['SGT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/aussiwozzi/cgi/base/arc_sgt.mdl'
            },
            hp = 350, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arccw_k_dc17s_dual',
                }, -- При спавне
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                }
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Сержант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['LT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/aussiwozzi/cgi/base/arc_lt.mdl'
            },
            hp = 400, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arccw_k_dc17s_dual',
                },
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                }
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Лейтенант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['CPT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/aussiwozzi/cgi/base/arc_cpt.mdl'
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arccw_k_dc17s_dual',
                }, -- При спавне
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капитан',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'ARC | Alpha'
})

TEAM_ARCNULLRP = NextRP.createJob('Боец ARC Null', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'arcnullrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'SGT',
    ranks = {
        ['SGT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            hp = 500, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    
                }, -- При спавне
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_sops_quadblaster_republic',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Сержант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['LT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            hp = 500, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    
                }, -- При спавне
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_sops_quadblaster_republic',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Лейтенант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['CPT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            hp = 500, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    
                }, -- При спавне
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_k_valken38',
                    'arccw_k_dp24c',
                    'arccw_k_launcher_plx1',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'arccw_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                    'arccw_sops_quadblaster_republic',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капитан',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
        ['Прудии'] = {
            id = 'Prudii',
            model = {
                'models/player/gary/starwars/arc/alpha_prudii.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arccw_k_dc17sa_dual',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Джайнг'] = {
            id = 'Jaing',
            model = {
                'models/player/gary/starwars/arc/alpha_jaing.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arccw_k_dc17sa_dual',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Комрк'] = {
            id = 'Komrk',
            model = {
                'models/player/gary/starwars/arc/alpha_komrk.mdl',
            },
            weapon = {
                ammunition = {
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                },
                default = {
                    'arccw_k_dc17sa_dual',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Мерил'] = {
            id = 'Mereel',
            model = {
                'models/player/gary/starwars/arc/alpha_mereel.mdl',
            },
            weapon = {
                ammunition = {
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                },
                default = {
                    'arccw_k_dc17sa_dual',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Аден'] = {
            id = 'Aden',
            model = {
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arccw_k_dc17sa_dual',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Ордо'] = {
            id = 'Ordo',
            model = {
                'models/player/gary/starwars/arc/alpha_ordo.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arccw_k_dc17sa_dual',
                },
            },
            hp = 600,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'ARC | Null'
})

TEAM_MAZENRP = NextRP.createJob('Представитель Республиканской Разведки', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'mazenrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/gary/commission/starwars/omen_srt.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/gonzo/republicintelligence/director/director.mdl',
                'models/player/gary/commission/starwars/omen_srt.mdl'
            },
            hp = 600, -- ХП
            ar = 65, -- Армор
            weapon = { -- Оружие
                default = {
                    'arccw_k_dc17ext'
                }, -- При спавне
                ammunition = {
                    'arccw_k_westarm5',
                    'arccw_sops_republic_t702',
                    'realistic_hook',
                    'weapon_bactainjector',
                    'arccw_k_nade_thermal',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            speed = {500, 500}, -- Значения скорости: {walkSpeed, runSpeed}
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = true,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'Штаб'
})

TEAM_HQNRP = NextRP.createJob('Боец Штаба', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'hqnrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/mc_melintor/mc_melintor.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'ADJ',
    ranks = {
        ['ADJ'] = {
            sortOrder = 1,
            model = {
                'models/navy/gnavycrewman.mdl',
                'models/aussiwozzi/cgi/base/arc_sgt_grenadier.mdl'
            },
            hp = 400,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Адъютант',
            whitelist = false,
        },
        ['QUAR'] = {
            sortOrder = 1,
            model = {
                'models/navy/gnavyengineer.mdl',
                ' models/aussiwozzi/cgi/base/arc_lt_grenadier.mdl'
            },
            hp = 450,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Интендант',
            whitelist = false,
        },
        ['COM'] = {
            sortOrder = 1,
            model = {
                'models/navy/gnavyofficer.mdl',
                'models/aussiwozzi/cgi/base/arc_cpt_grenadier.mdl'
            },
            hp = 450,
            ar = 60,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Комендант',
            whitelist = false,
        },
        ['DG'] = {
            sortOrder = 1,
            model = {
                'models/navy/gnavygunner.mdl',
                'models/aussiwozzi/cgi/base/arc_com.mdl'
            },
            hp = 500,
            ar = 65,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Заместитель Генерала',
            whitelist = false,
        },
        ['ADM'] = {
            sortOrder = 1,
            model = {
                'models/jajoff/sps/republic/tc13j/tarkin.mdl',
                'models/navy/gnavyadmiral.mdl'
            },
            hp = 500,
            ar = 65,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Адмирал',
            whitelist = false,
        },
        ['GEN'] = {
            sortOrder = 1,
            model = {
                'models/mc_crown/mc_crown.mdl',
                'models/navy/gnavygunner.mdl'
            },
            hp = 600,
            ar = 65,
            weapon = {
                default = {
                    'arccw_k_dc17_stun',
                },
                ammunition = {
                    'arccw_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Генерал',
            whitelist = false,
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = true,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'Штаб'
})

TEAM_ARFRANCOR = NextRP.createJob('Боец ARF Rancor', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'arfrancor', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/arfrancor/arfrancor.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'PVT',
    ranks = {
        ['PVT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_sops_republic_773firepuncher_short',
                    'arccw_sops_republic_t702',
                    'arccw_sops_empire_firepuncher',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 400,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_sops_republic_773firepuncher_short',
                    'arccw_sops_republic_t702',
                    'arccw_sops_empire_firepuncher',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 500,
            ar = 40,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_sops_republic_773firepuncher_short',
                    'arccw_sops_republic_t702',
                    'arccw_sops_empire_firepuncher',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 600,
            ar = 50,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_sops_republic_773firepuncher_short',
                    'arccw_sops_republic_t702',
                    'arccw_sops_empire_firepuncher',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 2,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 600,
            ar = 65,
            weapon = {
                default = {
                    'arccw_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arccw_sops_republic_773firepuncher_short',
                    'arccw_sops_republic_t702',
                    'arccw_sops_empire_firepuncher',
                    'arccw_k_nade_thermal',
                    'arccw_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
    },
    flags = {
        ['Мелинтор'] = {
            id = 'Melintor',
            model = {
                'models/mc_melintor/mc_melintor.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arccw_k_dc17sa_dual',
                },
            },
            hp = 600,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = true,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'ARF Rancor'
})

--[[----------------------------------------------------------------------------------

    #:Остальное
------------------------------------------------------------------------------------]]

TEAM_TPROLL = NextRP.createJob('РП Роль', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'tproll', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/combine_super_soldier.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'rp',
    ranks = {
        ['rp'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/combine_super_soldier.mdl'
            },
            hp = 100, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'рп',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_NONE, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 100,
    runspead = 250,
    -- Категория
    category = 'RP'
})

TEAM_CITYNRP = NextRP.createJob('Неизвестный', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'citynrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/combine_super_soldier.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Unknown',
    ranks = {
        ['Unknown'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/assassin/pm_civ_assassin_human_female.mdl',
                'models/bride/pm_civ_bride_costume_female.mdl',
                'models/cyborg/pm_civ_cyborg_costume_male.mdl',
                'models/dweller/pm_civ_dweller_human_female.mdl',
                'models/dweller/pm_civ_dweller_human_male.mdl',
                'models/engineer/pm_civ_engineer_human_female.mdl',
                'models/engineer/pm_civ_engineer_human_male.mdl',
                'models/formal/pm_civ_formal_human_female.mdl',
                'models/formal/pm_civ_formal_human_male.mdl',
                'models/merc/pm_civ_merc_human_female.mdl',
                'models/merc/pm_civ_merc_human_male.mdl',
                'models/noble/pm_civ_noble_human_female.mdl',
                'models/noble/pm_civ_noble_human_male.mdl',
                'models/ranger/pm_civ_ranger_costume_female.mdl',
                'models/rebel/pm_civ_rebel_costume_male.mdl',
                'models/renegade/pm_civ_renegade_human_female.mdl',
                'models/renegade/pm_civ_renegade_human_male.mdl',
                'models/resident/pm_civ_resident_human_female.mdl',
                'models/resident/pm_civ_resident_human_male.mdl',
                'models/scientist/pm_civ_scientist_human_female.mdl',
            },
            hp = 100, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Неизвестный',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_NONE, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 100,
    runspead = 250,
    -- Категория
    category = 'RP'
})

--

TEAM_AGENTGAR = NextRP.createJob('Агент ВАР', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'agentgar', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/oxyl/medwoman.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/oxyl/medwoman.mdl',
            },
            hp = 200, -- ХП
            ar = 30, -- Армор
            weapon = { -- Оружие
                default = {'arccw_sops_galactic_scatterpistol'}, -- При спавне
                ammunition = {
                    'arccw_sops_galactic_deadmansrevenge',
                    'realistic_hook',
                    'arccw_k_nade_bacta',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники ВАР'
})

TEAM_MERC = NextRP.createJob('Наёмник', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'merc', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/knyaje pack/body_sgt/body_sgt.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'SGT',
    ranks = {
        ['SGT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/knyaje pack/body_sgt2/body_sgt2.mdl',
                'models/knyaje pack/body_sgt/body_sgt.mdl',
                'models/knyaje pack/body_soldier/body_soldier.mdl',
                'models/knyaje pack/body_trp/body_trp.mdl',
                'models/player/swtor/arsenic/bones/bones01.mdl',
                'models/player/valley/bith.mdl',
                'models/player/valley/gotal.mdl',
                'models/player/valley/karkarodon.mdl',
                'models/player/valley/nossorri.mdl',
                'models/player/valley/orphne.mdl',
                'models/player/valley/talz.mdl',
            },
            hp = 400, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {'arccw_sops_galactic_scatterpistol'}, -- При спавне
                ammunition = {
                    'arccw_k_dc15a',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Наёмники',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники ВАР'
})

TEAM_ADMIN = NextRP.createJob('Администратор', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'admin', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/dizcordum/wk/jackswan/wk_servoskull.mdl'},
    color = Color(220, 221, 225),
    -- Звания
    default_rank = 'ADMIN',
    ranks = {
        ['ADMIN'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/dizcordum/wk/jackswan/wk_servoskull.mdl'
            },
            hp = 100, -- ХП
            ar = 0, -- Армор
            weapon = { -- Оружие
                default = {'weapon_physgun', 'gmod_tool'}, -- При спавне
                ammunition = {} -- В оружейке
            },

            -- Форматирование
            natoCode = '',
            fullRank = 'Администратор',

            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу и менять звания
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_ADMIN, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_NONE, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    flag = 'ua',
    -- Стартовая
    start = true,
    walkspead = 250,
    runspead = 300,
    -- Категория
    category = 'Администратор'
})

START_TEAMS = {
	[TYPE_GAR] = TEAM_CADET,
}

--[[----------------------------------------------------------------------------------
By Raven
Date: 21.08.2024
Version: 13
------------------------------------------------------------------------------------]]