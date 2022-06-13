{-# OPTIONS_GHC -w #-}
module Parser (parser) where
import Language
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,246) ([0,23600,50176,26,3072,23,1185,0,65024,63,0,0,0,0,0,0,0,0,5900,41216,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12288,92,4740,0,0,4096,2,49920,16389,296,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,4,8192,0,0,0,0,16,0,23600,33792,18,0,65528,256,0,0,4096,0,0,0,33,0,65504,19,0,0,0,0,49920,16389,296,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5900,41216,4,0,0,0,49152,368,18960,0,0,1024,0,0,65528,4,0,0,128,0,768,8192,0,12288,92,4740,0,63488,255,0,0,0,256,0,0,32,0,0,4096,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,5900,41216,4,0,0,0,0,0,16,0,304,1024,16,0,65336,0,0,65024,191,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1475,10304,1,768,0,0,0,2,0,0,0,0,0,49920,16389,296,0,0,0,0,57344,1023,0,3072,23,1185,0,65024,191,0,32768,4095,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Statement","Expr","Value","Defs","Def","VarDef","FuncDef","Type","Params","Param","FuncApp","FuncArgs","CaseOfPatterns","CaseOfPattern","Pattern","UnaryOp","BinaryOp","'int'","'bool'","'integer'","'boolean'","'_'","'='","'!'","'++'","'--'","'+'","'-'","'*'","'/'","'%'","'>'","'<'","'>='","'<='","'=='","'!='","'&&'","'||'","'('","')'","','","'->'","'func'","'let'","'in'","'case'","'of'","'var'","'name'","%eof"]
        bit_start = st Prelude.* 54
        bit_end = (st Prelude.+ 1) Prelude.* 54
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..53]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (21) = happyShift action_6
action_0 (22) = happyShift action_7
action_0 (27) = happyShift action_8
action_0 (28) = happyShift action_9
action_0 (29) = happyShift action_10
action_0 (31) = happyShift action_11
action_0 (43) = happyShift action_12
action_0 (47) = happyShift action_20
action_0 (48) = happyShift action_13
action_0 (50) = happyShift action_14
action_0 (52) = happyShift action_21
action_0 (53) = happyShift action_15
action_0 (4) = happyGoto action_16
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (8) = happyGoto action_17
action_0 (9) = happyGoto action_18
action_0 (10) = happyGoto action_19
action_0 (14) = happyGoto action_4
action_0 (19) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (21) = happyShift action_6
action_1 (22) = happyShift action_7
action_1 (27) = happyShift action_8
action_1 (28) = happyShift action_9
action_1 (29) = happyShift action_10
action_1 (31) = happyShift action_11
action_1 (43) = happyShift action_12
action_1 (48) = happyShift action_13
action_1 (50) = happyShift action_14
action_1 (53) = happyShift action_15
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (14) = happyGoto action_4
action_1 (19) = happyGoto action_5
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (30) = happyShift action_31
action_2 (31) = happyShift action_32
action_2 (32) = happyShift action_33
action_2 (33) = happyShift action_34
action_2 (34) = happyShift action_35
action_2 (35) = happyShift action_36
action_2 (36) = happyShift action_37
action_2 (37) = happyShift action_38
action_2 (38) = happyShift action_39
action_2 (39) = happyShift action_40
action_2 (40) = happyShift action_41
action_2 (41) = happyShift action_42
action_2 (42) = happyShift action_43
action_2 (20) = happyGoto action_30
action_2 _ = happyReduce_1

action_3 _ = happyReduce_6

action_4 _ = happyReduce_3

action_5 (21) = happyShift action_6
action_5 (22) = happyShift action_7
action_5 (27) = happyShift action_8
action_5 (28) = happyShift action_9
action_5 (29) = happyShift action_10
action_5 (31) = happyShift action_11
action_5 (43) = happyShift action_12
action_5 (48) = happyShift action_13
action_5 (50) = happyShift action_14
action_5 (53) = happyShift action_15
action_5 (5) = happyGoto action_29
action_5 (6) = happyGoto action_3
action_5 (14) = happyGoto action_4
action_5 (19) = happyGoto action_5
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_10

action_7 _ = happyReduce_11

action_8 _ = happyReduce_35

action_9 _ = happyReduce_36

action_10 _ = happyReduce_37

action_11 _ = happyReduce_34

action_12 (21) = happyShift action_6
action_12 (22) = happyShift action_7
action_12 (27) = happyShift action_8
action_12 (28) = happyShift action_9
action_12 (29) = happyShift action_10
action_12 (31) = happyShift action_11
action_12 (43) = happyShift action_12
action_12 (48) = happyShift action_13
action_12 (50) = happyShift action_14
action_12 (53) = happyShift action_15
action_12 (5) = happyGoto action_28
action_12 (6) = happyGoto action_3
action_12 (14) = happyGoto action_4
action_12 (19) = happyGoto action_5
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (47) = happyShift action_20
action_13 (52) = happyShift action_21
action_13 (7) = happyGoto action_26
action_13 (8) = happyGoto action_27
action_13 (9) = happyGoto action_18
action_13 (10) = happyGoto action_19
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (21) = happyShift action_6
action_14 (22) = happyShift action_7
action_14 (27) = happyShift action_8
action_14 (28) = happyShift action_9
action_14 (29) = happyShift action_10
action_14 (31) = happyShift action_11
action_14 (43) = happyShift action_12
action_14 (48) = happyShift action_13
action_14 (50) = happyShift action_14
action_14 (53) = happyShift action_15
action_14 (5) = happyGoto action_25
action_14 (6) = happyGoto action_3
action_14 (14) = happyGoto action_4
action_14 (19) = happyGoto action_5
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (43) = happyShift action_24
action_15 _ = happyReduce_5

action_16 (54) = happyAccept
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_2

action_18 _ = happyReduce_15

action_19 _ = happyReduce_16

action_20 (53) = happyShift action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (53) = happyShift action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (26) = happyShift action_52
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (43) = happyShift action_51
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (21) = happyShift action_6
action_24 (22) = happyShift action_7
action_24 (27) = happyShift action_8
action_24 (28) = happyShift action_9
action_24 (29) = happyShift action_10
action_24 (31) = happyShift action_11
action_24 (43) = happyShift action_12
action_24 (48) = happyShift action_13
action_24 (50) = happyShift action_14
action_24 (53) = happyShift action_15
action_24 (5) = happyGoto action_49
action_24 (6) = happyGoto action_3
action_24 (14) = happyGoto action_4
action_24 (15) = happyGoto action_50
action_24 (19) = happyGoto action_5
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (30) = happyShift action_31
action_25 (31) = happyShift action_32
action_25 (32) = happyShift action_33
action_25 (33) = happyShift action_34
action_25 (34) = happyShift action_35
action_25 (35) = happyShift action_36
action_25 (36) = happyShift action_37
action_25 (37) = happyShift action_38
action_25 (38) = happyShift action_39
action_25 (39) = happyShift action_40
action_25 (40) = happyShift action_41
action_25 (41) = happyShift action_42
action_25 (42) = happyShift action_43
action_25 (51) = happyShift action_48
action_25 (20) = happyGoto action_30
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (49) = happyShift action_47
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (47) = happyShift action_20
action_27 (52) = happyShift action_21
action_27 (7) = happyGoto action_46
action_27 (8) = happyGoto action_27
action_27 (9) = happyGoto action_18
action_27 (10) = happyGoto action_19
action_27 _ = happyReduce_13

action_28 (30) = happyShift action_31
action_28 (31) = happyShift action_32
action_28 (32) = happyShift action_33
action_28 (33) = happyShift action_34
action_28 (34) = happyShift action_35
action_28 (35) = happyShift action_36
action_28 (36) = happyShift action_37
action_28 (37) = happyShift action_38
action_28 (38) = happyShift action_39
action_28 (39) = happyShift action_40
action_28 (40) = happyShift action_41
action_28 (41) = happyShift action_42
action_28 (42) = happyShift action_43
action_28 (45) = happyShift action_45
action_28 (20) = happyGoto action_30
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (30) = happyShift action_31
action_29 (31) = happyShift action_32
action_29 (32) = happyShift action_33
action_29 (33) = happyShift action_34
action_29 (34) = happyShift action_35
action_29 (35) = happyShift action_36
action_29 (36) = happyShift action_37
action_29 (37) = happyShift action_38
action_29 (38) = happyShift action_39
action_29 (39) = happyShift action_40
action_29 (40) = happyShift action_41
action_29 (41) = happyShift action_42
action_29 (42) = happyShift action_43
action_29 (20) = happyGoto action_30
action_29 _ = happyReduce_8

action_30 (21) = happyShift action_6
action_30 (22) = happyShift action_7
action_30 (27) = happyShift action_8
action_30 (28) = happyShift action_9
action_30 (29) = happyShift action_10
action_30 (31) = happyShift action_11
action_30 (43) = happyShift action_12
action_30 (48) = happyShift action_13
action_30 (50) = happyShift action_14
action_30 (53) = happyShift action_15
action_30 (5) = happyGoto action_44
action_30 (6) = happyGoto action_3
action_30 (14) = happyGoto action_4
action_30 (19) = happyGoto action_5
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_38

action_32 _ = happyReduce_39

action_33 _ = happyReduce_40

action_34 _ = happyReduce_41

action_35 _ = happyReduce_42

action_36 _ = happyReduce_43

action_37 _ = happyReduce_44

action_38 _ = happyReduce_45

action_39 _ = happyReduce_46

action_40 _ = happyReduce_47

action_41 _ = happyReduce_48

action_42 _ = happyReduce_49

action_43 _ = happyReduce_50

action_44 (30) = happyShift action_31
action_44 (31) = happyShift action_32
action_44 (32) = happyShift action_33
action_44 (33) = happyShift action_34
action_44 (34) = happyShift action_35
action_44 (35) = happyShift action_36
action_44 (36) = happyShift action_37
action_44 (37) = happyShift action_38
action_44 (38) = happyShift action_39
action_44 (39) = happyShift action_40
action_44 (40) = happyShift action_41
action_44 (41) = happyShift action_42
action_44 (42) = happyShift action_43
action_44 (20) = happyGoto action_30
action_44 _ = happyReduce_9

action_45 (21) = happyShift action_6
action_45 (22) = happyShift action_7
action_45 (27) = happyShift action_8
action_45 (28) = happyShift action_9
action_45 (29) = happyShift action_10
action_45 (31) = happyShift action_11
action_45 (43) = happyShift action_12
action_45 (48) = happyShift action_13
action_45 (50) = happyShift action_14
action_45 (53) = happyShift action_15
action_45 (5) = happyGoto action_66
action_45 (6) = happyGoto action_3
action_45 (14) = happyGoto action_4
action_45 (19) = happyGoto action_5
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_14

action_47 (21) = happyShift action_6
action_47 (22) = happyShift action_7
action_47 (27) = happyShift action_8
action_47 (28) = happyShift action_9
action_47 (29) = happyShift action_10
action_47 (31) = happyShift action_11
action_47 (43) = happyShift action_12
action_47 (48) = happyShift action_13
action_47 (50) = happyShift action_14
action_47 (53) = happyShift action_15
action_47 (5) = happyGoto action_65
action_47 (6) = happyGoto action_3
action_47 (14) = happyGoto action_4
action_47 (19) = happyGoto action_5
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (43) = happyShift action_64
action_48 (16) = happyGoto action_62
action_48 (17) = happyGoto action_63
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (30) = happyShift action_31
action_49 (31) = happyShift action_32
action_49 (32) = happyShift action_33
action_49 (33) = happyShift action_34
action_49 (34) = happyShift action_35
action_49 (35) = happyShift action_36
action_49 (36) = happyShift action_37
action_49 (37) = happyShift action_38
action_49 (38) = happyShift action_39
action_49 (39) = happyShift action_40
action_49 (40) = happyShift action_41
action_49 (41) = happyShift action_42
action_49 (42) = happyShift action_43
action_49 (45) = happyShift action_61
action_49 (20) = happyGoto action_30
action_49 _ = happyReduce_26

action_50 (44) = happyShift action_60
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (23) = happyShift action_57
action_51 (24) = happyShift action_58
action_51 (44) = happyShift action_59
action_51 (11) = happyGoto action_54
action_51 (12) = happyGoto action_55
action_51 (13) = happyGoto action_56
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (21) = happyShift action_6
action_52 (22) = happyShift action_7
action_52 (27) = happyShift action_8
action_52 (28) = happyShift action_9
action_52 (29) = happyShift action_10
action_52 (31) = happyShift action_11
action_52 (43) = happyShift action_12
action_52 (48) = happyShift action_13
action_52 (50) = happyShift action_14
action_52 (53) = happyShift action_15
action_52 (5) = happyGoto action_53
action_52 (6) = happyGoto action_3
action_52 (14) = happyGoto action_4
action_52 (19) = happyGoto action_5
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (30) = happyShift action_31
action_53 (31) = happyShift action_32
action_53 (32) = happyShift action_33
action_53 (33) = happyShift action_34
action_53 (34) = happyShift action_35
action_53 (35) = happyShift action_36
action_53 (36) = happyShift action_37
action_53 (37) = happyShift action_38
action_53 (38) = happyShift action_39
action_53 (39) = happyShift action_40
action_53 (40) = happyShift action_41
action_53 (41) = happyShift action_42
action_53 (42) = happyShift action_43
action_53 (20) = happyGoto action_30
action_53 _ = happyReduce_17

action_54 (53) = happyShift action_77
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (44) = happyShift action_76
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (45) = happyShift action_75
action_56 _ = happyReduce_22

action_57 _ = happyReduce_20

action_58 _ = happyReduce_21

action_59 (26) = happyShift action_74
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_25

action_61 (21) = happyShift action_6
action_61 (22) = happyShift action_7
action_61 (27) = happyShift action_8
action_61 (28) = happyShift action_9
action_61 (29) = happyShift action_10
action_61 (31) = happyShift action_11
action_61 (43) = happyShift action_12
action_61 (48) = happyShift action_13
action_61 (50) = happyShift action_14
action_61 (53) = happyShift action_15
action_61 (5) = happyGoto action_49
action_61 (6) = happyGoto action_3
action_61 (14) = happyGoto action_4
action_61 (15) = happyGoto action_73
action_61 (19) = happyGoto action_5
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_7

action_63 (43) = happyShift action_64
action_63 (16) = happyGoto action_72
action_63 (17) = happyGoto action_63
action_63 _ = happyReduce_28

action_64 (21) = happyShift action_6
action_64 (22) = happyShift action_7
action_64 (25) = happyShift action_70
action_64 (43) = happyShift action_12
action_64 (53) = happyShift action_71
action_64 (6) = happyGoto action_68
action_64 (18) = happyGoto action_69
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (30) = happyShift action_31
action_65 (31) = happyShift action_32
action_65 (32) = happyShift action_33
action_65 (33) = happyShift action_34
action_65 (34) = happyShift action_35
action_65 (35) = happyShift action_36
action_65 (36) = happyShift action_37
action_65 (37) = happyShift action_38
action_65 (38) = happyShift action_39
action_65 (39) = happyShift action_40
action_65 (40) = happyShift action_41
action_65 (41) = happyShift action_42
action_65 (42) = happyShift action_43
action_65 (20) = happyGoto action_30
action_65 _ = happyReduce_4

action_66 (30) = happyShift action_31
action_66 (31) = happyShift action_32
action_66 (32) = happyShift action_33
action_66 (33) = happyShift action_34
action_66 (34) = happyShift action_35
action_66 (35) = happyShift action_36
action_66 (36) = happyShift action_37
action_66 (37) = happyShift action_38
action_66 (38) = happyShift action_39
action_66 (39) = happyShift action_40
action_66 (40) = happyShift action_41
action_66 (41) = happyShift action_42
action_66 (42) = happyShift action_43
action_66 (44) = happyShift action_67
action_66 (20) = happyGoto action_30
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_12

action_68 _ = happyReduce_31

action_69 (46) = happyShift action_81
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_33

action_71 _ = happyReduce_32

action_72 _ = happyReduce_29

action_73 _ = happyReduce_27

action_74 (21) = happyShift action_6
action_74 (22) = happyShift action_7
action_74 (27) = happyShift action_8
action_74 (28) = happyShift action_9
action_74 (29) = happyShift action_10
action_74 (31) = happyShift action_11
action_74 (43) = happyShift action_12
action_74 (48) = happyShift action_13
action_74 (50) = happyShift action_14
action_74 (53) = happyShift action_15
action_74 (5) = happyGoto action_80
action_74 (6) = happyGoto action_3
action_74 (14) = happyGoto action_4
action_74 (19) = happyGoto action_5
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (23) = happyShift action_57
action_75 (24) = happyShift action_58
action_75 (11) = happyGoto action_54
action_75 (12) = happyGoto action_79
action_75 (13) = happyGoto action_56
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (26) = happyShift action_78
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_24

action_78 (21) = happyShift action_6
action_78 (22) = happyShift action_7
action_78 (27) = happyShift action_8
action_78 (28) = happyShift action_9
action_78 (29) = happyShift action_10
action_78 (31) = happyShift action_11
action_78 (43) = happyShift action_12
action_78 (48) = happyShift action_13
action_78 (50) = happyShift action_14
action_78 (53) = happyShift action_15
action_78 (5) = happyGoto action_83
action_78 (6) = happyGoto action_3
action_78 (14) = happyGoto action_4
action_78 (19) = happyGoto action_5
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_23

action_80 (30) = happyShift action_31
action_80 (31) = happyShift action_32
action_80 (32) = happyShift action_33
action_80 (33) = happyShift action_34
action_80 (34) = happyShift action_35
action_80 (35) = happyShift action_36
action_80 (36) = happyShift action_37
action_80 (37) = happyShift action_38
action_80 (38) = happyShift action_39
action_80 (39) = happyShift action_40
action_80 (40) = happyShift action_41
action_80 (41) = happyShift action_42
action_80 (42) = happyShift action_43
action_80 (20) = happyGoto action_30
action_80 _ = happyReduce_19

action_81 (21) = happyShift action_6
action_81 (22) = happyShift action_7
action_81 (27) = happyShift action_8
action_81 (28) = happyShift action_9
action_81 (29) = happyShift action_10
action_81 (31) = happyShift action_11
action_81 (43) = happyShift action_12
action_81 (48) = happyShift action_13
action_81 (50) = happyShift action_14
action_81 (53) = happyShift action_15
action_81 (5) = happyGoto action_82
action_81 (6) = happyGoto action_3
action_81 (14) = happyGoto action_4
action_81 (19) = happyGoto action_5
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (30) = happyShift action_31
action_82 (31) = happyShift action_32
action_82 (32) = happyShift action_33
action_82 (33) = happyShift action_34
action_82 (34) = happyShift action_35
action_82 (35) = happyShift action_36
action_82 (36) = happyShift action_37
action_82 (37) = happyShift action_38
action_82 (38) = happyShift action_39
action_82 (39) = happyShift action_40
action_82 (40) = happyShift action_41
action_82 (41) = happyShift action_42
action_82 (42) = happyShift action_43
action_82 (44) = happyShift action_84
action_82 (20) = happyGoto action_30
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (30) = happyShift action_31
action_83 (31) = happyShift action_32
action_83 (32) = happyShift action_33
action_83 (33) = happyShift action_34
action_83 (34) = happyShift action_35
action_83 (35) = happyShift action_36
action_83 (36) = happyShift action_37
action_83 (37) = happyShift action_38
action_83 (38) = happyShift action_39
action_83 (39) = happyShift action_40
action_83 (40) = happyShift action_41
action_83 (41) = happyShift action_42
action_83 (42) = happyShift action_43
action_83 (20) = happyGoto action_30
action_83 _ = happyReduce_18

action_84 _ = happyReduce_30

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Language.Expr happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn4
		 (Language.Def happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Language.ELet happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyTerminal (Lexer.TName happy_var_1))
	 =  HappyAbsSyn5
		 (Language.EVar happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  5 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Language.EValue happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 5 happyReduction_7
happyReduction_7 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Language.ECaseOf happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_2  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn5
		 (Language.EUnary happy_var_1 happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Language.EBinary happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyTerminal (Lexer.TInt happy_var_1))
	 =  HappyAbsSyn6
		 (Language.VInt happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  6 happyReduction_11
happyReduction_11 (HappyTerminal (Lexer.TBool happy_var_1))
	 =  HappyAbsSyn6
		 (Language.VBool happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 6 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Language.VTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 9 happyReduction_17
happyReduction_17 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Language.Definition happy_var_2 [] happy_var_4
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 7 10 happyReduction_18
happyReduction_18 ((HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Language.Definition happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 6 10 happyReduction_19
happyReduction_19 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Language.Definition happy_var_2 [] happy_var_6
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn11
		 (Language.TInteger
	)

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn11
		 (Language.TBoolean
	)

happyReduce_22 = happySpecReduce_1  12 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1:happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  13 happyReduction_24
happyReduction_24 (HappyTerminal (Lexer.TName happy_var_2))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn13
		 (Language.Arg happy_var_1 happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 14 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Language.EApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_1  15 happyReduction_26
happyReduction_26 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  15 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1:happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  16 happyReduction_28
happyReduction_28 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  16 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1:happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 5 17 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_1  18 happyReduction_31
happyReduction_31 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn18
		 (Language.PValue happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  18 happyReduction_32
happyReduction_32 (HappyTerminal (Lexer.TName happy_var_1))
	 =  HappyAbsSyn18
		 (Language.PVar happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  18 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn18
		 (Language.PUniversal
	)

happyReduce_34 = happySpecReduce_1  19 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn19
		 (Language.Operator Language.Arithmetic "-"
	)

happyReduce_35 = happySpecReduce_1  19 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn19
		 (Language.Operator Language.Logical "!"
	)

happyReduce_36 = happySpecReduce_1  19 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn19
		 (Language.Operator Language.Arithmetic "++"
	)

happyReduce_37 = happySpecReduce_1  19 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn19
		 (Language.Operator Language.Arithmetic "--"
	)

happyReduce_38 = happySpecReduce_1  20 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Arithmetic "+"
	)

happyReduce_39 = happySpecReduce_1  20 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Arithmetic "-"
	)

happyReduce_40 = happySpecReduce_1  20 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Arithmetic "*"
	)

happyReduce_41 = happySpecReduce_1  20 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Arithmetic "/"
	)

happyReduce_42 = happySpecReduce_1  20 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Arithmetic "%"
	)

happyReduce_43 = happySpecReduce_1  20 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Relational ">"
	)

happyReduce_44 = happySpecReduce_1  20 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Relational "<"
	)

happyReduce_45 = happySpecReduce_1  20 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Relational ">="
	)

happyReduce_46 = happySpecReduce_1  20 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Relational "<="
	)

