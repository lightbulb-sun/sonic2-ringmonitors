ITEM_TYPE_MONITOR = $10
MONITOR_TYPE_RING = $02
END_OF_LEVEL_DATA = $ff

.computesmschecksum

.memorymap
slotsize $4000
slot 0 $0000
slot 1 $4000
slot 2 $8000
defaultslot 0
.endme

.rombankmap
bankstotal 32
banksize $4000
banks 32
.endro

.background "sonic2.gg"

.macro ringmonitor
        .db     ITEM_TYPE_MONITOR
        .dw     \1 ; 16-bit x-coordinate
        .dw     \2 ; 16-bit y-coordinate
        .db     0
        .db     MONITOR_TYPE_RING
        .dw     0
.endm

.bank 30 slot 2
.orga $814d
            .dw     LEVEL_DATA_ZONE_UNDER_GROUND_ACT_3
.orga $8153
            .dw     LEVEL_DATA_ZONE_SKY_HIGH_ACT_3
.orga $8159
            .dw     LEVEL_DATA_ZONE_AQUA_LAKE_ACT_3
.orga $815f
            .dw     LEVEL_DATA_ZONE_GREEN_HILLS_ACT_3
.orga $8165
            .dw     LEVEL_DATA_ZONE_GIMMICK_MT_ACT_3
.orga $816b
            .dw     LEVEL_DATA_ZONE_SCRAMBLED_EGG_ACT_3
.orga $8171
            .dw     LEVEL_DATA_ZONE_CRYSTAL_EGG_ACT_3

.orga $be00
LEVEL_DATA_ZONE_UNDER_GROUND_ACT_3:
            .incbin "sonic2.gg" skip $7840f read $7e
            ringmonitor $05cd, $036e
            .db     END_OF_LEVEL_DATA
LEVEL_DATA_ZONE_SKY_HIGH_ACT_3:
            .incbin "sonic2.gg" skip $78568 read $1b
            ringmonitor $039e, $006e
            .db     END_OF_LEVEL_DATA
LEVEL_DATA_ZONE_AQUA_LAKE_ACT_3:
            .incbin "sonic2.gg" skip $787b4 read $5a
            ringmonitor $0930, $012e
            .db     END_OF_LEVEL_DATA
LEVEL_DATA_ZONE_GREEN_HILLS_ACT_3:
            .incbin "sonic2.gg" skip $7898b read $12
            ringmonitor $01f0, $024e
            .db     END_OF_LEVEL_DATA
LEVEL_DATA_ZONE_GIMMICK_MT_ACT_3:
            .incbin "sonic2.gg" skip $78b11 read $24
            ringmonitor $0191, $042e
            .db     END_OF_LEVEL_DATA
LEVEL_DATA_ZONE_SCRAMBLED_EGG_ACT_3:
            .incbin "sonic2.gg" skip $78c8e read $12
            ringmonitor $012b, $0e4e
            .db     END_OF_LEVEL_DATA
LEVEL_DATA_ZONE_CRYSTAL_EGG_ACT_3:
            .incbin "sonic2.gg" skip $78d9f read $09
            ringmonitor $014d, $014e
            .db     END_OF_LEVEL_DATA
