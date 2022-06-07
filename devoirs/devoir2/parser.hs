{-# OPTIONS_GHC -w #-}
module Parser (parser) where
import Language
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24
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
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,320) ([0,29440,4097,107,0,371,27408,0,0,0,0,0,65152,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,29440,4097,74,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,371,18960,0,0,0,64,0,0,8448,0,29440,4097,74,0,0,16384,0,0,0,0,0,371,27408,0,0,0,0,0,371,18992,0,2048,0,0,0,65408,4111,0,0,0,37,0,0,0,0,0,4096,0,0,65408,79,0,0,0,0,0,371,18960,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,29440,4097,74,0,3,48,0,0,0,0,0,371,18960,0,0,4096,0,0,371,18960,0,32768,4095,0,0,0,96,0,0,0,0,0,0,0,0,29440,4097,74,0,65152,15,0,0,0,0,0,0,0,0,1792,4096,32,0,62336,15,0,0,0,64,0,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,768,4096,0,0,8,0,0,32768,12287,0,0,0,0,0,29440,4097,74,0,0,64,0,0,0,0,0,8,0,0,768,4096,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,65408,15,0,29440,4097,74,0,0,0,0,29440,4097,74,0,3,16,0,32768,4094,0,0,0,32,0,32768,4094,0,0,65408,47,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Statements","Statement","Expr","Value","Defs","Def","VarDef","Type","FuncDef","Params","Param","TypedTuple","FuncApp","FuncArgs","CaseOf","CasesOfPatterns","CaseOfPatterns","CaseOfPattern","UnaryOp","BinaryOp","App","'int'","'bool'","'_'","'='","'!'","'++'","'--'","'+'","'-'","'*'","'/'","'%'","'>'","'<'","'>='","'<='","'=='","'!='","'&&'","'||'","'('","')'","','","'->'","'func'","'let'","'in'","'case'","'of'","'var'","'name'","%eof"]
        bit_start = st Prelude.* 56
        bit_end = (st Prelude.+ 1) Prelude.* 56
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..55]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (25) = happyShift action_11
action_0 (26) = happyShift action_12
action_0 (29) = happyShift action_13
action_0 (30) = happyShift action_14
action_0 (31) = happyShift action_15
action_0 (33) = happyShift action_16
action_0 (45) = happyShift action_17
action_0 (49) = happyShift action_18
action_0 (50) = happyShift action_19
action_0 (52) = happyShift action_20
action_0 (54) = happyShift action_21
action_0 (55) = happyShift action_22
action_0 (4) = happyGoto action_23
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (9) = happyGoto action_5
action_0 (10) = happyGoto action_6
action_0 (12) = happyGoto action_7
action_0 (16) = happyGoto action_8
action_0 (18) = happyGoto action_9
action_0 (22) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (25) = happyShift action_11
action_1 (26) = happyShift action_12
action_1 (29) = happyShift action_13
action_1 (30) = happyShift action_14
action_1 (31) = happyShift action_15
action_1 (33) = happyShift action_16
action_1 (45) = happyShift action_17
action_1 (49) = happyShift action_18
action_1 (50) = happyShift action_19
action_1 (52) = happyShift action_20
action_1 (54) = happyShift action_21
action_1 (55) = happyShift action_22
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (9) = happyGoto action_5
action_1 (10) = happyGoto action_6
action_1 (12) = happyGoto action_7
action_1 (16) = happyGoto action_8
action_1 (18) = happyGoto action_9
action_1 (22) = happyGoto action_10
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (32) = happyShift action_34
action_3 (33) = happyShift action_35
action_3 (34) = happyShift action_36
action_3 (35) = happyShift action_37
action_3 (36) = happyShift action_38
action_3 (37) = happyShift action_39
action_3 (38) = happyShift action_40
action_3 (39) = happyShift action_41
action_3 (40) = happyShift action_42
action_3 (41) = happyShift action_43
action_3 (42) = happyShift action_44
action_3 (43) = happyShift action_45
action_3 (44) = happyShift action_46
action_3 (23) = happyGoto action_33
action_3 _ = happyReduce_3

action_4 _ = happyReduce_8

action_5 _ = happyReduce_4

action_6 _ = happyReduce_17

action_7 _ = happyReduce_18

action_8 _ = happyReduce_5

action_9 _ = happyReduce_9

action_10 (25) = happyShift action_11
action_10 (26) = happyShift action_12
action_10 (29) = happyShift action_13
action_10 (30) = happyShift action_14
action_10 (31) = happyShift action_15
action_10 (33) = happyShift action_16
action_10 (45) = happyShift action_17
action_10 (50) = happyShift action_19
action_10 (52) = happyShift action_20
action_10 (55) = happyShift action_22
action_10 (6) = happyGoto action_32
action_10 (7) = happyGoto action_4
action_10 (16) = happyGoto action_8
action_10 (18) = happyGoto action_9
action_10 (22) = happyGoto action_10
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_12

action_12 _ = happyReduce_13

action_13 _ = happyReduce_42

action_14 _ = happyReduce_43

action_15 _ = happyReduce_44

action_16 _ = happyReduce_41

action_17 (25) = happyShift action_11
action_17 (26) = happyShift action_12
action_17 (29) = happyShift action_13
action_17 (30) = happyShift action_14
action_17 (31) = happyShift action_15
action_17 (33) = happyShift action_16
action_17 (45) = happyShift action_17
action_17 (50) = happyShift action_19
action_17 (52) = happyShift action_20
action_17 (55) = happyShift action_22
action_17 (6) = happyGoto action_31
action_17 (7) = happyGoto action_4
action_17 (16) = happyGoto action_8
action_17 (18) = happyGoto action_9
action_17 (22) = happyGoto action_10
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (55) = happyShift action_30
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (49) = happyShift action_18
action_19 (54) = happyShift action_21
action_19 (8) = happyGoto action_28
action_19 (9) = happyGoto action_29
action_19 (10) = happyGoto action_6
action_19 (12) = happyGoto action_7
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (25) = happyShift action_11
action_20 (26) = happyShift action_12
action_20 (29) = happyShift action_13
action_20 (30) = happyShift action_14
action_20 (31) = happyShift action_15
action_20 (33) = happyShift action_16
action_20 (45) = happyShift action_17
action_20 (50) = happyShift action_19
action_20 (52) = happyShift action_20
action_20 (55) = happyShift action_22
action_20 (6) = happyGoto action_27
action_20 (7) = happyGoto action_4
action_20 (16) = happyGoto action_8
action_20 (18) = happyGoto action_9
action_20 (22) = happyGoto action_10
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (55) = happyShift action_26
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (45) = happyShift action_25
action_22 _ = happyReduce_7

action_23 (25) = happyShift action_11
action_23 (26) = happyShift action_12
action_23 (29) = happyShift action_13
action_23 (30) = happyShift action_14
action_23 (31) = happyShift action_15
action_23 (33) = happyShift action_16
action_23 (45) = happyShift action_17
action_23 (49) = happyShift action_18
action_23 (50) = happyShift action_19
action_23 (52) = happyShift action_20
action_23 (54) = happyShift action_21
action_23 (55) = happyShift action_22
action_23 (56) = happyAccept
action_23 (5) = happyGoto action_24
action_23 (6) = happyGoto action_3
action_23 (7) = happyGoto action_4
action_23 (9) = happyGoto action_5
action_23 (10) = happyGoto action_6
action_23 (12) = happyGoto action_7
action_23 (16) = happyGoto action_8
action_23 (18) = happyGoto action_9
action_23 (22) = happyGoto action_10
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_2

action_25 (25) = happyShift action_11
action_25 (26) = happyShift action_12
action_25 (29) = happyShift action_13
action_25 (30) = happyShift action_14
action_25 (31) = happyShift action_15
action_25 (33) = happyShift action_16
action_25 (45) = happyShift action_17
action_25 (46) = happyShift action_56
action_25 (50) = happyShift action_19
action_25 (52) = happyShift action_20
action_25 (55) = happyShift action_22
action_25 (6) = happyGoto action_54
action_25 (7) = happyGoto action_4
action_25 (16) = happyGoto action_8
action_25 (17) = happyGoto action_55
action_25 (18) = happyGoto action_9
action_25 (22) = happyGoto action_10
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (28) = happyShift action_53
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (32) = happyShift action_34
action_27 (33) = happyShift action_35
action_27 (34) = happyShift action_36
action_27 (35) = happyShift action_37
action_27 (36) = happyShift action_38
action_27 (37) = happyShift action_39
action_27 (38) = happyShift action_40
action_27 (39) = happyShift action_41
action_27 (40) = happyShift action_42
action_27 (41) = happyShift action_43
action_27 (42) = happyShift action_44
action_27 (43) = happyShift action_45
action_27 (44) = happyShift action_46
action_27 (53) = happyShift action_52
action_27 (23) = happyGoto action_33
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (49) = happyShift action_18
action_28 (51) = happyShift action_51
action_28 (54) = happyShift action_21
action_28 (9) = happyGoto action_50
action_28 (10) = happyGoto action_6
action_28 (12) = happyGoto action_7
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_15

action_30 (45) = happyShift action_49
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (32) = happyShift action_34
action_31 (33) = happyShift action_35
action_31 (34) = happyShift action_36
action_31 (35) = happyShift action_37
action_31 (36) = happyShift action_38
action_31 (37) = happyShift action_39
action_31 (38) = happyShift action_40
action_31 (39) = happyShift action_41
action_31 (40) = happyShift action_42
action_31 (41) = happyShift action_43
action_31 (42) = happyShift action_44
action_31 (43) = happyShift action_45
action_31 (44) = happyShift action_46
action_31 (47) = happyShift action_48
action_31 (23) = happyGoto action_33
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (32) = happyShift action_34
action_32 (33) = happyShift action_35
action_32 (34) = happyShift action_36
action_32 (35) = happyShift action_37
action_32 (36) = happyShift action_38
action_32 (37) = happyShift action_39
action_32 (38) = happyShift action_40
action_32 (39) = happyShift action_41
action_32 (40) = happyShift action_42
action_32 (41) = happyShift action_43
action_32 (42) = happyShift action_44
action_32 (43) = happyShift action_45
action_32 (44) = happyShift action_46
action_32 (23) = happyGoto action_33
action_32 _ = happyReduce_10

action_33 (25) = happyShift action_11
action_33 (26) = happyShift action_12
action_33 (29) = happyShift action_13
action_33 (30) = happyShift action_14
action_33 (31) = happyShift action_15
action_33 (33) = happyShift action_16
action_33 (45) = happyShift action_17
action_33 (50) = happyShift action_19
action_33 (52) = happyShift action_20
action_33 (55) = happyShift action_22
action_33 (6) = happyGoto action_47
action_33 (7) = happyGoto action_4
action_33 (16) = happyGoto action_8
action_33 (18) = happyGoto action_9
action_33 (22) = happyGoto action_10
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_45

action_35 _ = happyReduce_46

action_36 _ = happyReduce_47

action_37 _ = happyReduce_48

action_38 _ = happyReduce_49

action_39 _ = happyReduce_50

action_40 _ = happyReduce_51

action_41 _ = happyReduce_52

action_42 _ = happyReduce_53

action_43 _ = happyReduce_54

action_44 _ = happyReduce_55

action_45 _ = happyReduce_56

action_46 _ = happyReduce_57

action_47 (32) = happyShift action_34
action_47 (33) = happyShift action_35
action_47 (34) = happyShift action_36
action_47 (35) = happyShift action_37
action_47 (36) = happyShift action_38
action_47 (37) = happyShift action_39
action_47 (38) = happyShift action_40
action_47 (39) = happyShift action_41
action_47 (40) = happyShift action_42
action_47 (41) = happyShift action_43
action_47 (42) = happyShift action_44
action_47 (43) = happyShift action_45
action_47 (44) = happyShift action_46
action_47 (23) = happyGoto action_33
action_47 _ = happyReduce_11

action_48 (25) = happyShift action_11
action_48 (26) = happyShift action_12
action_48 (29) = happyShift action_13
action_48 (30) = happyShift action_14
action_48 (31) = happyShift action_15
action_48 (33) = happyShift action_16
action_48 (45) = happyShift action_17
action_48 (50) = happyShift action_19
action_48 (52) = happyShift action_20
action_48 (55) = happyShift action_22
action_48 (6) = happyGoto action_72
action_48 (7) = happyGoto action_4
action_48 (16) = happyGoto action_8
action_48 (18) = happyGoto action_9
action_48 (22) = happyGoto action_10
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (25) = happyShift action_68
action_49 (26) = happyShift action_69
action_49 (45) = happyShift action_70
action_49 (46) = happyShift action_71
action_49 (11) = happyGoto action_64
action_49 (13) = happyGoto action_65
action_49 (14) = happyGoto action_66
action_49 (15) = happyGoto action_67
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_16

action_51 (25) = happyShift action_11
action_51 (26) = happyShift action_12
action_51 (29) = happyShift action_13
action_51 (30) = happyShift action_14
action_51 (31) = happyShift action_15
action_51 (33) = happyShift action_16
action_51 (45) = happyShift action_17
action_51 (50) = happyShift action_19
action_51 (52) = happyShift action_20
action_51 (55) = happyShift action_22
action_51 (6) = happyGoto action_63
action_51 (7) = happyGoto action_4
action_51 (16) = happyGoto action_8
action_51 (18) = happyGoto action_9
action_51 (22) = happyGoto action_10
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (45) = happyShift action_62
action_52 (19) = happyGoto action_60
action_52 (20) = happyGoto action_61
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (25) = happyShift action_11
action_53 (26) = happyShift action_12
action_53 (29) = happyShift action_13
action_53 (30) = happyShift action_14
action_53 (31) = happyShift action_15
action_53 (33) = happyShift action_16
action_53 (45) = happyShift action_17
action_53 (50) = happyShift action_19
action_53 (52) = happyShift action_20
action_53 (55) = happyShift action_22
action_53 (6) = happyGoto action_59
action_53 (7) = happyGoto action_4
action_53 (16) = happyGoto action_8
action_53 (18) = happyGoto action_9
action_53 (22) = happyGoto action_10
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (32) = happyShift action_34
action_54 (33) = happyShift action_35
action_54 (34) = happyShift action_36
action_54 (35) = happyShift action_37
action_54 (36) = happyShift action_38
action_54 (37) = happyShift action_39
action_54 (38) = happyShift action_40
action_54 (39) = happyShift action_41
action_54 (40) = happyShift action_42
action_54 (41) = happyShift action_43
action_54 (42) = happyShift action_44
action_54 (43) = happyShift action_45
action_54 (44) = happyShift action_46
action_54 (23) = happyGoto action_33
action_54 _ = happyReduce_32

action_55 (46) = happyShift action_57
action_55 (47) = happyShift action_58
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_31

action_57 _ = happyReduce_30

action_58 (25) = happyShift action_11
action_58 (26) = happyShift action_12
action_58 (29) = happyShift action_13
action_58 (30) = happyShift action_14
action_58 (31) = happyShift action_15
action_58 (33) = happyShift action_16
action_58 (45) = happyShift action_17
action_58 (50) = happyShift action_19
action_58 (52) = happyShift action_20
action_58 (55) = happyShift action_22
action_58 (6) = happyGoto action_85
action_58 (7) = happyGoto action_4
action_58 (16) = happyGoto action_8
action_58 (18) = happyGoto action_9
action_58 (22) = happyGoto action_10
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (32) = happyShift action_34
action_59 (33) = happyShift action_35
action_59 (34) = happyShift action_36
action_59 (35) = happyShift action_37
action_59 (36) = happyShift action_38
action_59 (37) = happyShift action_39
action_59 (38) = happyShift action_40
action_59 (39) = happyShift action_41
action_59 (40) = happyShift action_42
action_59 (41) = happyShift action_43
action_59 (42) = happyShift action_44
action_59 (43) = happyShift action_45
action_59 (44) = happyShift action_46
action_59 (23) = happyGoto action_33
action_59 _ = happyReduce_19

action_60 (45) = happyShift action_62
action_60 (20) = happyGoto action_84
action_60 _ = happyReduce_34

action_61 _ = happyReduce_35

action_62 (25) = happyShift action_11
action_62 (26) = happyShift action_12
action_62 (27) = happyShift action_82
action_62 (45) = happyShift action_17
action_62 (54) = happyShift action_83
action_62 (7) = happyGoto action_80
action_62 (21) = happyGoto action_81
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (32) = happyShift action_34
action_63 (33) = happyShift action_35
action_63 (34) = happyShift action_36
action_63 (35) = happyShift action_37
action_63 (36) = happyShift action_38
action_63 (37) = happyShift action_39
action_63 (38) = happyShift action_40
action_63 (39) = happyShift action_41
action_63 (40) = happyShift action_42
action_63 (41) = happyShift action_43
action_63 (42) = happyShift action_44
action_63 (43) = happyShift action_45
action_63 (44) = happyShift action_46
action_63 (23) = happyGoto action_33
action_63 _ = happyReduce_6

action_64 (55) = happyShift action_79
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (46) = happyShift action_77
action_65 (47) = happyShift action_78
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_25

action_67 (55) = happyShift action_76
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_20

action_69 _ = happyReduce_21

action_70 (25) = happyShift action_68
action_70 (26) = happyShift action_69
action_70 (45) = happyShift action_70
action_70 (11) = happyGoto action_64
action_70 (14) = happyGoto action_75
action_70 (15) = happyGoto action_67
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (28) = happyShift action_74
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (32) = happyShift action_34
action_72 (33) = happyShift action_35
action_72 (34) = happyShift action_36
action_72 (35) = happyShift action_37
action_72 (36) = happyShift action_38
action_72 (37) = happyShift action_39
action_72 (38) = happyShift action_40
action_72 (39) = happyShift action_41
action_72 (40) = happyShift action_42
action_72 (41) = happyShift action_43
action_72 (42) = happyShift action_44
action_72 (43) = happyShift action_45
action_72 (44) = happyShift action_46
action_72 (46) = happyShift action_73
action_72 (23) = happyGoto action_33
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_14

action_74 (25) = happyShift action_11
action_74 (26) = happyShift action_12
action_74 (29) = happyShift action_13
action_74 (30) = happyShift action_14
action_74 (31) = happyShift action_15
action_74 (33) = happyShift action_16
action_74 (45) = happyShift action_17
action_74 (50) = happyShift action_19
action_74 (52) = happyShift action_20
action_74 (55) = happyShift action_22
action_74 (6) = happyGoto action_90
action_74 (7) = happyGoto action_4
action_74 (16) = happyGoto action_8
action_74 (18) = happyGoto action_9
action_74 (22) = happyGoto action_10
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (47) = happyShift action_89
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_28

action_77 (28) = happyShift action_88
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (25) = happyShift action_68
action_78 (26) = happyShift action_69
action_78 (45) = happyShift action_70
action_78 (11) = happyGoto action_64
action_78 (14) = happyGoto action_87
action_78 (15) = happyGoto action_67
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_27

action_80 _ = happyReduce_38

action_81 (48) = happyShift action_86
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_40

action_83 _ = happyReduce_39

action_84 _ = happyReduce_36

action_85 (32) = happyShift action_34
action_85 (33) = happyShift action_35
action_85 (34) = happyShift action_36
action_85 (35) = happyShift action_37
action_85 (36) = happyShift action_38
action_85 (37) = happyShift action_39
action_85 (38) = happyShift action_40
action_85 (39) = happyShift action_41
action_85 (40) = happyShift action_42
action_85 (41) = happyShift action_43
action_85 (42) = happyShift action_44
action_85 (43) = happyShift action_45
action_85 (44) = happyShift action_46
action_85 (23) = happyGoto action_33
action_85 _ = happyReduce_33

action_86 (25) = happyShift action_11
action_86 (26) = happyShift action_12
action_86 (29) = happyShift action_13
action_86 (30) = happyShift action_14
action_86 (31) = happyShift action_15
action_86 (33) = happyShift action_16
action_86 (45) = happyShift action_17
action_86 (50) = happyShift action_19
action_86 (52) = happyShift action_20
action_86 (55) = happyShift action_22
action_86 (6) = happyGoto action_93
action_86 (7) = happyGoto action_4
action_86 (16) = happyGoto action_8
action_86 (18) = happyGoto action_9
action_86 (22) = happyGoto action_10
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_26

action_88 (25) = happyShift action_11
action_88 (26) = happyShift action_12
action_88 (29) = happyShift action_13
action_88 (30) = happyShift action_14
action_88 (31) = happyShift action_15
action_88 (33) = happyShift action_16
action_88 (45) = happyShift action_17
action_88 (50) = happyShift action_19
action_88 (52) = happyShift action_20
action_88 (55) = happyShift action_22
action_88 (6) = happyGoto action_92
action_88 (7) = happyGoto action_4
action_88 (16) = happyGoto action_8
action_88 (18) = happyGoto action_9
action_88 (22) = happyGoto action_10
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (25) = happyShift action_68
action_89 (26) = happyShift action_69
action_89 (45) = happyShift action_70
action_89 (11) = happyGoto action_64
action_89 (14) = happyGoto action_91
action_89 (15) = happyGoto action_67
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (32) = happyShift action_34
action_90 (33) = happyShift action_35
action_90 (34) = happyShift action_36
action_90 (35) = happyShift action_37
action_90 (36) = happyShift action_38
action_90 (37) = happyShift action_39
action_90 (38) = happyShift action_40
action_90 (39) = happyShift action_41
action_90 (40) = happyShift action_42
action_90 (41) = happyShift action_43
action_90 (42) = happyShift action_44
action_90 (43) = happyShift action_45
action_90 (44) = happyShift action_46
action_90 (23) = happyGoto action_33
action_90 _ = happyReduce_24

action_91 (46) = happyShift action_95
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (32) = happyShift action_34
action_92 (33) = happyShift action_35
action_92 (34) = happyShift action_36
action_92 (35) = happyShift action_37
action_92 (36) = happyShift action_38
action_92 (37) = happyShift action_39
action_92 (38) = happyShift action_40
action_92 (39) = happyShift action_41
action_92 (40) = happyShift action_42
action_92 (41) = happyShift action_43
action_92 (42) = happyShift action_44
action_92 (43) = happyShift action_45
action_92 (44) = happyShift action_46
action_92 (23) = happyGoto action_33
action_92 _ = happyReduce_23

action_93 (32) = happyShift action_34
action_93 (33) = happyShift action_35
action_93 (34) = happyShift action_36
action_93 (35) = happyShift action_37
action_93 (36) = happyShift action_38
action_93 (37) = happyShift action_39
action_93 (38) = happyShift action_40
action_93 (39) = happyShift action_41
action_93 (40) = happyShift action_42
action_93 (41) = happyShift action_43
action_93 (42) = happyShift action_44
action_93 (43) = happyShift action_45
action_93 (44) = happyShift action_46
action_93 (46) = happyShift action_94
action_93 (23) = happyGoto action_33
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_37

action_95 _ = happyReduce_29

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Language.Expr happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn5
		 (Language.Def happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happyReduce 4 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Language.ELet happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyTerminal (Lexer.TName happy_var_1))
	 =  HappyAbsSyn6
		 (Language.EVar happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn6
		 (Language.EUnary happy_var_1 happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Language.EBinary happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 (HappyTerminal (Lexer.TInt happy_var_1))
	 =  HappyAbsSyn7
		 (Language.VInt happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  7 happyReduction_13
happyReduction_13 (HappyTerminal (Lexer.TBool happy_var_1))
	 =  HappyAbsSyn7
		 (Language.VBool happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 5 7 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Language.VTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 4 10 happyReduction_19
happyReduction_19 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Language.EVar happy_var_2
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn11
		 (Language.TInt
	)

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn11
		 (Language.TBool
	)

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn11
		 (Language.TTuple
	)

happyReduce_23 = happyReduce 7 12 happyReduction_23
happyReduction_23 ((HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Language.Def happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 12 happyReduction_24
happyReduction_24 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Language.Def happy_var_2 [] happy_var_6
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_1  13 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 _
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1:happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  14 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  14 happyReduction_28
happyReduction_28 (HappyTerminal (Lexer.TName happy_var_2))
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1:happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 5 15 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Language.TTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 4 16 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.TName happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Language.EApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_3  16 happyReduction_31
happyReduction_31 _
	_
	(HappyTerminal (Lexer.TName happy_var_1))
	 =  HappyAbsSyn16
		 (Language.EApp happy_var_1 []
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  17 happyReduction_32
happyReduction_32 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  17 happyReduction_33
happyReduction_33 _
	(HappyTerminal happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1:happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happyReduce 4 18 happyReduction_34
happyReduction_34 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Language.ECaseOf happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_1  19 happyReduction_35
happyReduction_35 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  19 happyReduction_36
happyReduction_36 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1:happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 5 20 happyReduction_37
happyReduction_37 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (happy_var_1
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_1  21 happyReduction_38
happyReduction_38 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn21
		 (Language.PValue happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  21 happyReduction_39
happyReduction_39 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn21
		 (Language.PVar happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  21 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn21
		 (Language.PUniversal
	)

happyReduce_41 = happySpecReduce_1  22 happyReduction_41
happyReduction_41 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn22
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  22 happyReduction_42
happyReduction_42 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn22
		 (Language.Operator Language.Logical happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  22 happyReduction_43
happyReduction_43 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn22
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  22 happyReduction_44
happyReduction_44 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn22
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  23 happyReduction_45
happyReduction_45 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  23 happyReduction_46
happyReduction_46 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  23 happyReduction_47
happyReduction_47 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  23 happyReduction_48
happyReduction_48 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  23 happyReduction_49
happyReduction_49 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Arithmetic happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  23 happyReduction_50
happyReduction_50 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Relational happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  23 happyReduction_51
happyReduction_51 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Relational happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  23 happyReduction_52
happyReduction_52 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Relational happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  23 happyReduction_53
happyReduction_53 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Relational happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  23 happyReduction_54
happyReduction_54 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Comparison happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Comparison happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Logical happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  23 happyReduction_57
happyReduction_57 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn23
		 (Language.Operator Language.Logical happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  24 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn24
		 (Language.Statement
	)

happyNewToken action sts stk [] =
	action 56 56 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Lexer.TInt happy_dollar_dollar -> cont 25;
	Lexer.TBool happy_dollar_dollar -> cont 26;
	Lexer.TUniversal -> cont 27;
	Lexer.TEq -> cont 28;
	Lexer.TNot -> cont 29;
	Lexer.TPlusPlus -> cont 30;
	Lexer.TMinusMinus -> cont 31;
	Lexer.TPlus -> cont 32;
	Lexer.TMinus -> cont 33;
	Lexer.TMult -> cont 34;
	Lexer.TDiv -> cont 35;
	Lexer.TMod -> cont 36;
	Lexer.TGreater -> cont 37;
	Lexer.TLess -> cont 38;
	Lexer.TGreaterEqual -> cont 39;
	Lexer.TLessEqual -> cont 40;
	Lexer.TEqual -> cont 41;
	Lexer.TNotEqual -> cont 42;
	Lexer.TAnd -> cont 43;
	Lexer.TOr -> cont 44;
	Lexer.TLParen -> cont 45;
	Lexer.TRParen -> cont 46;
	Lexer.TComma -> cont 47;
	Lexer.TArrow -> cont 48;
	Lexer.TFunction -> cont 49;
	Lexer.TLet -> cont 50;
	Lexer.TIn -> cont 51;
	Lexer.TCase -> cont 52;
	Lexer.TOf -> cont 53;
	Lexer.TVar -> cont 54;
	Lexer.TName happy_dollar_dollar -> cont 55;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 56 tk tks = happyError' (tks, explist)
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
parseError _ = error "Parse error test"
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