happyReduce_47 = happySpecReduce_1  20 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Comparison "=="
	)

happyReduce_48 = happySpecReduce_1  20 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Comparison "!="
	)

happyReduce_49 = happySpecReduce_1  20 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Logical "&&"
	)

happyReduce_50 = happySpecReduce_1  20 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn20
		 (Language.Operator Language.Logical "||"
	)

happyNewToken action sts stk [] =
	action 54 54 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Lexer.TInt happy_dollar_dollar -> cont 21;
	Lexer.TBool happy_dollar_dollar -> cont 22;
	Lexer.TType "Integer" -> cont 23;
	Lexer.TType "Boolean" -> cont 24;
	Lexer.TUniversal -> cont 25;
	Lexer.TEq -> cont 26;
	Lexer.TNot -> cont 27;
	Lexer.TPlusPlus -> cont 28;
	Lexer.TMinusMinus -> cont 29;
	Lexer.TPlus -> cont 30;
	Lexer.TMinus -> cont 31;
	Lexer.TMult -> cont 32;
	Lexer.TDiv -> cont 33;
	Lexer.TMod -> cont 34;
	Lexer.TGreater -> cont 35;
	Lexer.TLess -> cont 36;
	Lexer.TGreaterEqual -> cont 37;
	Lexer.TLessEqual -> cont 38;
	Lexer.TEqual -> cont 39;
	Lexer.TNotEqual -> cont 40;
	Lexer.TAnd -> cont 41;
	Lexer.TOr -> cont 42;
	Lexer.TLParen -> cont 43;
	Lexer.TRParen -> cont 44;
	Lexer.TComma -> cont 45;
	Lexer.TArrow -> cont 46;
	Lexer.TFunction -> cont 47;
	Lexer.TLet -> cont 48;
	Lexer.TIn -> cont 49;
	Lexer.TCase -> cont 50;
	Lexer.TOf -> cont 51;
	Lexer.TVar -> cont 52;
	Lexer.TName happy_dollar_dollar -> cont 53;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 54 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError x = error ("Parse error: " ++ show x)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
