------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------------------
entity DECODER is
port(OP1,OP2,OP3,OP4,OP5,OP6: in integer range 0 to 255;
     CLOCK: std_logic;
     OUTS: out integer range 0 to 2048);
end DECODER;
------------------------------------------
architecture behv of DECODER is
signal NEXT_OUTS: integer;
begin
  process(CLOCK)
  begin
    if(rising_edge(CLOCK)) then
      OUTS <= NEXT_OUTS;
    end if;
  end process;

  process(OP1,OP2,OP3,OP4,OP5,OP6)
  begin
    case OP1 is
        when 0 => NEXT_OUTS <= 809; -- addb_Eb_Gb SANITY
        when 1 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1579; -- addl_Ed_Gd SANITY
            when 1 => NEXT_OUTS <= 1598; -- decl_ERX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 2 => NEXT_OUTS <= 1045; -- addb_Gb_Eb SANITY
        when 3 => NEXT_OUTS <= 360; -- addl_Gd_Ed SANITY
        when 4 => NEXT_OUTS <= 1394; -- addb_AL_Ib SANITY
        when 5 => NEXT_OUTS <= 727; -- addl_EAX_Id SANITY
        when 6 => NEXT_OUTS <= 77; -- pushl_ES SANITY
        when 7 => NEXT_OUTS <= 1032; -- popl_ES SANITY
        when 8 => NEXT_OUTS <= 397; -- orb_Eb_Gb SANITY
        when 9 => NEXT_OUTS <= 513; -- orl_Ed_Gd SANITY
        when 10 => NEXT_OUTS <= 1378; -- orb_Gb_Eb SANITY
        when 11 => NEXT_OUTS <= 263; -- orl_Gd_Ed SANITY
        when 12 => NEXT_OUTS <= 557; -- orb_AL_Ib SANITY
        when 13 => NEXT_OUTS <= 93; -- orl_EAX_Id SANITY
        when 14 => NEXT_OUTS <= 730; -- pushl_CS SANITY
        when 15 => 
        case OP2 is
            when 0 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1423; -- sldt SANITY
                when 8 => NEXT_OUTS <= 1289; -- str SANITY
                when 16 => NEXT_OUTS <= 1312; -- lldt SANITY
                when 24 => NEXT_OUTS <= 383; -- ltr SANITY
                when 32 => NEXT_OUTS <= 420; -- verr SANITY
                when 40 => NEXT_OUTS <= 1447; -- verw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 1 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 811; -- sgdt SANITY
                when 8 => NEXT_OUTS <= 1446; -- sidt SANITY
                when 16 => NEXT_OUTS <= 1652; -- lgdt SANITY
                when 24 => NEXT_OUTS <= 1236; -- lidt SANITY
                when 32 => NEXT_OUTS <= 841; -- smsw_Ew SANITY
                when 48 => NEXT_OUTS <= 9; -- lmsw_Ew SANITY
                when 56 => NEXT_OUTS <= 700; -- invlpg SANITY
                when 193 => NEXT_OUTS <= 1483; -- vmcall SANITY
                when 194 => NEXT_OUTS <= 553; -- vmlaunch SANITY
                when 195 => NEXT_OUTS <= 205; -- vmresume SANITY
                when 196 => NEXT_OUTS <= 939; -- vmxoff SANITY
                when 200 => NEXT_OUTS <= 1497; -- monitor SANITY
                when 201 => NEXT_OUTS <= 489; -- mwait SANITY
                when 208 => NEXT_OUTS <= 1348; -- xgetbv SANITY
                when 209 => NEXT_OUTS <= 141; -- xsetbv SANITY
                when 248 => NEXT_OUTS <= 712; -- swapgs SANITY
                when 249 => NEXT_OUTS <= 262; -- rdtscp SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 2 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1586; -- larl_Gd_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 3 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 975; -- lsll_Gd_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 5 => NEXT_OUTS <= 628; -- syscall SANITY
            when 6 => NEXT_OUTS <= 100; -- clts SANITY
            when 7 => NEXT_OUTS <= 1049; -- sysret SANITY
            when 8 => NEXT_OUTS <= 367; -- invd SANITY
            when 9 => NEXT_OUTS <= 735; -- wbinvd SANITY
            when 11 => NEXT_OUTS <= 878; -- ud2a SANITY
            when 16 => NEXT_OUTS <= 155; -- movups_Vps_Wps SANITY
            when 17 => NEXT_OUTS <= 826; -- movups_Wps_Vps SANITY
            when 18 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1114; -- movlps_Vps_Mq SANITY
                when 192 => NEXT_OUTS <= 693; -- movhlps_Vps_Udq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 19 => NEXT_OUTS <= 1574; -- movlps_Mq_Vps SANITY
            when 20 => NEXT_OUTS <= 1511; -- unpcklps_Vps_Wps SANITY
            when 21 => NEXT_OUTS <= 1028; -- unpckhps_Vps_Wps SANITY
            when 22 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 625; -- movhps_Vps_Mq SANITY
                when 192 => NEXT_OUTS <= 1016; -- movlhps_Vps_Udq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 23 => NEXT_OUTS <= 74; -- movhps_Mq_Vps SANITY
            when 24 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1328; -- prefetchnta SANITY
                when 8 => NEXT_OUTS <= 886; -- prefetcht0 SANITY
                when 16 => NEXT_OUTS <= 7; -- prefetcht1 SANITY
                when 24 => NEXT_OUTS <= 522; -- prefetcht2 SANITY
                when 32 => NEXT_OUTS <= 412; -- prefetch_hint SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 25 => NEXT_OUTS <= 623; -- multibyte_nop SANITY
            when 32 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 881; -- movl_Rd_Cd SANITY
                when 1 => NEXT_OUTS <= 526; -- movq_Rq_Cq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 33 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1178; -- movl_Rd_Dd SANITY
                when 1 => NEXT_OUTS <= 596; -- movq_Rq_Dq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 34 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 722; -- movl_Cd_Rd SANITY
                when 1 => NEXT_OUTS <= 1375; -- movq_Cq_Rq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 35 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1354; -- movl_Dd_Rd SANITY
                when 1 => NEXT_OUTS <= 797; -- movq_Dq_Rq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 36 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 956; -- movl_Rd_Td SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 38 => NEXT_OUTS <= 919; -- movl_Td_Rd SANITY
            when 40 => NEXT_OUTS <= 457; -- movaps_Vps_Wps SANITY
            when 41 => NEXT_OUTS <= 1102; -- movaps_Wps_Vps SANITY
            when 42 => NEXT_OUTS <= 1098; -- cvtpi2ps_Vps_Qq SANITY
            when 43 => NEXT_OUTS <= 414; -- movntps_Mps_Vps SANITY
            when 44 => NEXT_OUTS <= 1105; -- cvttps2pi_Pq_Wps SANITY
            when 45 => NEXT_OUTS <= 6; -- cvtps2pi_Pq_Wps SANITY
            when 46 => NEXT_OUTS <= 4; -- ucomiss_Vss_Wss SANITY
            when 47 => NEXT_OUTS <= 877; -- comiss_Vss_Wss SANITY
            when 48 => NEXT_OUTS <= 923; -- wrmsr SANITY
            when 49 => NEXT_OUTS <= 1234; -- rdtsc SANITY
            when 50 => NEXT_OUTS <= 388; -- rdmsr SANITY
            when 51 => NEXT_OUTS <= 1416; -- rdpmc SANITY
            when 52 => NEXT_OUTS <= 1047; -- sysenter SANITY
            when 53 => NEXT_OUTS <= 45; -- sysexit SANITY
            when 55 => NEXT_OUTS <= 951; -- getsec SANITY
            when 56 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1435; -- pshufb_Pq_Qq SANITY
                when 1 => NEXT_OUTS <= 413; -- phaddw_Pq_Qq SANITY
                when 2 => NEXT_OUTS <= 1564; -- phaddd_Pq_Qq SANITY
                when 3 => NEXT_OUTS <= 19; -- phaddsw_Pq_Qq SANITY
                when 4 => NEXT_OUTS <= 245; -- pmaddubsw_Pq_Qq SANITY
                when 5 => NEXT_OUTS <= 470; -- phsubw_Pq_Qq SANITY
                when 6 => NEXT_OUTS <= 637; -- phsubd_Pq_Qq SANITY
                when 7 => NEXT_OUTS <= 11; -- phsubsw_Pq_Qq SANITY
                when 8 => NEXT_OUTS <= 753; -- psignb_Pq_Qq SANITY
                when 9 => NEXT_OUTS <= 997; -- psignw_Pq_Qq SANITY
                when 10 => NEXT_OUTS <= 458; -- psignd_Pq_Qq SANITY
                when 11 => NEXT_OUTS <= 984; -- pmulhrsw_Pq_Qq SANITY
                when 28 => NEXT_OUTS <= 1644; -- pabsb_Pq_Qq SANITY
                when 29 => NEXT_OUTS <= 1103; -- pabsw_Pq_Qq SANITY
                when 30 => NEXT_OUTS <= 752; -- pabsd_Pq_Qq SANITY
                when 240 => NEXT_OUTS <= 1090; -- movbe_Gd_Md SANITY
                when 241 => 
                case OP4 is
                    when 195 => NEXT_OUTS <= 105; -- movbe_Md_Gd SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 58 => 
            case OP3 is
                when 15 => NEXT_OUTS <= 1304; -- palignr_Pq_Qq_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 64 => NEXT_OUTS <= 1544; -- cmovol_Gd_Ed SANITY
            when 65 => NEXT_OUTS <= 867; -- cmovnol_Gd_Ed SANITY
            when 66 => NEXT_OUTS <= 1247; -- cmovcl_Gd_Ed SANITY
            when 67 => NEXT_OUTS <= 403; -- cmovncl_Gd_Ed SANITY
            when 68 => NEXT_OUTS <= 1638; -- cmovzl_Gd_Ed SANITY
            when 69 => NEXT_OUTS <= 1132; -- cmovnzl_Gd_Ed SANITY
            when 70 => NEXT_OUTS <= 766; -- cmovnal_Gd_Ed SANITY
            when 71 => NEXT_OUTS <= 1566; -- cmoval_Gd_Ed SANITY
            when 72 => NEXT_OUTS <= 104; -- cmovsl_Gd_Ed SANITY
            when 73 => NEXT_OUTS <= 139; -- cmovnsl_Gd_Ed SANITY
            when 74 => NEXT_OUTS <= 486; -- cmovpl_Gd_Ed SANITY
            when 75 => NEXT_OUTS <= 1365; -- cmovnpl_Gd_Ed SANITY
            when 76 => NEXT_OUTS <= 902; -- cmovll_Gd_Ed SANITY
            when 77 => NEXT_OUTS <= 1557; -- cmovnll_Gd_Ed SANITY
            when 78 => NEXT_OUTS <= 942; -- cmovngl_Gd_Ed SANITY
            when 79 => NEXT_OUTS <= 1535; -- cmovgl_Gd_Ed SANITY
            when 80 => NEXT_OUTS <= 988; -- movmskps_Gd_Ups SANITY
            when 81 => NEXT_OUTS <= 990; -- sqrtps_Vps_Wps SANITY
            when 82 => NEXT_OUTS <= 502; -- rsqrtps_Vps_Wps SANITY
            when 83 => NEXT_OUTS <= 493; -- rcpps_Vps_Wps SANITY
            when 84 => NEXT_OUTS <= 801; -- andps_Vps_Wps SANITY
            when 85 => NEXT_OUTS <= 1431; -- andnps_Vps_Wps SANITY
            when 86 => NEXT_OUTS <= 103; -- orps_Vps_Wps SANITY
            when 87 => NEXT_OUTS <= 1642; -- xorps_Vps_Wps SANITY
            when 88 => NEXT_OUTS <= 1546; -- addps_Vps_Wps SANITY
            when 89 => NEXT_OUTS <= 943; -- mulps_Vps_Wps SANITY
            when 90 => NEXT_OUTS <= 40; -- cvtps2pd_Vpd_Wps SANITY
            when 91 => NEXT_OUTS <= 341; -- cvtdq2ps_Vps_Wdq SANITY
            when 92 => NEXT_OUTS <= 1223; -- subps_Vps_Wps SANITY
            when 93 => NEXT_OUTS <= 828; -- minps_Vps_Wps SANITY
            when 94 => NEXT_OUTS <= 1141; -- divps_Vps_Wps SANITY
            when 95 => NEXT_OUTS <= 1376; -- maxps_Vps_Wps SANITY
            when 96 => NEXT_OUTS <= 1571; -- punpcklbw_Pq_Qd SANITY
            when 97 => NEXT_OUTS <= 322; -- punpcklwd_Pq_Qd SANITY
            when 98 => NEXT_OUTS <= 1384; -- punpckldq_Pq_Qd SANITY
            when 99 => NEXT_OUTS <= 714; -- packsswb_Pq_Qq SANITY
            when 100 => NEXT_OUTS <= 352; -- pcmpgtb_Pq_Qq SANITY
            when 101 => NEXT_OUTS <= 789; -- pcmpgtw_Pq_Qq SANITY
            when 102 => NEXT_OUTS <= 439; -- pcmpgtd_Pq_Qq SANITY
            when 103 => NEXT_OUTS <= 657; -- packuswb_Pq_Qq SANITY
            when 104 => NEXT_OUTS <= 1241; -- punpckhbw_Pq_Qq SANITY
            when 105 => NEXT_OUTS <= 1285; -- punpckhwd_Pq_Qq SANITY
            when 106 => NEXT_OUTS <= 1367; -- punpckhdq_Pq_Qq SANITY
            when 107 => NEXT_OUTS <= 167; -- packssdw_Pq_Qq SANITY
            when 110 => NEXT_OUTS <= 1379; -- movd_Pq_Ed SANITY
            when 111 => NEXT_OUTS <= 948; -- movq_Pq_Qq SANITY
            when 112 => NEXT_OUTS <= 65; -- pshufw_Pq_Qq_Ib SANITY
            when 113 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 537; -- psrlw_Nq_Ib SANITY
                when 32 => NEXT_OUTS <= 1044; -- psraw_Nq_Ib SANITY
                when 48 => NEXT_OUTS <= 1388; -- psllw_Nq_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 114 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 516; -- psrld_Nq_Ib SANITY
                when 32 => NEXT_OUTS <= 187; -- psrad_Nq_Ib SANITY
                when 48 => NEXT_OUTS <= 615; -- pslld_Nq_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 115 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 1317; -- psrlq_Nq_Ib SANITY
                when 48 => NEXT_OUTS <= 849; -- psllq_Nq_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 116 => NEXT_OUTS <= 434; -- pcmpeqb_Pq_Qq SANITY
            when 117 => NEXT_OUTS <= 981; -- pcmpeqw_Pq_Qq SANITY
            when 118 => NEXT_OUTS <= 295; -- pcmpeqd_Pq_Qq SANITY
            when 119 => NEXT_OUTS <= 663; -- emms SANITY
            when 126 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1166; -- movd_Ed_Pq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 127 => NEXT_OUTS <= 1029; -- movq_Qq_Pq SANITY
            when 128 => NEXT_OUTS <= 1081; -- jo_Jd SANITY
            when 129 => NEXT_OUTS <= 291; -- jno_Jd SANITY
            when 130 => NEXT_OUTS <= 950; -- jb_Jd SANITY
            when 131 => NEXT_OUTS <= 1601; -- jnb_Jd SANITY
            when 132 => NEXT_OUTS <= 364; -- jz_Jd SANITY
            when 133 => NEXT_OUTS <= 1655; -- jnz_Jd SANITY
            when 134 => NEXT_OUTS <= 1179; -- jbe_Jd SANITY
            when 135 => NEXT_OUTS <= 1588; -- jnbe_Jd SANITY
            when 136 => NEXT_OUTS <= 1073; -- js_Jd SANITY
            when 137 => NEXT_OUTS <= 257; -- jns_Jd SANITY
            when 138 => NEXT_OUTS <= 256; -- jp_Jd SANITY
            when 139 => NEXT_OUTS <= 1538; -- jnp_Jd SANITY
            when 140 => NEXT_OUTS <= 759; -- jl_Jd SANITY
            when 141 => NEXT_OUTS <= 58; -- jnl_Jd SANITY
            when 142 => NEXT_OUTS <= 983; -- jle_Jd SANITY
            when 143 => NEXT_OUTS <= 821; -- jnle_Jd SANITY
            when 144 => NEXT_OUTS <= 349; -- seto_Eb SANITY
            when 145 => NEXT_OUTS <= 455; -- setno_Eb SANITY
            when 146 => NEXT_OUTS <= 565; -- setb_Eb SANITY
            when 147 => NEXT_OUTS <= 1211; -- setnb_Eb SANITY
            when 148 => NEXT_OUTS <= 337; -- setz_Eb SANITY
            when 149 => NEXT_OUTS <= 231; -- setnz_Eb SANITY
            when 150 => NEXT_OUTS <= 1612; -- setbe_Eb SANITY
            when 151 => NEXT_OUTS <= 192; -- setnbe_Eb SANITY
            when 152 => NEXT_OUTS <= 239; -- sets_Eb SANITY
            when 153 => NEXT_OUTS <= 1235; -- setns_Eb SANITY
            when 154 => NEXT_OUTS <= 1640; -- setp_Eb SANITY
            when 155 => NEXT_OUTS <= 1116; -- setnp_Eb SANITY
            when 156 => NEXT_OUTS <= 445; -- setl_Eb SANITY
            when 157 => NEXT_OUTS <= 1474; -- setnl_Eb SANITY
            when 158 => NEXT_OUTS <= 332; -- setle_Eb SANITY
            when 159 => NEXT_OUTS <= 776; -- setnle_Eb SANITY
            when 160 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 133; -- pushl_FS SANITY
                when 1 => NEXT_OUTS <= 822; -- pushq_FS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 161 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1463; -- popl_FS SANITY
                when 1 => NEXT_OUTS <= 1515; -- popq_FS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 162 => NEXT_OUTS <= 354; -- cpuid SANITY
            when 163 => NEXT_OUTS <= 1433; -- btl_Ed_Gd SANITY
            when 164 => NEXT_OUTS <= 1504; -- shldl_Ed_Gd_Ib SANITY
            when 165 => NEXT_OUTS <= 118; -- shldl_Ed_Gd_CL SANITY
            when 168 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1065; -- pushl_GS SANITY
                when 1 => NEXT_OUTS <= 1634; -- pushq_GS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 169 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 292; -- popl_GS SANITY
                when 1 => NEXT_OUTS <= 1437; -- popq_GS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 170 => NEXT_OUTS <= 499; -- rsm SANITY
            when 171 => NEXT_OUTS <= 1554; -- btsl_Ed_Gd SANITY
            when 172 => NEXT_OUTS <= 961; -- shrdl_Ed_Gd_Ib SANITY
            when 173 => NEXT_OUTS <= 889; -- shrdl_Ed_Gd_CL SANITY
            when 174 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 416; -- fxsave SANITY
                when 8 => NEXT_OUTS <= 895; -- fxrstor SANITY
                when 16 => NEXT_OUTS <= 175; -- ldmxcsr SANITY
                when 24 => NEXT_OUTS <= 123; -- stmxcsr SANITY
                when 48 => NEXT_OUTS <= 1281; -- xsaveopt SANITY
                when 56 => NEXT_OUTS <= 87; -- cflush SANITY
                when 232 => NEXT_OUTS <= 195; -- lfence SANITY
                when 240 => NEXT_OUTS <= 582; -- mfence SANITY
                when 248 => NEXT_OUTS <= 370; -- sfence SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 175 => NEXT_OUTS <= 508; -- imull_Gd_Ed SANITY
            when 176 => NEXT_OUTS <= 400; -- cmpxchgb_Eb_Gb SANITY
            when 177 => NEXT_OUTS <= 467; -- cmpxchgl_Ed_Gd SANITY
            when 178 => NEXT_OUTS <= 504; -- lssl_Gd_Mp SANITY
            when 179 => NEXT_OUTS <= 1273; -- btrl_Ed_Gd SANITY
            when 180 => NEXT_OUTS <= 191; -- lfsl_Gd_Mp SANITY
            when 181 => NEXT_OUTS <= 122; -- lgsl_Gd_Mp SANITY
            when 182 => NEXT_OUTS <= 1140; -- movzbl_Gd_Eb SANITY
            when 183 => NEXT_OUTS <= 851; -- movzwl_Gd_Ew SANITY
            when 185 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1358; -- ud2b SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 186 => 
            case OP3 is
                when 32 => NEXT_OUTS <= 401; -- btl_Ed_Ib SANITY
                when 40 => NEXT_OUTS <= 1562; -- btsl_Ed_Ib SANITY
                when 48 => NEXT_OUTS <= 430; -- btrl_Ed_Ib SANITY
                when 56 => NEXT_OUTS <= 674; -- btcl_Ed_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 187 => NEXT_OUTS <= 771; -- btcl_Ed_Gd SANITY
            when 188 => NEXT_OUTS <= 540; -- bsfl_Gd_Ed SANITY
            when 189 => NEXT_OUTS <= 1399; -- bsrl_Gd_Ed SANITY
            when 190 => NEXT_OUTS <= 1150; -- movsbl_Gd_Eb SANITY
            when 191 => NEXT_OUTS <= 1413; -- movswl_Gd_Ew SANITY
            when 192 => NEXT_OUTS <= 524; -- xaddb_Eb_Gb SANITY
            when 193 => NEXT_OUTS <= 717; -- xaddl_Ed_Gd SANITY
            when 194 => 
            case OP3 is
                when 0 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 447; -- cmpps_Vps_Wps_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 195 => NEXT_OUTS <= 243; -- movnti_Md_Gd SANITY
            when 196 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 21; -- pinsrw_Pq_Ew_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 197 => NEXT_OUTS <= 769; -- pextrw_Gd_Nq_Ib SANITY
            when 198 => NEXT_OUTS <= 246; -- shufps_Vps_Wps_Ib SANITY
            when 199 => 
            case OP3 is
                when 8 => NEXT_OUTS <= 41; -- cmpxchg8b_Mq SANITY
                when 48 => NEXT_OUTS <= 884; -- vmptrld_Mq SANITY
                when 56 => NEXT_OUTS <= 407; -- vmptrst_Mq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 200 => NEXT_OUTS <= 1417; -- bswapl_ERX SANITY
            when 209 => NEXT_OUTS <= 1545; -- psrlw_Pq_Qq SANITY
            when 210 => NEXT_OUTS <= 311; -- psrld_Pq_Qq SANITY
            when 211 => NEXT_OUTS <= 810; -- psrlq_Pq_Qq SANITY
            when 212 => NEXT_OUTS <= 1118; -- paddq_Pq_Qq SANITY
            when 213 => NEXT_OUTS <= 699; -- pmullw_Pq_Qq SANITY
            when 215 => NEXT_OUTS <= 1126; -- pmovmskb_Gd_Nq SANITY
            when 216 => NEXT_OUTS <= 169; -- psubusb_Pq_Qq SANITY
            when 217 => NEXT_OUTS <= 151; -- psubusw_Pq_Qq SANITY
            when 218 => NEXT_OUTS <= 150; -- pminub_Pq_Qq SANITY
            when 219 => NEXT_OUTS <= 974; -- pand_Pq_Qq SANITY
            when 220 => NEXT_OUTS <= 831; -- paddusb_Pq_Qq SANITY
            when 221 => NEXT_OUTS <= 1430; -- paddusw_Pq_Qq SANITY
            when 222 => NEXT_OUTS <= 496; -- pmaxub_Pq_Qq SANITY
            when 223 => NEXT_OUTS <= 1660; -- pandn_Pq_Qq SANITY
            when 224 => NEXT_OUTS <= 258; -- pavgb_Pq_Qq SANITY
            when 225 => NEXT_OUTS <= 1266; -- psraw_Pq_Qq SANITY
            when 226 => NEXT_OUTS <= 1560; -- psrad_Pq_Qq SANITY
            when 227 => NEXT_OUTS <= 1659; -- pavgw_Pq_Qq SANITY
            when 228 => NEXT_OUTS <= 1019; -- pmulhuw_Pq_Qq SANITY
            when 229 => NEXT_OUTS <= 448; -- pmulhw_Pq_Qq SANITY
            when 231 => NEXT_OUTS <= 186; -- movntq_Mq_Pq SANITY
            when 232 => NEXT_OUTS <= 16; -- psubsb_Pq_Qq SANITY
            when 233 => NEXT_OUTS <= 1080; -- psubsw_Pq_Qq SANITY
            when 234 => NEXT_OUTS <= 588; -- pminsw_Pq_Qq SANITY
            when 235 => NEXT_OUTS <= 638; -- por_Pq_Qq SANITY
            when 236 => NEXT_OUTS <= 738; -- paddsb_Pq_Qq SANITY
            when 237 => NEXT_OUTS <= 531; -- paddsw_Pq_Qq SANITY
            when 238 => NEXT_OUTS <= 1480; -- pmaxsw_Pq_Qq SANITY
            when 239 => NEXT_OUTS <= 91; -- pxor_Pq_Qq SANITY
            when 241 => NEXT_OUTS <= 1615; -- psllw_Pq_Qq SANITY
            when 242 => NEXT_OUTS <= 1482; -- pslld_Pq_Qq SANITY
            when 243 => NEXT_OUTS <= 1532; -- psllq_Pq_Qq SANITY
            when 244 => NEXT_OUTS <= 228; -- pmuludq_Pq_Qq SANITY
            when 245 => NEXT_OUTS <= 1593; -- pmaddwd_Pq_Qq SANITY
            when 246 => NEXT_OUTS <= 957; -- psadbw_Pq_Qq SANITY
            when 247 => NEXT_OUTS <= 269; -- maskmovq_Pq_Nq SANITY
            when 248 => NEXT_OUTS <= 1085; -- psubb_Pq_Qq SANITY
            when 249 => NEXT_OUTS <= 1189; -- psubw_Pq_Qq SANITY
            when 250 => NEXT_OUTS <= 211; -- psubd_Pq_Qq SANITY
            when 251 => NEXT_OUTS <= 535; -- psubq_Pq_Qq SANITY
            when 252 => NEXT_OUTS <= 428; -- paddb_Pq_Qq SANITY
            when 253 => NEXT_OUTS <= 554; -- paddw_Pq_Qq SANITY
            when 254 => NEXT_OUTS <= 617; -- paddd_Pq_Qq SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 16 => NEXT_OUTS <= 546; -- adcb_Eb_Gb SANITY
        when 17 => NEXT_OUTS <= 611; -- adcl_Ed_Gd SANITY
        when 18 => NEXT_OUTS <= 384; -- adcb_Gb_Eb SANITY
        when 19 => NEXT_OUTS <= 1484; -- adcl_Gd_Ed SANITY
        when 20 => NEXT_OUTS <= 541; -- adcb_AL_Ib SANITY
        when 21 => NEXT_OUTS <= 1256; -- adcl_EAX_Id SANITY
        when 22 => NEXT_OUTS <= 115; -- pushl_SS SANITY
        when 23 => NEXT_OUTS <= 1563; -- popl_SS SANITY
        when 24 => NEXT_OUTS <= 1345; -- sbbb_Eb_Gb SANITY
        when 25 => NEXT_OUTS <= 1530; -- sbbl_Ed_Gd SANITY
        when 26 => NEXT_OUTS <= 1200; -- sbbb_Gb_Eb SANITY
        when 27 => NEXT_OUTS <= 61; -- sbbl_Gd_Ed SANITY
        when 28 => NEXT_OUTS <= 684; -- sbbb_AL_Ib SANITY
        when 29 => NEXT_OUTS <= 340; -- sbbl_EAX_Id SANITY
        when 30 => NEXT_OUTS <= 1663; -- pushl_DS SANITY
        when 31 => NEXT_OUTS <= 1385; -- popl_DS SANITY
        when 32 => NEXT_OUTS <= 1274; -- andb_Eb_Gb SANITY
        when 33 => NEXT_OUTS <= 1454; -- andl_Ed_Gd SANITY
        when 34 => NEXT_OUTS <= 1503; -- andb_Gb_Eb SANITY
        when 35 => NEXT_OUTS <= 1260; -- andl_Gd_Ed SANITY
        when 36 => NEXT_OUTS <= 982; -- andb_AL_Ib SANITY
        when 37 => NEXT_OUTS <= 527; -- andl_EAX_Id SANITY
        when 39 => NEXT_OUTS <= 345; -- daa SANITY
        when 40 => NEXT_OUTS <= 1186; -- subb_Eb_Gb SANITY
        when 41 => NEXT_OUTS <= 399; -- subl_Ed_Gd SANITY
        when 42 => NEXT_OUTS <= 835; -- subb_Gb_Eb SANITY
        when 43 => NEXT_OUTS <= 98; -- subl_Gd_Ed SANITY
        when 44 => NEXT_OUTS <= 834; -- subb_AL_Ib SANITY
        when 45 => NEXT_OUTS <= 394; -- subl_EAX_Id SANITY
        when 47 => NEXT_OUTS <= 1169; -- das SANITY
        when 48 => NEXT_OUTS <= 1027; -- xorb_Eb_Gb SANITY
        when 49 => NEXT_OUTS <= 630; -- xorl_Ed_Gd SANITY
        when 50 => NEXT_OUTS <= 817; -- xorb_Gb_Eb SANITY
        when 51 => NEXT_OUTS <= 1297; -- xorl_Gd_Ed SANITY
        when 52 => NEXT_OUTS <= 408; -- xorb_AL_Ib SANITY
        when 53 => NEXT_OUTS <= 1306; -- xorl_EAX_Id SANITY
        when 55 => NEXT_OUTS <= 377; -- aaa SANITY
        when 56 => NEXT_OUTS <= 1227; -- cmpb_Eb_Gb SANITY
        when 57 => NEXT_OUTS <= 179; -- cmpl_Ed_Gd SANITY
        when 58 => NEXT_OUTS <= 946; -- cmpb_Gb_Eb SANITY
        when 59 => NEXT_OUTS <= 242; -- cmpl_Gd_Ed SANITY
        when 60 => NEXT_OUTS <= 81; -- cmpb_AL_Ib SANITY
        when 61 => NEXT_OUTS <= 507; -- cmpl_EAX_Id SANITY
        when 63 => NEXT_OUTS <= 1005; -- aas SANITY
        when 64 => NEXT_OUTS <= 758; -- incl_ERX SANITY
        when 72 => 
        case OP2 is
            when 1 => NEXT_OUTS <= 459; -- addq_Eq_Gq SANITY
            when 3 => NEXT_OUTS <= 249; -- addq_Gq_Eq SANITY
            when 5 => NEXT_OUTS <= 166; -- addq_RAX_sId SANITY
            when 9 => NEXT_OUTS <= 1442; -- orq_Eq_Gq SANITY
            when 11 => NEXT_OUTS <= 307; -- orq_Gq_Eq SANITY
            when 13 => NEXT_OUTS <= 805; -- orq_RAX_sId SANITY
            when 15 => 
            case OP3 is
                when 2 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 276; -- larq_Gq_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 3 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 784; -- lslq_Gq_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 56 => 
                case OP4 is
                    when 240 => NEXT_OUTS <= 1389; -- movbe_Gq_Mq SANITY
                    when 241 => 
                    case OP5 is
                        when 195 => NEXT_OUTS <= 381; -- movbe_Mq_Gq SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 64 => NEXT_OUTS <= 1314; -- cmovoq_Gq_Eq SANITY
                when 65 => NEXT_OUTS <= 765; -- cmovnoq_Gq_Eq SANITY
                when 66 => NEXT_OUTS <= 900; -- cmovcq_Gq_Eq SANITY
                when 67 => NEXT_OUTS <= 658; -- cmovncq_Gq_Eq SANITY
                when 68 => NEXT_OUTS <= 1002; -- cmovzq_Gq_Eq SANITY
                when 69 => NEXT_OUTS <= 1380; -- cmovnzq_Gq_Eq SANITY
                when 70 => NEXT_OUTS <= 1343; -- cmovnaq_Gq_Eq SANITY
                when 71 => NEXT_OUTS <= 1138; -- cmovaq_Gq_Eq SANITY
                when 72 => NEXT_OUTS <= 1404; -- cmovsq_Gq_Eq SANITY
                when 73 => NEXT_OUTS <= 1292; -- cmovnsq_Gq_Eq SANITY
                when 74 => NEXT_OUTS <= 742; -- cmovpq_Gq_Eq SANITY
                when 75 => NEXT_OUTS <= 335; -- cmovnpq_Gq_Eq SANITY
                when 76 => NEXT_OUTS <= 1344; -- cmovlq_Gq_Eq SANITY
                when 77 => NEXT_OUTS <= 1522; -- cmovnlq_Gq_Eq SANITY
                when 78 => NEXT_OUTS <= 358; -- cmovngq_Gq_Eq SANITY
                when 79 => NEXT_OUTS <= 995; -- cmovgq_Gq_Eq SANITY
                when 110 => NEXT_OUTS <= 1228; -- movq_Pq_Eq SANITY
                when 126 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 168; -- movq_Eq_Pq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 163 => NEXT_OUTS <= 548; -- btq_Eq_Gq SANITY
                when 164 => NEXT_OUTS <= 780; -- shldq_Eq_Gq_Ib SANITY
                when 165 => NEXT_OUTS <= 819; -- shldq_Eq_Gq_CL SANITY
                when 171 => NEXT_OUTS <= 597; -- btsq_Eq_Gq SANITY
                when 172 => NEXT_OUTS <= 813; -- shrdq_Eq_Gq_Ib SANITY
                when 173 => NEXT_OUTS <= 1371; -- shrdq_Eq_Gq_CL SANITY
                when 175 => NEXT_OUTS <= 1024; -- imulq_Gq_Eq SANITY
                when 177 => NEXT_OUTS <= 1415; -- cmpxchgq_Eq_Gq SANITY
                when 178 => NEXT_OUTS <= 806; -- lssq_Gq_Mp SANITY
                when 179 => NEXT_OUTS <= 1205; -- btrq_Eq_Gq SANITY
                when 180 => NEXT_OUTS <= 474; -- lfsq_Gq_Mp SANITY
                when 181 => NEXT_OUTS <= 281; -- lgsq_Gq_Mp SANITY
                when 182 => NEXT_OUTS <= 453; -- movzbq_Gq_Eb SANITY
                when 183 => NEXT_OUTS <= 386; -- movzwq_Gq_Ew SANITY
                when 186 => 
                case OP4 is
                    when 32 => NEXT_OUTS <= 740; -- btq_Eq_Ib SANITY
                    when 40 => NEXT_OUTS <= 171; -- btsq_Eq_Ib SANITY
                    when 48 => NEXT_OUTS <= 301; -- btrq_Eq_Ib SANITY
                    when 56 => NEXT_OUTS <= 1207; -- btcq_Eq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 187 => NEXT_OUTS <= 96; -- btcq_Eq_Gq SANITY
                when 188 => NEXT_OUTS <= 334; -- bsfq_Gq_Eq SANITY
                when 189 => NEXT_OUTS <= 1386; -- bsrq_Gq_Eq SANITY
                when 190 => NEXT_OUTS <= 1035; -- movsbq_Gq_Eb SANITY
                when 191 => NEXT_OUTS <= 711; -- movswq_Gq_Ew SANITY
                when 193 => NEXT_OUTS <= 1396; -- xaddq_Eq_Gq SANITY
                when 195 => NEXT_OUTS <= 1059; -- movntiq_Mq_Gq SANITY
                when 199 => 
                case OP4 is
                    when 8 => NEXT_OUTS <= 665; -- cmpxchg16b_Mdq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 200 => NEXT_OUTS <= 1584; -- bswapq_RRX SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 17 => NEXT_OUTS <= 1133; -- adcq_Eq_Gq SANITY
            when 19 => NEXT_OUTS <= 1068; -- adcq_Gq_Eq SANITY
            when 21 => NEXT_OUTS <= 479; -- adcq_RAX_sId SANITY
            when 25 => NEXT_OUTS <= 503; -- sbbq_Eq_Gq SANITY
            when 27 => NEXT_OUTS <= 226; -- sbbq_Gq_Eq SANITY
            when 29 => NEXT_OUTS <= 1624; -- sbbq_RAX_sId SANITY
            when 33 => NEXT_OUTS <= 1397; -- andq_Eq_Gq SANITY
            when 35 => NEXT_OUTS <= 1267; -- andq_Gq_Eq SANITY
            when 37 => NEXT_OUTS <= 1323; -- andq_RAX_sId SANITY
            when 41 => NEXT_OUTS <= 1518; -- subq_Eq_Gq SANITY
            when 43 => NEXT_OUTS <= 1100; -- subq_Gq_Eq SANITY
            when 45 => NEXT_OUTS <= 224; -- subq_RAX_sId SANITY
            when 49 => NEXT_OUTS <= 929; -- xorq_Eq_Gq SANITY
            when 51 => NEXT_OUTS <= 1494; -- xorq_Gq_Eq SANITY
            when 53 => NEXT_OUTS <= 994; -- xorq_RAX_sId SANITY
            when 57 => NEXT_OUTS <= 1231; -- cmpq_Eq_Gq SANITY
            when 59 => NEXT_OUTS <= 59; -- cmpq_Gq_Eq SANITY
            when 61 => NEXT_OUTS <= 687; -- cmpq_RAX_sId SANITY
            when 99 => NEXT_OUTS <= 1136; -- movslq_Gq_Ed SANITY
            when 105 => NEXT_OUTS <= 1409; -- imulq_Gq_Eq_sId SANITY
            when 107 => NEXT_OUTS <= 409; -- imulq_Gq_Eq_sIb SANITY
            when 129 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1270; -- addq_Eq_sId SANITY
                when 8 => NEXT_OUTS <= 645; -- orq_Eq_sId SANITY
                when 16 => NEXT_OUTS <= 248; -- adcq_Eq_sId SANITY
                when 24 => NEXT_OUTS <= 512; -- sbbq_Eq_sId SANITY
                when 32 => NEXT_OUTS <= 1296; -- andq_Eq_sId SANITY
                when 40 => NEXT_OUTS <= 1630; -- subq_Eq_sId SANITY
                when 48 => NEXT_OUTS <= 288; -- xorq_Eq_sId SANITY
                when 56 => NEXT_OUTS <= 1020; -- cmpq_Eq_sId SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 131 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 484; -- addq_Eq_sIb SANITY
                when 8 => NEXT_OUTS <= 794; -- orq_Eq_sIb SANITY
                when 16 => NEXT_OUTS <= 1664; -- adcq_Eq_sIb SANITY
                when 24 => NEXT_OUTS <= 737; -- sbbq_Eq_sIb SANITY
                when 32 => NEXT_OUTS <= 1581; -- andq_Eq_sIb SANITY
                when 40 => NEXT_OUTS <= 183; -- subq_Eq_sIb SANITY
                when 48 => NEXT_OUTS <= 278; -- xorq_Eq_sIb SANITY
                when 56 => NEXT_OUTS <= 1594; -- cmpq_Eq_sIb SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 133 => NEXT_OUTS <= 472; -- testq_Eq_Gq SANITY
            when 135 => NEXT_OUTS <= 595; -- xchgq_Eq_Gq SANITY
            when 137 => NEXT_OUTS <= 102; -- movq_Eq_Gq SANITY
            when 139 => NEXT_OUTS <= 1632; -- movq_Gq_Eq SANITY
            when 141 => NEXT_OUTS <= 181; -- leaq_Gq_Mq SANITY
            when 145 => NEXT_OUTS <= 906; -- xchgq_RRX_RAX SANITY
            when 152 => NEXT_OUTS <= 47; -- cdqe SANITY
            when 153 => NEXT_OUTS <= 147; -- cqo SANITY
            when 161 => NEXT_OUTS <= 888; -- movq_RAX_Oq SANITY
            when 163 => NEXT_OUTS <= 1578; -- movq_Oq_RAX SANITY
            when 165 => NEXT_OUTS <= 1046; -- movsq_Yq_Xq SANITY
            when 167 => NEXT_OUTS <= 154; -- cmpsq_Yq_Xq SANITY
            when 169 => NEXT_OUTS <= 931; -- testq_RAX_sId SANITY
            when 171 => NEXT_OUTS <= 610; -- stosq_Yq_RAX SANITY
            when 173 => NEXT_OUTS <= 1613; -- lodsq_RAX_Xq SANITY
            when 175 => NEXT_OUTS <= 539; -- scasq_Yq_RAX SANITY
            when 184 => NEXT_OUTS <= 1255; -- movq_RRX_Iq SANITY
            when 193 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 327; -- rolq_Eq_Ib SANITY
                when 8 => NEXT_OUTS <= 816; -- rorq_Eq_Ib SANITY
                when 16 => NEXT_OUTS <= 402; -- rclq_Eq_Ib SANITY
                when 24 => NEXT_OUTS <= 261; -- rcrq_Eq_Ib SANITY
                when 32 => NEXT_OUTS <= 346; -- shlq_Eq_Ib SANITY
                when 40 => NEXT_OUTS <= 1147; -- shrq_Eq_Ib SANITY
                when 56 => NEXT_OUTS <= 463; -- sarq_Eq_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 199 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 446; -- movq_Eq_sId SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 207 => NEXT_OUTS <= 799; -- iretq SANITY
            when 209 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1075; -- rolq_Eq_I1 SANITY
                when 8 => NEXT_OUTS <= 783; -- rorq_Eq_I1 SANITY
                when 16 => NEXT_OUTS <= 273; -- rclq_Eq_I1 SANITY
                when 24 => NEXT_OUTS <= 649; -- rcrq_Eq_I1 SANITY
                when 32 => NEXT_OUTS <= 1582; -- shlq_Eq_I1 SANITY
                when 40 => NEXT_OUTS <= 236; -- shrq_Eq_I1 SANITY
                when 56 => NEXT_OUTS <= 406; -- sarq_Eq_I1 SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 211 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1137; -- rolq_Eq_CL SANITY
                when 8 => NEXT_OUTS <= 308; -- rorq_Eq_CL SANITY
                when 16 => NEXT_OUTS <= 55; -- rclq_Eq_CL SANITY
                when 24 => NEXT_OUTS <= 1123; -- rcrq_Eq_CL SANITY
                when 32 => NEXT_OUTS <= 355; -- shlq_Eq_CL SANITY
                when 40 => NEXT_OUTS <= 1359; -- shrq_Eq_CL SANITY
                when 56 => NEXT_OUTS <= 1194; -- sarq_Eq_CL SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 247 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1453; -- testq_Eq_sId SANITY
                when 16 => NEXT_OUTS <= 635; -- notq_Eq SANITY
                when 24 => NEXT_OUTS <= 27; -- negq_Eq SANITY
                when 32 => NEXT_OUTS <= 1326; -- mulq_RAX_Eq SANITY
                when 40 => NEXT_OUTS <= 221; -- imulq_RAX_Eq SANITY
                when 48 => NEXT_OUTS <= 418; -- divq_RAX_Eq SANITY
                when 56 => NEXT_OUTS <= 1067; -- idivq_RAX_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 255 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 731; -- incq_Eq SANITY
                when 8 => NEXT_OUTS <= 1164; -- decq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 80 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 879; -- pushl_ERX SANITY
            when 1 => NEXT_OUTS <= 798; -- pushq_RRX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 88 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 937; -- popl_ERX SANITY
            when 1 => NEXT_OUTS <= 128; -- popq_RRX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 96 => NEXT_OUTS <= 1512; -- pushal SANITY
        when 97 => NEXT_OUTS <= 76; -- popal SANITY
        when 98 => NEXT_OUTS <= 897; -- boundl_Gd_Ma SANITY
        when 99 => NEXT_OUTS <= 36; -- arpl_Ew_Gw SANITY
        when 102 => 
        case OP2 is
            when 1 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 356; -- addw_Ew_Gw SANITY
                when 1 => NEXT_OUTS <= 581; -- decw_RX SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 3 => NEXT_OUTS <= 777; -- addw_Gw_Ew SANITY
            when 5 => NEXT_OUTS <= 444; -- addw_AX_Iw SANITY
            when 6 => NEXT_OUTS <= 197; -- pushw_ES SANITY
            when 7 => NEXT_OUTS <= 1364; -- popw_ES SANITY
            when 9 => NEXT_OUTS <= 587; -- orw_Ew_Gw SANITY
            when 11 => NEXT_OUTS <= 315; -- orw_Gw_Ew SANITY
            when 13 => NEXT_OUTS <= 1293; -- orw_AX_Iw SANITY
            when 14 => NEXT_OUTS <= 1224; -- pushw_CS SANITY
            when 15 => 
            case OP3 is
                when 2 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 142; -- larw_Gw_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 3 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 174; -- lslw_Gw_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 16 => NEXT_OUTS <= 490; -- movupd_Vpd_Wpd SANITY
                when 17 => NEXT_OUTS <= 124; -- movupd_Wpd_Vpd SANITY
                when 18 => NEXT_OUTS <= 788; -- movlpd_Vpd_Mq SANITY
                when 19 => NEXT_OUTS <= 86; -- movlpd_Mq_Vpd SANITY
                when 20 => NEXT_OUTS <= 120; -- unpcklpd_Vpd_Wpd SANITY
                when 21 => NEXT_OUTS <= 585; -- unpckhpd_Vpd_Wpd SANITY
                when 22 => NEXT_OUTS <= 854; -- movhpd_Vpd_Mq SANITY
                when 23 => NEXT_OUTS <= 8; -- movhpd_Mq_Vpd SANITY
                when 40 => NEXT_OUTS <= 622; -- movapd_Vpd_Wpd SANITY
                when 41 => NEXT_OUTS <= 662; -- movapd_Wpd_Vpd SANITY
                when 42 => NEXT_OUTS <= 624; -- cvtpi2pd_Vpd_Qq SANITY
                when 44 => NEXT_OUTS <= 146; -- cvttpd2pi_Pq_Wpd SANITY
                when 45 => NEXT_OUTS <= 1124; -- cvtpd2pi_Pq_Wpd SANITY
                when 46 => NEXT_OUTS <= 1606; -- ucomisd_Vsd_Wsd SANITY
                when 47 => NEXT_OUTS <= 339; -- comisd_Vsd_Wsd SANITY
                when 56 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 739; -- pshufb_Vdq_Wdq SANITY
                    when 1 => NEXT_OUTS <= 1160; -- phaddw_Vdq_Wdq SANITY
                    when 2 => NEXT_OUTS <= 485; -- phaddd_Vdq_Wdq SANITY
                    when 3 => NEXT_OUTS <= 330; -- phaddsw_Vdq_Wdq SANITY
                    when 4 => NEXT_OUTS <= 1042; -- pmaddubsw_Vdq_Wdq SANITY
                    when 5 => NEXT_OUTS <= 909; -- phsubw_Vdq_Wdq SANITY
                    when 6 => NEXT_OUTS <= 578; -- phsubd_Vdq_Wdq SANITY
                    when 7 => NEXT_OUTS <= 677; -- phsubsw_Vdq_Wdq SANITY
                    when 8 => NEXT_OUTS <= 574; -- psignb_Vdq_Wdq SANITY
                    when 9 => NEXT_OUTS <= 1190; -- psignw_Vdq_Wdq SANITY
                    when 10 => NEXT_OUTS <= 971; -- psignd_Vdq_Wdq SANITY
                    when 11 => NEXT_OUTS <= 1144; -- pmulhrsw_Vdq_Wdq SANITY
                    when 16 => NEXT_OUTS <= 223; -- pblendvb_Vdq_Wdq SANITY
                    when 20 => NEXT_OUTS <= 395; -- blendvps_Vps_Wps SANITY
                    when 21 => NEXT_OUTS <= 1239; -- blendvpd_Vpd_Wpd SANITY
                    when 23 => NEXT_OUTS <= 1641; -- ptest_Vdq_Wdq SANITY
                    when 28 => NEXT_OUTS <= 836; -- pabsb_Vdq_Wdq SANITY
                    when 29 => NEXT_OUTS <= 60; -- pabsw_Vdq_Wdq SANITY
                    when 30 => NEXT_OUTS <= 696; -- pabsd_Vdq_Wdq SANITY
                    when 32 => 
                    case OP5 is
                        when 1 => NEXT_OUTS <= 1496; -- pmovsxbw_Vdq_Wq SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 33 => NEXT_OUTS <= 1004; -- pmovsxbd_Vdq_Wd SANITY
                    when 34 => NEXT_OUTS <= 721; -- pmovsxbq_Vdq_Ww SANITY
                    when 35 => NEXT_OUTS <= 1514; -- pmovsxwd_Vdq_Wq SANITY
                    when 36 => NEXT_OUTS <= 49; -- pmovsxwq_Vdq_Wd SANITY
                    when 37 => NEXT_OUTS <= 134; -- pmovsxdq_Vdq_Wq SANITY
                    when 40 => NEXT_OUTS <= 1555; -- pmuldq_Vdq_Wdq SANITY
                    when 41 => NEXT_OUTS <= 451; -- pcmpeqq_Vdq_Wdq SANITY
                    when 42 => NEXT_OUTS <= 848; -- movntdqa_Vdq_Mdq SANITY
                    when 43 => NEXT_OUTS <= 564; -- packusdw_Vdq_Wdq SANITY
                    when 48 => NEXT_OUTS <= 697; -- pmovzxbw_Vdq_Wq SANITY
                    when 49 => NEXT_OUTS <= 353; -- pmovzxbd_Vdq_Wd SANITY
                    when 50 => NEXT_OUTS <= 1524; -- pmovzxbq_Vdq_Ww SANITY
                    when 51 => NEXT_OUTS <= 491; -- pmovzxwd_Vdq_Wq SANITY
                    when 52 => NEXT_OUTS <= 1307; -- pmovzxwq_Vdq_Wd SANITY
                    when 53 => NEXT_OUTS <= 389; -- pmovzxdq_Vdq_Wq SANITY
                    when 55 => NEXT_OUTS <= 144; -- pcmpgtq_Vdq_Wdq SANITY
                    when 56 => NEXT_OUTS <= 189; -- pminsb_Vdq_Wdq SANITY
                    when 57 => NEXT_OUTS <= 452; -- pminsd_Vdq_Wdq SANITY
                    when 58 => NEXT_OUTS <= 907; -- pminuw_Vdq_Wdq SANITY
                    when 59 => NEXT_OUTS <= 1115; -- pminud_Vdq_Wdq SANITY
                    when 60 => NEXT_OUTS <= 551; -- pmaxsb_Vdq_Wdq SANITY
                    when 61 => NEXT_OUTS <= 1471; -- pmaxsd_Vdq_Wdq SANITY
                    when 62 => NEXT_OUTS <= 1499; -- pmaxuw_Vdq_Wdq SANITY
                    when 63 => NEXT_OUTS <= 991; -- pmaxud_Vdq_Wdq SANITY
                    when 64 => NEXT_OUTS <= 20; -- pmulld_Vdq_Wdq SANITY
                    when 65 => NEXT_OUTS <= 914; -- phminposuw_Vdq_Wdq SANITY
                    when 130 => NEXT_OUTS <= 1418; -- invpcid_Gy_Mdq SANITY
                    when 219 => NEXT_OUTS <= 935; -- aesimc_Vdq_Wdq SANITY
                    when 220 => NEXT_OUTS <= 1639; -- aesenc_Vdq_Wdq SANITY
                    when 221 => NEXT_OUTS <= 807; -- aesenclast_Vdq_Wdq SANITY
                    when 222 => NEXT_OUTS <= 1438; -- aesdec_Vdq_Wdq SANITY
                    when 223 => NEXT_OUTS <= 534; -- aesdeclast_Vdq_Wdq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 58 => 
                case OP4 is
                    when 8 => NEXT_OUTS <= 1347; -- roundps_Vps_Wps_Ib SANITY
                    when 9 => NEXT_OUTS <= 1268; -- roundpd_Vpd_Wpd_Ib SANITY
                    when 10 => NEXT_OUTS <= 655; -- roundss_Vss_Wss_Ib SANITY
                    when 11 => NEXT_OUTS <= 56; -- roundsd_Vsd_Wsd_Ib SANITY
                    when 12 => NEXT_OUTS <= 90; -- blendps_Vps_Wps_Ib SANITY
                    when 13 => NEXT_OUTS <= 1182; -- blendpd_Vpd_Wpd_Ib SANITY
                    when 14 => NEXT_OUTS <= 1324; -- pblendw_Vdq_Wdq_Ib SANITY
                    when 15 => NEXT_OUTS <= 1349; -- palignr_Vdq_Wdq_Ib SANITY
                    when 20 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 424; -- pextrb_Ebd_Vdq_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 21 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 561; -- pextrw_Ewd_Vdq_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 22 => NEXT_OUTS <= 1620; -- pextrd_Ed_Vdq_Ib SANITY
                    when 23 => NEXT_OUTS <= 220; -- extractps_Ed_Vdq_Ib SANITY
                    when 32 => NEXT_OUTS <= 300; -- pinsrb_Vdq_Ed_Ib SANITY
                    when 33 => NEXT_OUTS <= 482; -- insertps_Vps_Wss_Ib SANITY
                    when 34 => NEXT_OUTS <= 1391; -- pinsrd_Vdq_Ed_Ib SANITY
                    when 64 => NEXT_OUTS <= 992; -- dpps_Vps_Wps_Ib SANITY
                    when 65 => NEXT_OUTS <= 1142; -- dppd_Vpd_Wpd_Ib SANITY
                    when 66 => NEXT_OUTS <= 1526; -- mpsadbw_Vdq_Wdq_Ib SANITY
                    when 68 => NEXT_OUTS <= 1608; -- pclmulqdq_Vdq_Wdq_Ib SANITY
                    when 96 => NEXT_OUTS <= 755; -- pcmpestrm_Vdq_Wdq_Ib SANITY
                    when 97 => NEXT_OUTS <= 609; -- pcmpestri_Vdq_Wdq_Ib SANITY
                    when 98 => NEXT_OUTS <= 1148; -- pcmpistrm_Vdq_Wdq_Ib SANITY
                    when 99 => NEXT_OUTS <= 589; -- pcmpistri_Vdq_Wdq_Ib SANITY
                    when 223 => NEXT_OUTS <= 473; -- aeskeygenassist_Vdq_Wdq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 64 => NEXT_OUTS <= 1012; -- cmovow_Gw_Ew SANITY
                when 65 => NEXT_OUTS <= 1074; -- cmovnow_Gw_Ew SANITY
                when 66 => NEXT_OUTS <= 1643; -- cmovcw_Gw_Ew SANITY
                when 67 => NEXT_OUTS <= 1095; -- cmovncw_Gw_Ew SANITY
                when 68 => NEXT_OUTS <= 264; -- cmovzw_Gw_Ew SANITY
                when 69 => NEXT_OUTS <= 1548; -- cmovnzw_Gw_Ew SANITY
                when 70 => NEXT_OUTS <= 558; -- cmovnaw_Gw_Ew SANITY
                when 71 => NEXT_OUTS <= 511; -- cmovaw_Gw_Ew SANITY
                when 72 => NEXT_OUTS <= 823; -- cmovsw_Gw_Ew SANITY
                when 73 => NEXT_OUTS <= 350; -- cmovnsw_Gw_Ew SANITY
                when 74 => NEXT_OUTS <= 918; -- cmovpw_Gw_Ew SANITY
                when 75 => NEXT_OUTS <= 698; -- cmovnpw_Gw_Ew SANITY
                when 76 => NEXT_OUTS <= 1125; -- cmovlw_Gw_Ew SANITY
                when 77 => NEXT_OUTS <= 1305; -- cmovnlw_Gw_Ew SANITY
                when 78 => NEXT_OUTS <= 1071; -- cmovngw_Gw_Ew SANITY
                when 79 => NEXT_OUTS <= 342; -- cmovgw_Gw_Ew SANITY
                when 80 => NEXT_OUTS <= 235; -- movmskpd_Gd_Upd SANITY
                when 81 => NEXT_OUTS <= 1651; -- sqrtpd_Vpd_Wpd SANITY
                when 84 => NEXT_OUTS <= 17; -- andpd_Vpd_Wpd SANITY
                when 85 => NEXT_OUTS <= 492; -- andnpd_Vpd_Wpd SANITY
                when 86 => NEXT_OUTS <= 646; -- orpd_Vpd_Wpd SANITY
                when 87 => NEXT_OUTS <= 1206; -- xorpd_Vpd_Wpd SANITY
                when 88 => NEXT_OUTS <= 460; -- addpd_Vpd_Wpd SANITY
                when 89 => NEXT_OUTS <= 1264; -- mulpd_Vpd_Wpd SANITY
                when 90 => NEXT_OUTS <= 1243; -- cvtpd2ps_Vps_Wpd SANITY
                when 91 => NEXT_OUTS <= 348; -- cvtps2dq_Vdq_Wps SANITY
                when 92 => NEXT_OUTS <= 1218; -- subpd_Vpd_Wpd SANITY
                when 93 => NEXT_OUTS <= 691; -- minpd_Vpd_Wpd SANITY
                when 94 => NEXT_OUTS <= 284; -- divpd_Vpd_Wpd SANITY
                when 95 => NEXT_OUTS <= 688; -- maxpd_Vpd_Wpd SANITY
                when 96 => NEXT_OUTS <= 10; -- punpcklbw_Vdq_Wdq SANITY
                when 97 => NEXT_OUTS <= 285; -- punpcklwd_Vdq_Wdq SANITY
                when 98 => NEXT_OUTS <= 1238; -- punpckldq_Vdq_Wdq SANITY
                when 99 => NEXT_OUTS <= 68; -- packsswb_Vdq_Wdq SANITY
                when 100 => NEXT_OUTS <= 1040; -- pcmpgtb_Vdq_Wdq SANITY
                when 101 => NEXT_OUTS <= 659; -- pcmpgtw_Vdq_Wdq SANITY
                when 102 => NEXT_OUTS <= 22; -- pcmpgtd_Vdq_Wdq SANITY
                when 103 => NEXT_OUTS <= 1440; -- packuswb_Vdq_Wdq SANITY
                when 104 => NEXT_OUTS <= 973; -- punpckhbw_Vdq_Wdq SANITY
                when 105 => NEXT_OUTS <= 433; -- punpckhwd_Vdq_Wdq SANITY
                when 106 => NEXT_OUTS <= 435; -- punpckhdq_Vdq_Wdq SANITY
                when 107 => NEXT_OUTS <= 1331; -- packssdw_Vdq_Wdq SANITY
                when 108 => NEXT_OUTS <= 1291; -- punpcklqdq_Vdq_Wdq SANITY
                when 109 => NEXT_OUTS <= 125; -- punpckhqdq_Vdq_Wdq SANITY
                when 110 => NEXT_OUTS <= 1428; -- movd_Vdq_Ed SANITY
                when 111 => NEXT_OUTS <= 80; -- movdqa_Vdq_Wdq SANITY
                when 112 => NEXT_OUTS <= 1097; -- pshufd_Vdq_Wdq_Ib SANITY
                when 113 => 
                case OP4 is
                    when 16 => NEXT_OUTS <= 1491; -- psrlw_Udq_Ib SANITY
                    when 32 => NEXT_OUTS <= 1485; -- psraw_Udq_Ib SANITY
                    when 48 => NEXT_OUTS <= 483; -- psllw_Udq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 114 => 
                case OP4 is
                    when 16 => NEXT_OUTS <= 989; -- psrld_Udq_Ib SANITY
                    when 32 => NEXT_OUTS <= 1106; -- psrad_Udq_Ib SANITY
                    when 48 => NEXT_OUTS <= 1311; -- pslld_Udq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 115 => 
                case OP4 is
                    when 16 => NEXT_OUTS <= 1202; -- psrlq_Udq_Ib SANITY
                    when 24 => NEXT_OUTS <= 456; -- psrldq_Udq_Ib SANITY
                    when 48 => NEXT_OUTS <= 1572; -- psllq_Udq_Ib SANITY
                    when 56 => NEXT_OUTS <= 832; -- pslldq_Udq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 116 => NEXT_OUTS <= 305; -- pcmpeqb_Vdq_Wdq SANITY
                when 117 => NEXT_OUTS <= 319; -- pcmpeqw_Vdq_Wdq SANITY
                when 118 => NEXT_OUTS <= 542; -- pcmpeqd_Vdq_Wdq SANITY
                when 124 => NEXT_OUTS <= 1271; -- haddpd_Vpd_Wpd SANITY
                when 125 => NEXT_OUTS <= 838; -- hsubpd_Vpd_Wpd SANITY
                when 126 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 694; -- movd_Ed_Vd SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 127 => NEXT_OUTS <= 1023; -- movdqa_Wdq_Vdq SANITY
                when 128 => NEXT_OUTS <= 847; -- jo_Jw SANITY
                when 129 => NEXT_OUTS <= 1308; -- jno_Jw SANITY
                when 130 => NEXT_OUTS <= 1284; -- jb_Jw SANITY
                when 131 => NEXT_OUTS <= 952; -- jnb_Jw SANITY
                when 132 => NEXT_OUTS <= 12; -- jz_Jw SANITY
                when 133 => NEXT_OUTS <= 1066; -- jnz_Jw SANITY
                when 134 => NEXT_OUTS <= 679; -- jbe_Jw SANITY
                when 135 => NEXT_OUTS <= 1498; -- jnbe_Jw SANITY
                when 136 => NEXT_OUTS <= 1048; -- js_Jw SANITY
                when 137 => NEXT_OUTS <= 1226; -- jns_Jw SANITY
                when 138 => NEXT_OUTS <= 1403; -- jp_Jw SANITY
                when 139 => NEXT_OUTS <= 1534; -- jnp_Jw SANITY
                when 140 => NEXT_OUTS <= 1445; -- jl_Jw SANITY
                when 141 => NEXT_OUTS <= 1531; -- jnl_Jw SANITY
                when 142 => NEXT_OUTS <= 333; -- jle_Jw SANITY
                when 143 => NEXT_OUTS <= 678; -- jnle_Jw SANITY
                when 160 => NEXT_OUTS <= 1605; -- pushw_FS SANITY
                when 161 => NEXT_OUTS <= 1151; -- popw_FS SANITY
                when 163 => NEXT_OUTS <= 855; -- btw_Ew_Gw SANITY
                when 164 => NEXT_OUTS <= 443; -- shldw_Ew_Gw_Ib SANITY
                when 165 => NEXT_OUTS <= 1018; -- shldw_Ew_Gw_CL SANITY
                when 168 => NEXT_OUTS <= 1061; -- pushw_GS SANITY
                when 169 => NEXT_OUTS <= 1551; -- popw_GS SANITY
                when 171 => NEXT_OUTS <= 1187; -- btsw_Ew_Gw SANITY
                when 172 => NEXT_OUTS <= 1222; -- shrdw_Ew_Gw_Ib SANITY
                when 173 => NEXT_OUTS <= 268; -- shrdw_Ew_Gw_CL SANITY
                when 175 => NEXT_OUTS <= 306; -- imulw_Gw_Ew SANITY
                when 177 => NEXT_OUTS <= 874; -- cmpxchgw_Ew_Gw SANITY
                when 178 => NEXT_OUTS <= 1215; -- lssw_Gw_Mp SANITY
                when 179 => NEXT_OUTS <= 1070; -- btrw_Ew_Gw SANITY
                when 180 => NEXT_OUTS <= 1461; -- lfsw_Gw_Mp SANITY
                when 181 => NEXT_OUTS <= 1139; -- lgsw_Gw_Mp SANITY
                when 182 => NEXT_OUTS <= 153; -- movzbw_Gw_Eb SANITY
                when 186 => 
                case OP4 is
                    when 32 => NEXT_OUTS <= 497; -- btw_Ew_Ib SANITY
                    when 40 => NEXT_OUTS <= 796; -- btsw_Ew_Ib SANITY
                    when 48 => NEXT_OUTS <= 872; -- btrw_Ew_Ib SANITY
                    when 56 => NEXT_OUTS <= 157; -- btcw_Ew_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 187 => NEXT_OUTS <= 232; -- btcw_Ew_Gw SANITY
                when 188 => NEXT_OUTS <= 575; -- bsfw_Gw_Ew SANITY
                when 189 => NEXT_OUTS <= 1341; -- bsrw_Gw_Ew SANITY
                when 190 => NEXT_OUTS <= 1577; -- movsbw_Gw_Eb SANITY
                when 193 => NEXT_OUTS <= 1568; -- xaddw_Ew_Gw SANITY
                when 194 => 
                case OP4 is
                    when 0 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 550; -- cmppd_Vpd_Wpd_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 196 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 1470; -- pinsrw_Vdq_Ew_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 197 => NEXT_OUTS <= 1585; -- pextrw_Gd_Udq_Ib SANITY
                when 198 => NEXT_OUTS <= 79; -- shufpd_Vpd_Wpd_Ib SANITY
                when 199 => 
                case OP4 is
                    when 48 => NEXT_OUTS <= 647; -- vmclear_Mq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 208 => NEXT_OUTS <= 510; -- addsubpd_Vpd_Wpd SANITY
                when 209 => NEXT_OUTS <= 633; -- psrlw_Vdq_Wdq SANITY
                when 210 => NEXT_OUTS <= 567; -- psrld_Vdq_Wdq SANITY
                when 211 => NEXT_OUTS <= 666; -- psrlq_Vdq_Wdq SANITY
                when 212 => NEXT_OUTS <= 627; -- paddq_Vdq_Wdq SANITY
                when 213 => NEXT_OUTS <= 136; -- pmullw_Vdq_Wdq SANITY
                when 214 => NEXT_OUTS <= 532; -- movq_Wq_Vq SANITY
                when 215 => NEXT_OUTS <= 559; -- pmovmskb_Gd_Udq SANITY
                when 216 => NEXT_OUTS <= 1422; -- psubusb_Vdq_Wdq SANITY
                when 217 => NEXT_OUTS <= 724; -- psubusw_Vdq_Wdq SANITY
                when 218 => NEXT_OUTS <= 1370; -- pminub_Vdq_Wdq SANITY
                when 219 => NEXT_OUTS <= 110; -- pand_Vdq_Wdq SANITY
                when 220 => NEXT_OUTS <= 385; -- paddusb_Vdq_Wdq SANITY
                when 221 => NEXT_OUTS <= 967; -- paddusw_Vdq_Wdq SANITY
                when 222 => NEXT_OUTS <= 964; -- pmaxub_Vdq_Wdq SANITY
                when 223 => NEXT_OUTS <= 50; -- pandn_Vdq_Wdq SANITY
                when 224 => NEXT_OUTS <= 786; -- pavgb_Vdq_Wdq SANITY
                when 225 => NEXT_OUTS <= 1310; -- psraw_Vdq_Wdq SANITY
                when 226 => NEXT_OUTS <= 1580; -- psrad_Vdq_Wdq SANITY
                when 227 => NEXT_OUTS <= 216; -- pavgw_Vdq_Wdq SANITY
                when 228 => NEXT_OUTS <= 790; -- pmulhuw_Vdq_Wdq SANITY
                when 229 => NEXT_OUTS <= 26; -- pmulhw_Vdq_Wdq SANITY
                when 230 => NEXT_OUTS <= 101; -- cvttpd2dq_Vq_Wpd SANITY
                when 231 => NEXT_OUTS <= 1519; -- movntdq_Mdq_Vdq SANITY
                when 232 => NEXT_OUTS <= 117; -- psubsb_Vdq_Wdq SANITY
                when 233 => NEXT_OUTS <= 1279; -- psubsw_Vdq_Wdq SANITY
                when 234 => NEXT_OUTS <= 941; -- pminsw_Vdq_Wdq SANITY
                when 235 => NEXT_OUTS <= 573; -- por_Vdq_Wdq SANITY
                when 236 => NEXT_OUTS <= 880; -- paddsb_Vdq_Wdq SANITY
                when 237 => NEXT_OUTS <= 1569; -- paddsw_Vdq_Wdq SANITY
                when 238 => NEXT_OUTS <= 1038; -- pmaxsw_Vdq_Wdq SANITY
                when 239 => NEXT_OUTS <= 1313; -- pxor_Vdq_Wdq SANITY
                when 241 => NEXT_OUTS <= 270; -- psllw_Vdq_Wdq SANITY
                when 242 => NEXT_OUTS <= 190; -- pslld_Vdq_Wdq SANITY
                when 243 => NEXT_OUTS <= 910; -- psllq_Vdq_Wdq SANITY
                when 244 => NEXT_OUTS <= 673; -- pmuludq_Vdq_Wdq SANITY
                when 245 => NEXT_OUTS <= 145; -- pmaddwd_Vdq_Wdq SANITY
                when 246 => NEXT_OUTS <= 1254; -- psadbw_Vdq_Wdq SANITY
                when 247 => NEXT_OUTS <= 1175; -- maskmovdqu_Vdq_Udq SANITY
                when 248 => NEXT_OUTS <= 199; -- psubb_Vdq_Wdq SANITY
                when 249 => NEXT_OUTS <= 1469; -- psubw_Vdq_Wdq SANITY
                when 250 => NEXT_OUTS <= 481; -- psubd_Vdq_Wdq SANITY
                when 251 => NEXT_OUTS <= 682; -- psubq_Vdq_Wdq SANITY
                when 252 => NEXT_OUTS <= 1393; -- paddb_Vdq_Wdq SANITY
                when 253 => NEXT_OUTS <= 1007; -- paddw_Vdq_Wdq SANITY
                when 254 => NEXT_OUTS <= 505; -- paddd_Vdq_Wdq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 17 => NEXT_OUTS <= 1556; -- adcw_Ew_Gw SANITY
            when 19 => NEXT_OUTS <= 741; -- adcw_Gw_Ew SANITY
            when 21 => NEXT_OUTS <= 896; -- adcw_AX_Iw SANITY
            when 22 => NEXT_OUTS <= 876; -- pushw_SS SANITY
            when 23 => NEXT_OUTS <= 1214; -- popw_SS SANITY
            when 25 => NEXT_OUTS <= 1330; -- sbbw_Ew_Gw SANITY
            when 27 => NEXT_OUTS <= 1014; -- sbbw_Gw_Ew SANITY
            when 29 => NEXT_OUTS <= 92; -- sbbw_AX_Iw SANITY
            when 30 => NEXT_OUTS <= 1352; -- pushw_DS SANITY
            when 31 => NEXT_OUTS <= 760; -- popw_DS SANITY
            when 33 => NEXT_OUTS <= 1650; -- andw_Ew_Gw SANITY
            when 35 => NEXT_OUTS <= 375; -- andw_Gw_Ew SANITY
            when 37 => NEXT_OUTS <= 1055; -- andw_AX_Iw SANITY
            when 41 => NEXT_OUTS <= 781; -- subw_Ew_Gw SANITY
            when 43 => NEXT_OUTS <= 225; -- subw_Gw_Ew SANITY
            when 45 => NEXT_OUTS <= 556; -- subw_AX_Iw SANITY
            when 49 => NEXT_OUTS <= 518; -- xorw_Ew_Gw SANITY
            when 51 => NEXT_OUTS <= 845; -- xorw_Gw_Ew SANITY
            when 53 => NEXT_OUTS <= 1265; -- xorw_AX_Iw SANITY
            when 57 => NEXT_OUTS <= 1539; -- cmpw_Ew_Gw SANITY
            when 59 => NEXT_OUTS <= 1487; -- cmpw_Gw_Ew SANITY
            when 61 => NEXT_OUTS <= 303; -- cmpw_AX_Iw SANITY
            when 64 => NEXT_OUTS <= 1278; -- incw_RX SANITY
            when 72 => 
            case OP3 is
                when 15 => 
                case OP4 is
                    when 58 => 
                    case OP5 is
                        when 22 => NEXT_OUTS <= 680; -- pextrq_Eq_Vdq_Ib SANITY
                        when 34 => NEXT_OUTS <= 475; -- pinsrq_Vdq_Eq_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 110 => NEXT_OUTS <= 751; -- movq_Vdq_Eq SANITY
                    when 126 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 382; -- movq_Eq_Vq SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 80 => NEXT_OUTS <= 138; -- pushw_RX SANITY
            when 88 => NEXT_OUTS <= 1654; -- popw_RX SANITY
            when 96 => NEXT_OUTS <= 1441; -- pushaw SANITY
            when 97 => NEXT_OUTS <= 336; -- popaw SANITY
            when 98 => NEXT_OUTS <= 1252; -- boundw_Gw_Ma SANITY
            when 104 => NEXT_OUTS <= 1172; -- pushw_Iw SANITY
            when 105 => NEXT_OUTS <= 770; -- imulw_Gw_Ew_Iw SANITY
            when 106 => NEXT_OUTS <= 1050; -- pushw_sIb SANITY
            when 107 => NEXT_OUTS <= 440; -- imulw_Gw_Ew_sIb SANITY
            when 109 => NEXT_OUTS <= 338; -- insw_Yw_DX SANITY
            when 111 => NEXT_OUTS <= 745; -- outsw_DX_Xw SANITY
            when 129 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 203; -- addw_Ew_Iw SANITY
                when 8 => NEXT_OUTS <= 1618; -- orw_Ew_Iw SANITY
                when 16 => NEXT_OUTS <= 1025; -- adcw_Ew_Iw SANITY
                when 24 => NEXT_OUTS <= 48; -- sbbw_Ew_Iw SANITY
                when 32 => NEXT_OUTS <= 371; -- andw_Ew_Iw SANITY
                when 40 => NEXT_OUTS <= 422; -- subw_Ew_Iw SANITY
                when 48 => NEXT_OUTS <= 1395; -- xorw_Ew_Iw SANITY
                when 56 => NEXT_OUTS <= 215; -- cmpw_Ew_Iw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 131 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1477; -- addw_Ew_sIb SANITY
                when 8 => NEXT_OUTS <= 1244; -- orw_Ew_sIb SANITY
                when 16 => NEXT_OUTS <= 1021; -- adcw_Ew_sIb SANITY
                when 24 => NEXT_OUTS <= 1083; -- sbbw_Ew_sIb SANITY
                when 32 => NEXT_OUTS <= 450; -- andw_Ew_sIb SANITY
                when 40 => NEXT_OUTS <= 1277; -- subw_Ew_sIb SANITY
                when 48 => NEXT_OUTS <= 672; -- xorw_Ew_sIb SANITY
                when 56 => NEXT_OUTS <= 1479; -- cmpw_Ew_sIb SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 133 => NEXT_OUTS <= 1184; -- testw_Ew_Gw SANITY
            when 135 => NEXT_OUTS <= 1030; -- xchgw_Ew_Gw SANITY
            when 137 => NEXT_OUTS <= 1299; -- movw_Ew_Gw SANITY
            when 139 => NEXT_OUTS <= 1537; -- movw_Gw_Ew SANITY
            when 141 => NEXT_OUTS <= 1561; -- leaw_Gw_Mw SANITY
            when 143 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 312; -- popw_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 145 => NEXT_OUTS <= 1468; -- xchgw_RX_AX SANITY
            when 152 => NEXT_OUTS <= 71; -- cbw SANITY
            when 153 => NEXT_OUTS <= 1204; -- cwd SANITY
            when 154 => NEXT_OUTS <= 1107; -- lcall_Apw SANITY
            when 156 => NEXT_OUTS <= 172; -- pushfw SANITY
            when 157 => NEXT_OUTS <= 129; -- popfw SANITY
            when 161 => NEXT_OUTS <= 1649; -- movw_AX_Ow SANITY
            when 163 => NEXT_OUTS <= 1495; -- movw_Ow_AX SANITY
            when 165 => NEXT_OUTS <= 1346; -- movsw_Yw_Xw SANITY
            when 167 => NEXT_OUTS <= 1661; -- cmpsw_Yw_Xw SANITY
            when 169 => NEXT_OUTS <= 359; -- testw_AX_Iw SANITY
            when 171 => NEXT_OUTS <= 294; -- stosw_Yw_AX SANITY
            when 173 => NEXT_OUTS <= 1451; -- lodsw_AX_Xw SANITY
            when 175 => NEXT_OUTS <= 114; -- scasw_Yw_AX SANITY
            when 184 => NEXT_OUTS <= 868; -- movw_RX_Iw SANITY
            when 193 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 208; -- rolw_Ew_Ib SANITY
                when 8 => NEXT_OUTS <= 1590; -- rorw_Ew_Ib SANITY
                when 16 => NEXT_OUTS <= 361; -- rclw_Ew_Ib SANITY
                when 24 => NEXT_OUTS <= 1121; -- rcrw_Ew_Ib SANITY
                when 32 => NEXT_OUTS <= 689; -- shlw_Ew_Ib SANITY
                when 40 => NEXT_OUTS <= 1489; -- shrw_Ew_Ib SANITY
                when 56 => NEXT_OUTS <= 636; -- sarw_Ew_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 196 => NEXT_OUTS <= 728; -- lesw_Gw_Mp SANITY
            when 197 => NEXT_OUTS <= 1249; -- ldsw_Gw_Mp SANITY
            when 199 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 915; -- movw_Ew_Iw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 207 => NEXT_OUTS <= 1619; -- iretw SANITY
            when 209 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1188; -- rolw_Ew_I1 SANITY
                when 8 => NEXT_OUTS <= 1406; -- rorw_Ew_I1 SANITY
                when 16 => NEXT_OUTS <= 890; -- rclw_Ew_I1 SANITY
                when 24 => NEXT_OUTS <= 1529; -- rcrw_Ew_I1 SANITY
                when 32 => NEXT_OUTS <= 1464; -- shlw_Ew_I1 SANITY
                when 40 => NEXT_OUTS <= 648; -- shrw_Ew_I1 SANITY
                when 56 => NEXT_OUTS <= 2; -- sarw_Ew_I1 SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 211 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1390; -- rolw_Ew_CL SANITY
                when 8 => NEXT_OUTS <= 857; -- rorw_Ew_CL SANITY
                when 16 => NEXT_OUTS <= 1163; -- rclw_Ew_CL SANITY
                when 24 => NEXT_OUTS <= 471; -- rcrw_Ew_CL SANITY
                when 32 => NEXT_OUTS <= 323; -- shlw_Ew_CL SANITY
                when 40 => NEXT_OUTS <= 865; -- shrw_Ew_CL SANITY
                when 56 => NEXT_OUTS <= 514; -- sarw_Ew_CL SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 229 => NEXT_OUTS <= 927; -- inw_AX_Ib SANITY
            when 231 => NEXT_OUTS <= 148; -- outw_Ib_AX SANITY
            when 232 => NEXT_OUTS <= 1467; -- call_Jw SANITY
            when 233 => NEXT_OUTS <= 1053; -- jmp_Jw SANITY
            when 234 => NEXT_OUTS <= 1633; -- ljmp_Apw SANITY
            when 237 => NEXT_OUTS <= 920; -- inw_AX_DX SANITY
            when 239 => NEXT_OUTS <= 1626; -- outw_DX_AX SANITY
            when 242 => 
            case OP3 is
                when 15 => 
                case OP4 is
                    when 56 => 
                    case OP5 is
                        when 241 => 
                        case OP6 is
                            when 195 => NEXT_OUTS <= 1146; -- crc32_Gd_Ew SANITY
                            when others => NEXT_OUTS <= 0; -- invalid
                        end case;
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 243 => 
            case OP3 is
                when 15 => 
                case OP4 is
                    when 184 => NEXT_OUTS <= 95; -- popcnt_Gw_Ew SANITY
                    when 188 => NEXT_OUTS <= 536; -- tzcntw_Gw_Ew SANITY
                    when 189 => NEXT_OUTS <= 140; -- lzcntw_Gw_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 247 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1427; -- testw_Ew_Iw SANITY
                when 16 => NEXT_OUTS <= 380; -- notw_Ew SANITY
                when 24 => NEXT_OUTS <= 1230; -- negw_Ew SANITY
                when 32 => NEXT_OUTS <= 1033; -- mulw_AX_Ew SANITY
                when 40 => NEXT_OUTS <= 1043; -- imulw_AX_Ew SANITY
                when 48 => NEXT_OUTS <= 814; -- divw_AX_Ew SANITY
                when 56 => NEXT_OUTS <= 1173; -- idivw_AX_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 255 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1282; -- incw_Ew SANITY
                when 8 => NEXT_OUTS <= 462; -- decw_Ew SANITY
                when 16 => NEXT_OUTS <= 1609; -- call_Ew SANITY
                when 32 => NEXT_OUTS <= 1300; -- jmp_Ew SANITY
                when 48 => NEXT_OUTS <= 1490; -- pushw_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 103 => 
        case OP2 is
            when 227 => NEXT_OUTS <= 465; -- jcxz_Jb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 104 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 591; -- pushl_Id SANITY
            when 1 => NEXT_OUTS <= 1658; -- pushq_sId SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 105 => NEXT_OUTS <= 438; -- imull_Gd_Ed_Id SANITY
        when 106 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 392; -- pushl_sIb SANITY
            when 1 => NEXT_OUTS <= 314; -- pushq_sIb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 107 => NEXT_OUTS <= 579; -- imull_Gd_Ed_sIb SANITY
        when 108 => NEXT_OUTS <= 1177; -- insb_Yb_DX SANITY
        when 109 => NEXT_OUTS <= 709; -- insl_Yd_DX SANITY
        when 110 => NEXT_OUTS <= 1225; -- outsb_DX_Xb SANITY
        when 111 => NEXT_OUTS <= 461; -- outsl_DX_Xd SANITY
        when 112 => NEXT_OUTS <= 921; -- jo_Jb SANITY
        when 113 => NEXT_OUTS <= 229; -- jno_Jb SANITY
        when 114 => NEXT_OUTS <= 82; -- jb_Jb SANITY
        when 115 => NEXT_OUTS <= 241; -- jnb_Jb SANITY
        when 116 => NEXT_OUTS <= 1506; -- jz_Jb SANITY
        when 117 => NEXT_OUTS <= 621; -- jnz_Jb SANITY
        when 118 => NEXT_OUTS <= 1143; -- jbe_Jb SANITY
        when 119 => NEXT_OUTS <= 642; -- jnbe_Jb SANITY
        when 120 => NEXT_OUTS <= 787; -- js_Jb SANITY
        when 121 => NEXT_OUTS <= 668; -- jns_Jb SANITY
        when 122 => NEXT_OUTS <= 108; -- jp_Jb SANITY
        when 123 => NEXT_OUTS <= 1104; -- jnp_Jb SANITY
        when 124 => NEXT_OUTS <= 1336; -- jl_Jb SANITY
        when 125 => NEXT_OUTS <= 875; -- jnl_Jb SANITY
        when 126 => NEXT_OUTS <= 976; -- jle_Jb SANITY
        when 127 => NEXT_OUTS <= 1149; -- jnle_Jb SANITY
        when 128 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 237; -- addb_Eb_Ib SANITY
            when 8 => NEXT_OUTS <= 1665; -- orb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 652; -- adcb_Eb_Ib SANITY
            when 24 => NEXT_OUTS <= 32; -- sbbb_Eb_Ib SANITY
            when 32 => NEXT_OUTS <= 654; -- andb_Eb_Ib SANITY
            when 40 => NEXT_OUTS <= 1135; -- subb_Eb_Ib SANITY
            when 48 => NEXT_OUTS <= 917; -- xorb_Eb_Ib SANITY
            when 56 => NEXT_OUTS <= 1315; -- cmpb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 129 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 825; -- addl_Ed_Id SANITY
            when 8 => NEXT_OUTS <= 1656; -- orl_Ed_Id SANITY
            when 16 => NEXT_OUTS <= 644; -- adcl_Ed_Id SANITY
            when 24 => NEXT_OUTS <= 164; -- sbbl_Ed_Id SANITY
            when 32 => NEXT_OUTS <= 1316; -- andl_Ed_Id SANITY
            when 40 => NEXT_OUTS <= 634; -- subl_Ed_Id SANITY
            when 48 => NEXT_OUTS <= 107; -- xorl_Ed_Id SANITY
            when 56 => NEXT_OUTS <= 421; -- cmpl_Ed_Id SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 131 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1552; -- addl_Ed_sIb SANITY
            when 8 => NEXT_OUTS <= 1363; -- orl_Ed_sIb SANITY
            when 16 => NEXT_OUTS <= 1062; -- adcl_Ed_sIb SANITY
            when 24 => NEXT_OUTS <= 193; -- sbbl_Ed_sIb SANITY
            when 32 => NEXT_OUTS <= 521; -- andl_Ed_sIb SANITY
            when 40 => NEXT_OUTS <= 544; -- subl_Ed_sIb SANITY
            when 48 => NEXT_OUTS <= 85; -- xorl_Ed_sIb SANITY
            when 56 => NEXT_OUTS <= 1096; -- cmpl_Ed_sIb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 132 => NEXT_OUTS <= 686; -- testb_Eb_Gb SANITY
        when 133 => NEXT_OUTS <= 23; -- testl_Ed_Gd SANITY
        when 134 => NEXT_OUTS <= 500; -- xchgb_Eb_Gb SANITY
        when 135 => NEXT_OUTS <= 1501; -- xchgl_Ed_Gd SANITY
        when 136 => NEXT_OUTS <= 373; -- movb_Eb_Gb SANITY
        when 137 => NEXT_OUTS <= 1092; -- movl_Ed_Gd SANITY
        when 138 => NEXT_OUTS <= 213; -- movb_Gb_Eb SANITY
        when 139 => NEXT_OUTS <= 160; -- movl_Gd_Ed SANITY
        when 140 => NEXT_OUTS <= 1113; -- movw_Ew_Sw SANITY
        when 141 => NEXT_OUTS <= 53; -- leal_Gd_Md SANITY
        when 142 => NEXT_OUTS <= 159; -- movw_Sw_Ew SANITY
        when 143 => 
        case OP2 is
            when 0 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1475; -- popl_Ed SANITY
                when 1 => NEXT_OUTS <= 351; -- popq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 144 => NEXT_OUTS <= 607; -- nop SANITY
        when 145 => NEXT_OUTS <= 608; -- xchgl_ERX_EAX SANITY
        when 152 => NEXT_OUTS <= 1573; -- cwde SANITY
        when 153 => NEXT_OUTS <= 1060; -- cdq SANITY
        when 154 => NEXT_OUTS <= 112; -- lcall_Apd SANITY
        when 155 => NEXT_OUTS <= 63; -- fwait SANITY
        when 156 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 280; -- pushfl SANITY
            when 1 => NEXT_OUTS <= 1117; -- pushfq SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 157 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 42; -- popfl SANITY
            when 1 => NEXT_OUTS <= 692; -- popfq SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 158 => NEXT_OUTS <= 1625; -- sahf SANITY
        when 159 => NEXT_OUTS <= 344; -- lahf SANITY
        when 160 => NEXT_OUTS <= 1301; -- movb_AL_Ob SANITY
        when 161 => NEXT_OUTS <= 432; -- movl_EAX_Od SANITY
        when 162 => NEXT_OUTS <= 1181; -- movb_Ob_AL SANITY
        when 163 => NEXT_OUTS <= 121; -- movl_Od_EAX SANITY
        when 164 => NEXT_OUTS <= 113; -- movsb_Yb_Xb SANITY
        when 165 => NEXT_OUTS <= 1196; -- movsl_Yd_Xd SANITY
        when 166 => NEXT_OUTS <= 260; -- cmpsb_Yb_Xb SANITY
        when 167 => NEXT_OUTS <= 1493; -- cmpsl_Yd_Xd SANITY
        when 168 => NEXT_OUTS <= 1250; -- testb_AL_Ib SANITY
        when 169 => NEXT_OUTS <= 1069; -- testl_EAX_Id SANITY
        when 170 => NEXT_OUTS <= 695; -- stosb_Yb_AL SANITY
        when 171 => NEXT_OUTS <= 196; -- stosl_Yd_EAX SANITY
        when 172 => NEXT_OUTS <= 1513; -- lodsb_AL_Xb SANITY
        when 173 => NEXT_OUTS <= 1246; -- lodsl_EAX_Xd SANITY
        when 174 => NEXT_OUTS <= 374; -- scasb_Yb_AL SANITY
        when 175 => NEXT_OUTS <= 1421; -- scasl_Yd_EAX SANITY
        when 176 => NEXT_OUTS <= 130; -- movb_R8_Ib SANITY
        when 184 => NEXT_OUTS <= 576; -- movl_ERX_Id SANITY
        when 192 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 702; -- rolb_Eb_Ib SANITY
            when 8 => NEXT_OUTS <= 639; -- rorb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 1039; -- rclb_Eb_Ib SANITY
            when 24 => NEXT_OUTS <= 1000; -- rcrb_Eb_Ib SANITY
            when 32 => NEXT_OUTS <= 43; -- shlb_Eb_Ib SANITY
            when 40 => NEXT_OUTS <= 729; -- shrb_Eb_Ib SANITY
            when 56 => NEXT_OUTS <= 1076; -- sarb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 193 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1195; -- roll_Ed_Ib SANITY
            when 8 => NEXT_OUTS <= 366; -- rorl_Ed_Ib SANITY
            when 16 => NEXT_OUTS <= 899; -- rcll_Ed_Ib SANITY
            when 24 => NEXT_OUTS <= 1500; -- rcrl_Ed_Ib SANITY
            when 32 => NEXT_OUTS <= 369; -- shll_Ed_Ib SANITY
            when 40 => NEXT_OUTS <= 1540; -- shrl_Ed_Ib SANITY
            when 56 => NEXT_OUTS <= 547; -- sarl_Ed_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 194 => NEXT_OUTS <= 109; -- ret_Iw SANITY
        when 195 => NEXT_OUTS <= 198; -- ret SANITY
        when 196 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 791; -- lesl_Gd_Mp SANITY
            when 225 => 
            case OP3 is
                when 249 => 
                case OP4 is
                    when 110 => NEXT_OUTS <= 987; -- vmovq_Vdq_Eq SANITY
                    when 126 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 1110; -- vmovq_Eq_Vq SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 226 => 
            case OP3 is
                when 80 => 
                case OP4 is
                    when 242 => NEXT_OUTS <= 67; -- andn_Gy_By_Ey SANITY
                    when 243 => 
                    case OP5 is
                        when 8 => NEXT_OUTS <= 1356; -- blsr_By_Ey SANITY
                        when 16 => NEXT_OUTS <= 1082; -- blsmsk_By_Ey SANITY
                        when 24 => NEXT_OUTS <= 715; -- blsi_By_Ey SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 245 => NEXT_OUTS <= 1439; -- bzhi_Gy_Ey_By SANITY
                    when 247 => NEXT_OUTS <= 31; -- bextr_Gy_Ey_By SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 81 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 3; -- vpshufb_Vdq_Hdq_Wdq SANITY
                    when 1 => NEXT_OUTS <= 552; -- vphaddw_Vdq_Hdq_Wdq SANITY
                    when 2 => NEXT_OUTS <= 13; -- vphaddd_Vdq_Hdq_Wdq SANITY
                    when 3 => NEXT_OUTS <= 613; -- vphaddsw_Vdq_Hdq_Wdq SANITY
                    when 4 => NEXT_OUTS <= 309; -- vpmaddubsw_Vdq_Hdq_Wdq SANITY
                    when 5 => NEXT_OUTS <= 764; -- vphsubw_Vdq_Hdq_Wdq SANITY
                    when 6 => NEXT_OUTS <= 1015; -- vphsubd_Vdq_Hdq_Wdq SANITY
                    when 7 => NEXT_OUTS <= 266; -- vphsubsw_Vdq_Hdq_Wdq SANITY
                    when 8 => NEXT_OUTS <= 774; -- vpsignb_Vdq_Hdq_Wdq SANITY
                    when 9 => NEXT_OUTS <= 1342; -- vpsignw_Vdq_Hdq_Wdq SANITY
                    when 10 => NEXT_OUTS <= 1156; -- vpsignd_Vdq_Hdq_Wdq SANITY
                    when 11 => NEXT_OUTS <= 15; -- vpmulhrsw_Vdq_Hdq_Wdq SANITY
                    when 12 => NEXT_OUTS <= 538; -- vpermilps_Vps_Hps_Wps SANITY
                    when 13 => NEXT_OUTS <= 650; -- vpermilpd_Vpd_Hpd_Wpd SANITY
                    when 22 => NEXT_OUTS <= 1237; -- vpermps_Vps_Hps_Wps SANITY
                    when 40 => NEXT_OUTS <= 419; -- vpmuldq_Vdq_Hdq_Wdq SANITY
                    when 41 => NEXT_OUTS <= 1414; -- vpcmpeqq_Vdq_Hdq_Wdq SANITY
                    when 43 => NEXT_OUTS <= 1472; -- vpackusdw_Vdq_Hdq_Wdq SANITY
                    when 44 => NEXT_OUTS <= 376; -- vmaskmovps_Vps_Hps_Mps SANITY
                    when 45 => NEXT_OUTS <= 704; -- vmaskmovpd_Vpd_Hpd_Mpd SANITY
                    when 46 => NEXT_OUTS <= 706; -- vmaskmovps_Mps_Hps_Vps SANITY
                    when 47 => NEXT_OUTS <= 568; -- vmaskmovpd_Mpd_Hpd_Vpd SANITY
                    when 54 => NEXT_OUTS <= 944; -- vpermd_Vdq_Hdq_Wdq SANITY
                    when 55 => NEXT_OUTS <= 632; -- vpcmpgtq_Vdq_Hdq_Wdq SANITY
                    when 56 => NEXT_OUTS <= 1507; -- vpminsb_Vdq_Hdq_Wdq SANITY
                    when 57 => NEXT_OUTS <= 763; -- vpminsd_Vdq_Hdq_Wdq SANITY
                    when 58 => NEXT_OUTS <= 1209; -- vpminuw_Vdq_Hdq_Wdq SANITY
                    when 59 => NEXT_OUTS <= 545; -- vpminud_Vdq_Hdq_Wdq SANITY
                    when 60 => NEXT_OUTS <= 379; -- vpmaxsb_Vdq_Hdq_Wdq SANITY
                    when 61 => NEXT_OUTS <= 1221; -- vpmaxsd_Vdq_Hdq_Wdq SANITY
                    when 62 => NEXT_OUTS <= 149; -- vpmaxuw_Vdq_Hdq_Wdq SANITY
                    when 63 => NEXT_OUTS <= 1176; -- vpmaxud_Vdq_Hdq_Wdq SANITY
                    when 64 => NEXT_OUTS <= 274; -- vpmulld_Vdq_Hdq_Wdq SANITY
                    when 69 => NEXT_OUTS <= 861; -- vpsrlvd_Vdq_Hdq_Wdq SANITY
                    when 70 => NEXT_OUTS <= 176; -- vpsravd_Vdq_Hdq_Wdq SANITY
                    when 71 => NEXT_OUTS <= 1486; -- vpsllvd_Vdq_Hdq_Wdq SANITY
                    when 140 => NEXT_OUTS <= 713; -- vmaskmovd_Vdq_Hdq_Mdq SANITY
                    when 142 => NEXT_OUTS <= 1517; -- vmaskmovq_Mdq_Hdq_Vdq SANITY
                    when 144 => NEXT_OUTS <= 1647; -- vgatherdd_Vdq_VSib_Hdq SANITY
                    when 145 => NEXT_OUTS <= 1212; -- vgatherqd_Vdq_VSib_Hdq SANITY
                    when 146 => NEXT_OUTS <= 1283; -- vgatherdps_Vps_VSib_Hps SANITY
                    when 147 => NEXT_OUTS <= 1168; -- vgatherqps_Vps_VSib_Hps SANITY
                    when 150 => NEXT_OUTS <= 222; -- vfmaddsub132ps_Vps_Hps_Wps SANITY
                    when 151 => NEXT_OUTS <= 830; -- vfmsubadd132ps_Vps_Hps_Wps SANITY
                    when 152 => NEXT_OUTS <= 954; -- vfmadd132ps_Vps_Hps_Wps SANITY
                    when 153 => NEXT_OUTS <= 924; -- vfmadd132ss_Vps_Hss_Wss SANITY
                    when 154 => NEXT_OUTS <= 1516; -- vfmsub132ps_Vps_Hps_Wps SANITY
                    when 155 => NEXT_OUTS <= 795; -- vfmsub132ss_Vps_Hss_Wss SANITY
                    when 156 => NEXT_OUTS <= 1455; -- vfnmadd132ps_Vps_Hps_Wps SANITY
                    when 157 => NEXT_OUTS <= 1084; -- vfnmadd132ss_Vps_Hss_Wss SANITY
                    when 158 => NEXT_OUTS <= 1351; -- vfnmsub132ps_Vps_Hps_Wps SANITY
                    when 159 => NEXT_OUTS <= 1635; -- vfnmsub132ss_Vps_Hss_Wss SANITY
                    when 166 => NEXT_OUTS <= 853; -- vfmaddsub213ps_Vps_Hps_Wps SANITY
                    when 167 => NEXT_OUTS <= 779; -- vfmsubadd213ps_Vps_Hps_Wps SANITY
                    when 168 => NEXT_OUTS <= 963; -- vfmadd213ps_Vps_Hps_Wps SANITY
                    when 169 => NEXT_OUTS <= 643; -- vfmadd213ss_Vps_Hss_Wss SANITY
                    when 170 => NEXT_OUTS <= 842; -- vfmsub213ps_Vps_Hps_Wps SANITY
                    when 171 => NEXT_OUTS <= 761; -- vfmsub213ss_Vps_Hss_Wss SANITY
                    when 172 => NEXT_OUTS <= 1600; -- vfnmadd213ps_Vps_Hps_Wps SANITY
                    when 173 => NEXT_OUTS <= 846; -- vfnmadd213ss_Vps_Hss_Wss SANITY
                    when 174 => NEXT_OUTS <= 116; -- vfnmsub213ps_Vps_Hps_Wps SANITY
                    when 175 => NEXT_OUTS <= 977; -- vfnmsub213ss_Vps_Hss_Wss SANITY
                    when 182 => NEXT_OUTS <= 204; -- vfmaddsub231ps_Vps_Hps_Wps SANITY
                    when 183 => NEXT_OUTS <= 1629; -- vfmsubadd231ps_Vps_Hps_Wps SANITY
                    when 184 => NEXT_OUTS <= 298; -- vfmadd231ps_Vps_Hps_Wps SANITY
                    when 185 => NEXT_OUTS <= 945; -- vfmadd231ss_Vps_Hss_Wss SANITY
                    when 186 => NEXT_OUTS <= 844; -- vfmsub231ps_Vps_Hps_Wps SANITY
                    when 187 => NEXT_OUTS <= 782; -- vfmsub231ss_Vps_Hss_Wss SANITY
                    when 188 => NEXT_OUTS <= 619; -- vfnmadd231ps_Vps_Hps_Wps SANITY
                    when 189 => NEXT_OUTS <= 1340; -- vfnmadd231ss_Vps_Hss_Wss SANITY
                    when 190 => NEXT_OUTS <= 562; -- vfnmsub231ps_Vps_Hps_Wps SANITY
                    when 191 => NEXT_OUTS <= 720; -- vfnmsub231ss_Vps_Hss_Wss SANITY
                    when 219 => NEXT_OUTS <= 302; -- vaesimc_Vdq_Wdq SANITY
                    when 220 => NEXT_OUTS <= 477; -- vaesenc_Vdq_Hdq_Wdq SANITY
                    when 221 => NEXT_OUTS <= 1167; -- vaesenclast_Vdq_Hdq_Wdq SANITY
                    when 222 => NEXT_OUTS <= 1575; -- vaesdec_Vdq_Hdq_Wdq SANITY
                    when 223 => NEXT_OUTS <= 170; -- vaesdeclast_Vdq_Hdq_Wdq SANITY
                    when 247 => NEXT_OUTS <= 1327; -- shlx_Gy_Ey_By SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 82 => 
                case OP4 is
                    when 245 => NEXT_OUTS <= 1622; -- pext_Gy_By_Ey SANITY
                    when 247 => NEXT_OUTS <= 1217; -- sarx_Gy_Ey_By SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 83 => 
                case OP4 is
                    when 245 => NEXT_OUTS <= 1372; -- pdep_Gy_By_Ey SANITY
                    when 247 => NEXT_OUTS <= 1368; -- shrx_Gy_Ey_By SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 121 => 
                case OP4 is
                    when 14 => NEXT_OUTS <= 802; -- vtestps_Vps_Wps SANITY
                    when 15 => NEXT_OUTS <= 744; -- vtestpd_Vpd_Wpd SANITY
                    when 19 => NEXT_OUTS <= 1481; -- vcvtph2ps_Vps_Wq SANITY
                    when 23 => NEXT_OUTS <= 1201; -- vptest_Vdq_Wdq SANITY
                    when 24 => NEXT_OUTS <= 1565; -- vbroadcastss_Vps_Wss SANITY
                    when 25 => NEXT_OUTS <= 1637; -- vbroadcastsd_Vpd_Wsd SANITY
                    when 26 => NEXT_OUTS <= 44; -- vbroadcastf128_Vdq_Mdq SANITY
                    when 28 => NEXT_OUTS <= 656; -- vpabsb_Vdq_Hdq_Wdq SANITY
                    when 29 => NEXT_OUTS <= 1191; -- vpabsw_Vdq_Hdq_Wdq SANITY
                    when 30 => NEXT_OUTS <= 1350; -- vpabsd_Vdq_Hdq_Wdq SANITY
                    when 32 => 
                    case OP5 is
                        when 1 => NEXT_OUTS <= 387; -- vpmovsxbw_Vdq_Wq SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 33 => NEXT_OUTS <= 1091; -- vpmovsxbd_Vdq_Wd SANITY
                    when 34 => NEXT_OUTS <= 586; -- vpmovsxbq_Vdq_Ww SANITY
                    when 35 => NEXT_OUTS <= 238; -- vpmovsxwd_Vdq_Wq SANITY
                    when 36 => NEXT_OUTS <= 600; -- vpmovsxwq_Vdq_Wd SANITY
                    when 37 => NEXT_OUTS <= 119; -- vpmovsxdq_Vdq_Wq SANITY
                    when 42 => NEXT_OUTS <= 898; -- vmovntdqa_Vdq_Mdq SANITY
                    when 48 => NEXT_OUTS <= 749; -- vpmovzxbw_Vdq_Wq SANITY
                    when 49 => NEXT_OUTS <= 593; -- vpmovzxbd_Vdq_Wd SANITY
                    when 50 => NEXT_OUTS <= 716; -- vpmovzxbq_Vdq_Ww SANITY
                    when 51 => NEXT_OUTS <= 1322; -- vpmovzxwd_Vdq_Wq SANITY
                    when 52 => NEXT_OUTS <= 882; -- vpmovzxwq_Vdq_Wd SANITY
                    when 53 => NEXT_OUTS <= 247; -- vpmovzxdq_Vdq_Wq SANITY
                    when 65 => NEXT_OUTS <= 34; -- vphminposuw_Vdq_Wdq SANITY
                    when 88 => NEXT_OUTS <= 1318; -- vpbroadcastd_Vdq_Wd SANITY
                    when 89 => NEXT_OUTS <= 723; -- vpbroadcastq_Vdq_Wq SANITY
                    when 90 => NEXT_OUTS <= 1377; -- vbroadcasti128_Vdq_Mdq SANITY
                    when 120 => NEXT_OUTS <= 670; -- vpbroadcastb_Vdq_Wb SANITY
                    when 121 => NEXT_OUTS <= 1420; -- vpbroadcastw_Vdq_Ww SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 209 => 
                case OP4 is
                    when 69 => NEXT_OUTS <= 454; -- vpsrlvq_Vdq_Hdq_Wdq SANITY
                    when 71 => NEXT_OUTS <= 1155; -- vpsllvq_Vdq_Hdq_Wdq SANITY
                    when 140 => NEXT_OUTS <= 173; -- vmaskmovq_Vdq_Hdq_Mdq SANITY
                    when 144 => NEXT_OUTS <= 577; -- vgatherdq_Vdq_VSib_Hdq SANITY
                    when 145 => NEXT_OUTS <= 1158; -- vgatherqq_Vdq_VSib_Hdq SANITY
                    when 146 => NEXT_OUTS <= 411; -- vgatherdpd_Vpd_VSib_Hpd SANITY
                    when 147 => NEXT_OUTS <= 1570; -- vgatherqpd_Vpd_VSib_Hpd SANITY
                    when 150 => NEXT_OUTS <= 343; -- vfmaddsub132pd_Vpd_Hpd_Wpd SANITY
                    when 151 => NEXT_OUTS <= 1198; -- vfmsubadd132pd_Vpd_Hpd_Wpd SANITY
                    when 152 => NEXT_OUTS <= 885; -- vfmadd132pd_Vpd_Hpd_Wpd SANITY
                    when 153 => NEXT_OUTS <= 671; -- vfmadd132sd_Vpd_Hsd_Wsd SANITY
                    when 154 => NEXT_OUTS <= 476; -- vfmsub132pd_Vpd_Hpd_Wpd SANITY
                    when 155 => NEXT_OUTS <= 88; -- vfmsub132sd_Vpd_Hsd_Wsd SANITY
                    when 156 => NEXT_OUTS <= 62; -- vfnmadd132pd_Vpd_Hpd_Wpd SANITY
                    when 157 => NEXT_OUTS <= 324; -- vfnmadd132sd_Vpd_Hsd_Wsd SANITY
                    when 158 => NEXT_OUTS <= 244; -- vfnmsub132pd_Vpd_Hpd_Wpd SANITY
                    when 159 => NEXT_OUTS <= 405; -- vfnmsub132sd_Vpd_Hsd_Wsd SANITY
                    when 166 => NEXT_OUTS <= 1429; -- vfmaddsub213pd_Vpd_Hpd_Wpd SANITY
                    when 167 => NEXT_OUTS <= 1154; -- vfmsubadd213pd_Vpd_Hpd_Wpd SANITY
                    when 168 => NEXT_OUTS <= 1591; -- vfmadd213pd_Vpd_Hpd_Wpd SANITY
                    when 169 => NEXT_OUTS <= 425; -- vfmadd213sd_Vpd_Hsd_Wsd SANITY
                    when 170 => NEXT_OUTS <= 1458; -- vfmsub213pd_Vpd_Hpd_Wpd SANITY
                    when 171 => NEXT_OUTS <= 972; -- vfmsub213sd_Vpd_Hsd_Wsd SANITY
                    when 172 => NEXT_OUTS <= 1369; -- vfnmadd213pd_Vpd_Hpd_Wpd SANITY
                    when 173 => NEXT_OUTS <= 601; -- vfnmadd213sd_Vpd_Hsd_Wsd SANITY
                    when 174 => NEXT_OUTS <= 1596; -- vfnmsub213pd_Vpd_Hpd_Wpd SANITY
                    when 175 => NEXT_OUTS <= 1197; -- vfnmsub213sd_Vpd_Hsd_Wsd SANITY
                    when 182 => NEXT_OUTS <= 1041; -- vfmaddsub231pd_Vpd_Hpd_Wpd SANITY
                    when 183 => NEXT_OUTS <= 660; -- vfmsubadd231pd_Vpd_Hpd_Wpd SANITY
                    when 184 => NEXT_OUTS <= 495; -- vfmadd231pd_Vpd_Hpd_Wpd SANITY
                    when 185 => NEXT_OUTS <= 1607; -- vfmadd231sd_Vpd_Hsd_Wsd SANITY
                    when 186 => NEXT_OUTS <= 111; -- vfmsub231pd_Vpd_Hpd_Wpd SANITY
                    when 187 => NEXT_OUTS <= 1261; -- vfmsub231sd_Vpd_Hsd_Wsd SANITY
                    when 188 => NEXT_OUTS <= 1120; -- vfnmadd231pd_Vpd_Hpd_Wpd SANITY
                    when 189 => NEXT_OUTS <= 1157; -- vfnmadd231sd_Vpd_Hsd_Wsd SANITY
                    when 190 => NEXT_OUTS <= 1646; -- vfnmsub231pd_Vpd_Hpd_Wpd SANITY
                    when 191 => NEXT_OUTS <= 1171; -- vfnmsub231sd_Vpd_Hsd_Wsd SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 227 => 
            case OP3 is
                when 81 => 
                case OP4 is
                    when 2 => NEXT_OUTS <= 1269; -- vpblendd_Vdq_Hdq_Wdq_Ib SANITY
                    when 6 => NEXT_OUTS <= 158; -- vperm2f128_Vdq_Hdq_Wdq_Ib SANITY
                    when 10 => NEXT_OUTS <= 773; -- vroundss_Vss_Hps_Wss_Ib SANITY
                    when 11 => NEXT_OUTS <= 932; -- vroundsd_Vsd_Hpd_Wsd_Ib SANITY
                    when 12 => NEXT_OUTS <= 953; -- vblendps_Vps_Hps_Wps_Ib SANITY
                    when 13 => NEXT_OUTS <= 1152; -- vblendpd_Vpd_Hpd_Wpd_Ib SANITY
                    when 14 => NEXT_OUTS <= 54; -- vpblendw_Vdq_Hdq_Wdq_Ib SANITY
                    when 15 => NEXT_OUTS <= 33; -- vpalignr_Vdq_Hdq_Wdq_Ib SANITY
                    when 24 => NEXT_OUTS <= 426; -- vinsertf128_Vdq_Hdq_Wdq_Ib SANITY
                    when 32 => NEXT_OUTS <= 1419; -- vpinsrb_Vdq_Hdq_Ed_Ib SANITY
                    when 33 => NEXT_OUTS <= 1332; -- vinsertps_Vps_Hps_Wss_Ib SANITY
                    when 34 => NEXT_OUTS <= 640; -- vpinsrd_Vdq_Hdq_Ed_Ib SANITY
                    when 56 => NEXT_OUTS <= 1401; -- vinserti128_Vdq_Hdq_Wdq_Ib SANITY
                    when 64 => NEXT_OUTS <= 436; -- vdpps_Vps_Hps_Wps_Ib SANITY
                    when 65 => NEXT_OUTS <= 940; -- vdppd_Vpd_Hpd_Wpd_Ib SANITY
                    when 66 => NEXT_OUTS <= 1093; -- vmpsadbw_Vdq_Hdq_Wdq_Ib SANITY
                    when 68 => NEXT_OUTS <= 965; -- vpclmulqdq_Vdq_Hdq_Wdq_Ib SANITY
                    when 70 => NEXT_OUTS <= 519; -- vperm2i128_Vdq_Hdq_Wdq_Ib SANITY
                    when 74 => NEXT_OUTS <= 1063; -- vblendvps_Vps_Hps_Wps_Ib SANITY
                    when 75 => NEXT_OUTS <= 277; -- vblendvpd_Vpd_Hpd_Wpd_Ib SANITY
                    when 76 => NEXT_OUTS <= 960; -- vpblendvb_Vdq_Hdq_Wdq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 120 => 
                case OP4 is
                    when 240 => NEXT_OUTS <= 200; -- rorx_Gy_Ey_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 121 => 
                case OP4 is
                    when 4 => NEXT_OUTS <= 676; -- vpermilps_Vps_Wps_Ib SANITY
                    when 5 => NEXT_OUTS <= 1449; -- vpermilpd_Vpd_Wpd_Ib SANITY
                    when 8 => NEXT_OUTS <= 83; -- vroundps_Vps_Wps_Ib SANITY
                    when 9 => NEXT_OUTS <= 1589; -- vroundpd_Vpd_Wpd_Ib SANITY
                    when 20 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 1193; -- vpextrb_Ebd_Vdq_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 21 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 529; -- vpextrw_Ewd_Vdq_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when 22 => NEXT_OUTS <= 603; -- vpextrd_Ed_Vdq_Ib SANITY
                    when 23 => NEXT_OUTS <= 1543; -- vextractps_Ed_Vdq_Ib SANITY
                    when 25 => NEXT_OUTS <= 887; -- vextractf128_Wdq_Vdq_Ib SANITY
                    when 29 => NEXT_OUTS <= 410; -- vcvtps2ph_Wq_Vps_Ib SANITY
                    when 57 => NEXT_OUTS <= 705; -- vextracti128_Wdq_Vdq_Ib SANITY
                    when 96 => NEXT_OUTS <= 768; -- vpcmpestrm_Vdq_Wdq_Ib SANITY
                    when 97 => NEXT_OUTS <= 856; -- vpcmpestri_Vdq_Wdq_Ib SANITY
                    when 98 => NEXT_OUTS <= 1465; -- vpcmpistrm_Vdq_Wdq_Ib SANITY
                    when 99 => NEXT_OUTS <= 1444; -- vpcmpistri_Vdq_Wdq_Ib SANITY
                    when 223 => NEXT_OUTS <= 653; -- vaeskeygenassist_Vdq_Wdq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 209 => 
                case OP4 is
                    when 34 => NEXT_OUTS <= 326; -- vpinsrq_Vdq_Hdq_Eq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 249 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 959; -- vpermq_Vdq_Wdq_Ib SANITY
                    when 1 => NEXT_OUTS <= 132; -- vpermpd_Vpd_Wpd_Ib SANITY
                    when 22 => NEXT_OUTS <= 135; -- vpextrq_Eq_Vdq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 197 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 52; -- ldsl_Gd_Mp SANITY
            when 208 => 
            case OP3 is
                when 18 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 1174; -- vmovlps_Vps_Hdq_Mq SANITY
                    when 192 => NEXT_OUTS <= 57; -- vmovhlps_Vps_Hdq_Udq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 20 => NEXT_OUTS <= 824; -- vunpcklps_Vps_Hps_Wps SANITY
                when 21 => NEXT_OUTS <= 1295; -- vunpckhps_Vps_Hps_Wps SANITY
                when 22 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 1130; -- vmovhps_Vps_Hdq_Mq SANITY
                    when 192 => NEXT_OUTS <= 1627; -- vmovlhps_Vps_Hdq_Udq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 84 => NEXT_OUTS <= 864; -- vandps_Vps_Hps_Wps SANITY
                when 85 => NEXT_OUTS <= 661; -- vandnps_Vps_Hps_Wps SANITY
                when 86 => NEXT_OUTS <= 926; -- vorps_Vps_Hps_Wps SANITY
                when 87 => NEXT_OUTS <= 515; -- vxorps_Vps_Hps_Wps SANITY
                when 88 => NEXT_OUTS <= 1064; -- vaddps_Vps_Hps_Wps SANITY
                when 89 => NEXT_OUTS <= 829; -- vmulps_Vps_Hps_Wps SANITY
                when 92 => NEXT_OUTS <= 772; -- vsubps_Vps_Hps_Wps SANITY
                when 93 => NEXT_OUTS <= 1242; -- vminps_Vps_Hps_Wps SANITY
                when 94 => NEXT_OUTS <= 618; -- vdivps_Vps_Hps_Wps SANITY
                when 95 => NEXT_OUTS <= 934; -- vmaxps_Vps_Hps_Wps SANITY
                when 194 => 
                case OP4 is
                    when 0 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 1398; -- vcmpps_Vps_Hps_Wps_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 198 => NEXT_OUTS <= 488; -- vshufps_Vps_Hps_Wps_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 209 => 
            case OP3 is
                when 18 => NEXT_OUTS <= 1129; -- vmovlpd_Vpd_Hdq_Mq SANITY
                when 20 => NEXT_OUTS <= 980; -- vunpcklpd_Vpd_Hpd_Wpd SANITY
                when 21 => NEXT_OUTS <= 70; -- vunpckhpd_Vpd_Hpd_Wpd SANITY
                when 22 => NEXT_OUTS <= 1199; -- vmovhpd_Vpd_Hdq_Mq SANITY
                when 84 => NEXT_OUTS <= 185; -- vandpd_Vpd_Hpd_Wpd SANITY
                when 85 => NEXT_OUTS <= 265; -- vandnpd_Vpd_Hpd_Wpd SANITY
                when 86 => NEXT_OUTS <= 1248; -- vorpd_Vpd_Hpd_Wpd SANITY
                when 87 => NEXT_OUTS <= 938; -- vxorpd_Vpd_Hpd_Wpd SANITY
                when 88 => NEXT_OUTS <= 37; -- vaddpd_Vpd_Hpd_Wpd SANITY
                when 89 => NEXT_OUTS <= 862; -- vmulpd_Vpd_Hpd_Wpd SANITY
                when 92 => NEXT_OUTS <= 1426; -- vsubpd_Vpd_Hpd_Wpd SANITY
                when 93 => NEXT_OUTS <= 127; -- vminpd_Vpd_Hpd_Wpd SANITY
                when 94 => NEXT_OUTS <= 707; -- vdivpd_Vpd_Hpd_Wpd SANITY
                when 95 => NEXT_OUTS <= 733; -- vmaxpd_Vpd_Hpd_Wpd SANITY
                when 96 => NEXT_OUTS <= 1302; -- vpunpcklbw_Vdq_Hdq_Wdq SANITY
                when 97 => NEXT_OUTS <= 583; -- vpunpcklwd_Vdq_Hdq_Wdq SANITY
                when 98 => NEXT_OUTS <= 282; -- vpunpckldq_Vdq_Hdq_Wdq SANITY
                when 99 => NEXT_OUTS <= 1320; -- vpacksswb_Vdq_Hdq_Wdq SANITY
                when 100 => NEXT_OUTS <= 1011; -- vpcmpgtb_Vdq_Hdq_Wdq SANITY
                when 101 => NEXT_OUTS <= 1374; -- vpcmpgtw_Vdq_Hdq_Wdq SANITY
                when 102 => NEXT_OUTS <= 1536; -- vpcmpgtd_Vdq_Hdq_Wdq SANITY
                when 103 => NEXT_OUTS <= 1450; -- vpackuswb_Vdq_Hdq_Wdq SANITY
                when 104 => NEXT_OUTS <= 606; -- vpunpckhbw_Vdq_Hdq_Wdq SANITY
                when 105 => NEXT_OUTS <= 286; -- vpunpckhwd_Vdq_Hdq_Wdq SANITY
                when 106 => NEXT_OUTS <= 137; -- vpunpckhdq_Vdq_Hdq_Wdq SANITY
                when 107 => NEXT_OUTS <= 1232; -- vpackssdw_Vdq_Hdq_Wdq SANITY
                when 108 => NEXT_OUTS <= 1112; -- vpunpcklqdq_Vdq_Hdq_Wdq SANITY
                when 109 => NEXT_OUTS <= 1333; -- vpunpckhqdq_Vdq_Hdq_Wdq SANITY
                when 113 => 
                case OP4 is
                    when 16 => NEXT_OUTS <= 1462; -- vpsrlw_Hdq_Udq_Ib SANITY
                    when 32 => NEXT_OUTS <= 970; -- vpsraw_Hdq_Udq_Ib SANITY
                    when 48 => NEXT_OUTS <= 480; -- vpsllw_Hdq_Udq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 114 => 
                case OP4 is
                    when 16 => NEXT_OUTS <= 903; -- vpsrld_Hdq_Udq_Ib SANITY
                    when 32 => NEXT_OUTS <= 1008; -- vpsrad_Hdq_Udq_Ib SANITY
                    when 48 => NEXT_OUTS <= 1183; -- vpslld_Hdq_Udq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 115 => 
                case OP4 is
                    when 16 => NEXT_OUTS <= 894; -- vpsrlq_Hdq_Udq_Ib SANITY
                    when 24 => NEXT_OUTS <= 201; -- vpsrldq_Hdq_Udq_Ib SANITY
                    when 48 => NEXT_OUTS <= 398; -- vpsllq_Hdq_Udq_Ib SANITY
                    when 56 => NEXT_OUTS <= 599; -- vpslldq_Hdq_Udq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 116 => NEXT_OUTS <= 732; -- vpcmpeqb_Vdq_Hdq_Wdq SANITY
                when 117 => NEXT_OUTS <= 1488; -- vpcmpeqw_Vdq_Hdq_Wdq SANITY
                when 118 => NEXT_OUTS <= 703; -- vpcmpeqd_Vdq_Hdq_Wdq SANITY
                when 124 => NEXT_OUTS <= 1366; -- vhaddpd_Vpd_Hpd_Wpd SANITY
                when 125 => NEXT_OUTS <= 966; -- vhsubpd_Vpd_Hpd_Wpd SANITY
                when 194 => 
                case OP4 is
                    when 0 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 996; -- vcmppd_Vpd_Hpd_Wpd_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 196 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 212; -- vpinsrw_Vdq_Hdq_Ew_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 198 => NEXT_OUTS <= 254; -- vshufpd_Vpd_Hpd_Wpd_Ib SANITY
                when 208 => NEXT_OUTS <= 1457; -- vaddsubpd_Vpd_Hpd_Wpd SANITY
                when 209 => NEXT_OUTS <= 1131; -- vpsrlw_Vdq_Hdq_Wdq SANITY
                when 210 => NEXT_OUTS <= 1287; -- vpsrld_Vdq_Hdq_Wdq SANITY
                when 211 => NEXT_OUTS <= 1353; -- vpsrlq_Vdq_Hdq_Wdq SANITY
                when 212 => NEXT_OUTS <= 1233; -- vpaddq_Vdq_Hdq_Wdq SANITY
                when 213 => NEXT_OUTS <= 1119; -- vpmullw_Vdq_Hdq_Wdq SANITY
                when 216 => NEXT_OUTS <= 669; -- vpsubusb_Vdq_Hdq_Wdq SANITY
                when 217 => NEXT_OUTS <= 94; -- vpsubusw_Vdq_Hdq_Wdq SANITY
                when 218 => NEXT_OUTS <= 64; -- vpminub_Vdq_Hdq_Wdq SANITY
                when 219 => NEXT_OUTS <= 1329; -- vpand_Vdq_Hdq_Wdq SANITY
                when 220 => NEXT_OUTS <= 1411; -- vpaddusb_Vdq_Hdq_Wdq SANITY
                when 221 => NEXT_OUTS <= 469; -- vpaddusw_Vdq_Hdq_Wdq SANITY
                when 222 => NEXT_OUTS <= 1476; -- vpmaxub_Vdq_Hdq_Wdq SANITY
                when 223 => NEXT_OUTS <= 1180; -- vpandn_Vdq_Hdq_Wdq SANITY
                when 224 => NEXT_OUTS <= 1010; -- vpavgb_Vdq_Hdq_Wdq SANITY
                when 225 => NEXT_OUTS <= 743; -- vpsraw_Vdq_Hdq_Wdq SANITY
                when 226 => NEXT_OUTS <= 210; -- vpsrad_Vdq_Hdq_Wdq SANITY
                when 227 => NEXT_OUTS <= 427; -- vpavgw_Vdq_Hdq_Wdq SANITY
                when 228 => NEXT_OUTS <= 1134; -- vpmulhuw_Vdq_Hdq_Wdq SANITY
                when 229 => NEXT_OUTS <= 1587; -- vpmulhw_Vdq_Hdq_Wdq SANITY
                when 232 => NEXT_OUTS <= 194; -- vpsubsb_Vdq_Hdq_Wdq SANITY
                when 233 => NEXT_OUTS <= 1410; -- vpsubsw_Vdq_Hdq_Wdq SANITY
                when 234 => NEXT_OUTS <= 1339; -- vpminsw_Vdq_Hdq_Wdq SANITY
                when 235 => NEXT_OUTS <= 1623; -- vpor_Vdq_Hdq_Wdq SANITY
                when 236 => NEXT_OUTS <= 762; -- vpaddsb_Vdq_Hdq_Wdq SANITY
                when 237 => NEXT_OUTS <= 417; -- vpaddsw_Vdq_Hdq_Wdq SANITY
                when 238 => NEXT_OUTS <= 1003; -- vpmaxsw_Vdq_Hdq_Wdq SANITY
                when 239 => NEXT_OUTS <= 1361; -- vpxor_Vdq_Hdq_Wdq SANITY
                when 241 => NEXT_OUTS <= 1022; -- vpsllw_Vdq_Hdq_Wdq SANITY
                when 242 => NEXT_OUTS <= 163; -- vpslld_Vdq_Hdq_Wdq SANITY
                when 243 => NEXT_OUTS <= 916; -- vpsllq_Vdq_Hdq_Wdq SANITY
                when 244 => NEXT_OUTS <= 468; -- vpmuludq_Vdq_Hdq_Wdq SANITY
                when 245 => NEXT_OUTS <= 866; -- vpmaddwd_Vdq_Hdq_Wdq SANITY
                when 246 => NEXT_OUTS <= 1528; -- vpsadbw_Vdq_Hdq_Wdq SANITY
                when 248 => NEXT_OUTS <= 891; -- vpsubb_Vdq_Hdq_Wdq SANITY
                when 249 => NEXT_OUTS <= 275; -- vpsubw_Vdq_Hdq_Wdq SANITY
                when 250 => NEXT_OUTS <= 631; -- vpsubd_Vdq_Hdq_Wdq SANITY
                when 251 => NEXT_OUTS <= 152; -- vpsubq_Vdq_Hdq_Wdq SANITY
                when 252 => NEXT_OUTS <= 5; -- vpaddb_Vdq_Hdq_Wdq SANITY
                when 253 => NEXT_OUTS <= 1109; -- vpaddw_Vdq_Hdq_Wdq SANITY
                when 254 => NEXT_OUTS <= 66; -- vpaddd_Vdq_Hdq_Wdq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 210 => 
            case OP3 is
                when 18 => NEXT_OUTS <= 602; -- vmovsldup_Vdq_Wdq SANITY
                when 22 => NEXT_OUTS <= 928; -- vmovshdup_Vdq_Wdq SANITY
                when 42 => NEXT_OUTS <= 1360; -- vcvtsi2ss_Vss_Hps_Ey SANITY
                when 88 => NEXT_OUTS <= 1258; -- vaddss_Vss_Hps_Wss SANITY
                when 89 => NEXT_OUTS <= 1072; -- vmulss_Vss_Hps_Wss SANITY
                when 92 => NEXT_OUTS <= 1657; -- vsubss_Vss_Hps_Wss SANITY
                when 93 => NEXT_OUTS <= 870; -- vminss_Vss_Hps_Wss SANITY
                when 94 => NEXT_OUTS <= 1550; -- vdivss_Vss_Hps_Wss SANITY
                when 95 => NEXT_OUTS <= 1402; -- vmaxss_Vss_Hps_Wss SANITY
                when 194 => 
                case OP4 is
                    when 0 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 1412; -- vcmpss_Vss_Hps_Wss_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 211 => 
            case OP3 is
                when 18 => NEXT_OUTS <= 908; -- vmovddup_Vdq_Wq SANITY
                when 42 => NEXT_OUTS <= 1257; -- vcvtsi2sd_Vsd_Hpd_Ey SANITY
                when 88 => NEXT_OUTS <= 1210; -- vaddsd_Vsd_Hpd_Wsd SANITY
                when 89 => NEXT_OUTS <= 1355; -- vmulsd_Vsd_Hpd_Wsd SANITY
                when 92 => NEXT_OUTS <= 317; -- vsubsd_Vsd_Hpd_Wsd SANITY
                when 93 => NEXT_OUTS <= 901; -- vminsd_Vsd_Hpd_Wsd SANITY
                when 94 => NEXT_OUTS <= 1597; -- vdivsd_Vsd_Hpd_Wsd SANITY
                when 95 => NEXT_OUTS <= 131; -- vmaxsd_Vsd_Hpd_Wsd SANITY
                when 124 => NEXT_OUTS <= 442; -- vhaddps_Vps_Hps_Wps SANITY
                when 125 => NEXT_OUTS <= 240; -- vhsubps_Vps_Hps_Wps SANITY
                when 194 => 
                case OP4 is
                    when 0 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 1473; -- vcmpsd_Vsd_Hpd_Wsd_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 208 => NEXT_OUTS <= 1263; -- vaddsubps_Vps_Hps_Wps SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 248 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 1219; -- vmovups_Vps_Wps SANITY
                when 17 => NEXT_OUTS <= 28; -- vmovups_Wps_Vps SANITY
                when 19 => NEXT_OUTS <= 757; -- vmovlps_Mq_Vps SANITY
                when 23 => NEXT_OUTS <= 1459; -- vmovhps_Mq_Vps SANITY
                when 40 => NEXT_OUTS <= 710; -- vmovaps_Vps_Wps SANITY
                when 41 => NEXT_OUTS <= 1335; -- vmovaps_Wps_Vps SANITY
                when 43 => NEXT_OUTS <= 99; -- vmovntps_Mps_Vps SANITY
                when 46 => NEXT_OUTS <= 528; -- vucomiss_Vss_Wss SANITY
                when 47 => NEXT_OUTS <= 509; -- vcomiss_Vss_Wss SANITY
                when 80 => NEXT_OUTS <= 523; -- vmovmskps_Gd_Vps SANITY
                when 81 => NEXT_OUTS <= 1185; -- vsqrtps_Vps_Wps SANITY
                when 82 => NEXT_OUTS <= 316; -- vrsqrtps_Vps_Wps SANITY
                when 83 => NEXT_OUTS <= 850; -- vrcpps_Vps_Wps SANITY
                when 90 => NEXT_OUTS <= 1443; -- vcvtps2pd_Vpd_Wps SANITY
                when 91 => NEXT_OUTS <= 1280; -- vcvtdq2ps_Vps_Wdq SANITY
                when 119 => NEXT_OUTS <= 1031; -- vzeroupper SANITY
                when 174 => 
                case OP4 is
                    when 16 => NEXT_OUTS <= 38; -- vldmxcsr SANITY
                    when 24 => NEXT_OUTS <= 818; -- vstmxcsr SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 249 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 1408; -- vmovupd_Vpd_Wpd SANITY
                when 17 => NEXT_OUTS <= 1432; -- vmovupd_Wpd_Vpd SANITY
                when 19 => NEXT_OUTS <= 217; -- vmovlpd_Mq_Vpd SANITY
                when 23 => NEXT_OUTS <= 1309; -- vmovhpd_Mq_Vpd SANITY
                when 40 => NEXT_OUTS <= 598; -- vmovapd_Vpd_Wpd SANITY
                when 41 => NEXT_OUTS <= 393; -- vmovapd_Wpd_Vpd SANITY
                when 43 => NEXT_OUTS <= 97; -- vmovntpd_Mpd_Vpd SANITY
                when 46 => NEXT_OUTS <= 1272; -- vucomisd_Vsd_Wsd SANITY
                when 47 => NEXT_OUTS <= 1290; -- vcomisd_Vsd_Wsd SANITY
                when 80 => NEXT_OUTS <= 580; -- vmovmskpd_Gd_Vpd SANITY
                when 81 => NEXT_OUTS <= 404; -- vsqrtpd_Vpd_Wpd SANITY
                when 90 => NEXT_OUTS <= 955; -- vcvtpd2ps_Vps_Wpd SANITY
                when 91 => NEXT_OUTS <= 29; -- vcvtps2dq_Vdq_Wps SANITY
                when 110 => NEXT_OUTS <= 391; -- vmovd_Vdq_Ed SANITY
                when 111 => NEXT_OUTS <= 1521; -- vmovdqa_Vdq_Wdq SANITY
                when 112 => NEXT_OUTS <= 283; -- vpshufd_Vdq_Hdq_Wdq_Ib SANITY
                when 126 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 827; -- vmovd_Ed_Vd SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 127 => NEXT_OUTS <= 478; -- vmovdqa_Wdq_Vdq SANITY
                when 197 => NEXT_OUTS <= 962; -- vpextrw_Gd_Udq_Ib SANITY
                when 214 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 1549; -- vmovq_Wq_Vq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 215 => NEXT_OUTS <= 30; -- vpmovmskb_Gd_Udq SANITY
                when 230 => NEXT_OUTS <= 754; -- vcvttpd2dq_Vq_Wpd SANITY
                when 231 => NEXT_OUTS <= 1592; -- vmovntdq_Mdq_Vdq SANITY
                when 247 => NEXT_OUTS <= 180; -- vmaskmovdqu_Vdq_Udq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 250 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 594; -- vmovss_Vss_Wss SANITY
                when 17 => NEXT_OUTS <= 331; -- vmovss_Wss_Vss SANITY
                when 44 => NEXT_OUTS <= 1382; -- vcvttss2si_Gy_Wss SANITY
                when 45 => NEXT_OUTS <= 612; -- vcvtss2si_Gy_Wss SANITY
                when 81 => NEXT_OUTS <= 683; -- vsqrtss_Vss_Hps_Wss SANITY
                when 82 => NEXT_OUTS <= 641; -- vrsqrtss_Vss_Hps_Wss SANITY
                when 83 => NEXT_OUTS <= 681; -- vrcpss_Vss_Hps_Wss SANITY
                when 90 => NEXT_OUTS <= 162; -- vcvtss2sd_Vsd_Hpd_Wss SANITY
                when 91 => NEXT_OUTS <= 1541; -- vcvttps2dq_Vdq_Wps SANITY
                when 111 => NEXT_OUTS <= 1108; -- vmovdqu_Vdq_Wdq SANITY
                when 112 => NEXT_OUTS <= 251; -- vpshufhw_Vdq_Hdq_Wdq_Ib SANITY
                when 126 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 572; -- vmovq_Vq_Wq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 127 => NEXT_OUTS <= 202; -- vmovdqu_Wdq_Vdq SANITY
                when 230 => NEXT_OUTS <= 1162; -- vcvtdq2pd_Vpd_Wq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 251 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 1567; -- vmovsd_Vsd_Wsd SANITY
                when 17 => NEXT_OUTS <= 390; -- vmovsd_Wsd_Vsd SANITY
                when 44 => NEXT_OUTS <= 1275; -- vcvttsd2si_Gy_Wsd SANITY
                when 45 => NEXT_OUTS <= 570; -- vcvtsd2si_Gy_Wsd SANITY
                when 81 => NEXT_OUTS <= 1337; -- vsqrtsd_Vsd_Hpd_Wsd SANITY
                when 90 => NEXT_OUTS <= 863; -- vcvtsd2ss_Vss_Hps_Wsd SANITY
                when 112 => NEXT_OUTS <= 207; -- vpshuflw_Vdq_Hdq_Wdq_Ib SANITY
                when 230 => NEXT_OUTS <= 1127; -- vcvtpd2dq_Vq_Wpd SANITY
                when 240 => NEXT_OUTS <= 1262; -- vlddqu_Vdq_Mdq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 198 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1392; -- movb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 199 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1599; -- movl_Ed_Id SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 200 => NEXT_OUTS <= 555; -- enter SANITY
        when 201 => NEXT_OUTS <= 517; -- leave SANITY
        when 202 => NEXT_OUTS <= 35; -- lret_Iw SANITY
        when 203 => NEXT_OUTS <= 1460; -- lret SANITY
        when 204 => NEXT_OUTS <= 1086; -- int3 SANITY
        when 205 => NEXT_OUTS <= 72; -- int_Ib SANITY
        when 206 => NEXT_OUTS <= 287; -- into SANITY
        when 207 => NEXT_OUTS <= 498; -- iretl SANITY
        when 208 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1452; -- rolb_Eb_I1 SANITY
            when 8 => NEXT_OUTS <= 106; -- rorb_Eb_I1 SANITY
            when 16 => NEXT_OUTS <= 1520; -- rclb_Eb_I1 SANITY
            when 24 => NEXT_OUTS <= 626; -- rcrb_Eb_I1 SANITY
            when 32 => NEXT_OUTS <= 1362; -- shlb_Eb_I1 SANITY
            when 40 => NEXT_OUTS <= 1523; -- shrb_Eb_I1 SANITY
            when 56 => NEXT_OUTS <= 873; -- sarb_Eb_I1 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 209 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1213; -- roll_Ed_I1 SANITY
            when 8 => NEXT_OUTS <= 1251; -- rorl_Ed_I1 SANITY
            when 16 => NEXT_OUTS <= 1648; -- rcll_Ed_I1 SANITY
            when 24 => NEXT_OUTS <= 1387; -- rcrl_Ed_I1 SANITY
            when 32 => NEXT_OUTS <= 1089; -- shll_Ed_I1 SANITY
            when 40 => NEXT_OUTS <= 685; -- shrl_Ed_I1 SANITY
            when 56 => NEXT_OUTS <= 1165; -- sarl_Ed_I1 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 210 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1298; -- rolb_Eb_CL SANITY
            when 8 => NEXT_OUTS <= 206; -- rorb_Eb_CL SANITY
            when 16 => NEXT_OUTS <= 1088; -- rclb_Eb_CL SANITY
            when 24 => NEXT_OUTS <= 750; -- rcrb_Eb_CL SANITY
            when 32 => NEXT_OUTS <= 820; -- shlb_Eb_CL SANITY
            when 40 => NEXT_OUTS <= 675; -- shrb_Eb_CL SANITY
            when 56 => NEXT_OUTS <= 800; -- sarb_Eb_CL SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 211 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 859; -- roll_Ed_CL SANITY
            when 8 => NEXT_OUTS <= 734; -- rorl_Ed_CL SANITY
            when 16 => NEXT_OUTS <= 1604; -- rcll_Ed_CL SANITY
            when 24 => NEXT_OUTS <= 321; -- rcrl_Ed_CL SANITY
            when 32 => NEXT_OUTS <= 1628; -- shll_Ed_CL SANITY
            when 40 => NEXT_OUTS <= 560; -- shrl_Ed_CL SANITY
            when 56 => NEXT_OUTS <= 161; -- sarl_Ed_CL SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 212 => NEXT_OUTS <= 1603; -- aam SANITY
        when 213 => NEXT_OUTS <= 1407; -- aad SANITY
        when 214 => NEXT_OUTS <= 156; -- salc SANITY
        when 215 => NEXT_OUTS <= 719; -- xlat SANITY
        when 216 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 51; -- fadds_Md SANITY
            when 8 => NEXT_OUTS <= 785; -- fmuls_Md SANITY
            when 16 => NEXT_OUTS <= 604; -- fcoms_Md SANITY
            when 24 => NEXT_OUTS <= 690; -- fcomps_Md SANITY
            when 32 => NEXT_OUTS <= 1525; -- fsubs_Md SANITY
            when 40 => NEXT_OUTS <= 778; -- fsubrs_Md SANITY
            when 48 => NEXT_OUTS <= 843; -- fdivs_Md SANITY
            when 56 => NEXT_OUTS <= 431; -- fdivrs_Md SANITY
            when 192 => NEXT_OUTS <= 584; -- fadd_ST0_STi SANITY
            when 200 => NEXT_OUTS <= 143; -- fmul_ST0_STi SANITY
            when 208 => NEXT_OUTS <= 1338; -- fcom_STi SANITY
            when 216 => NEXT_OUTS <= 299; -- fcomp_STi SANITY
            when 224 => NEXT_OUTS <= 869; -- fsub_ST0_STi SANITY
            when 232 => NEXT_OUTS <= 840; -- fsubr_ST0_STi SANITY
            when 240 => NEXT_OUTS <= 69; -- fdiv_ST0_STi SANITY
            when 248 => NEXT_OUTS <= 78; -- fdivr_ST0_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 217 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 73; -- flds_Md SANITY
            when 16 => NEXT_OUTS <= 804; -- fsts_Md SANITY
            when 24 => NEXT_OUTS <= 1436; -- fstps_Md SANITY
            when 32 => NEXT_OUTS <= 1621; -- fldenv SANITY
            when 40 => NEXT_OUTS <= 1036; -- fldcw SANITY
            when 48 => NEXT_OUTS <= 913; -- fnstenv SANITY
            when 56 => NEXT_OUTS <= 1614; -- fnstcw SANITY
            when 192 => NEXT_OUTS <= 252; -- fld_STi SANITY
            when 200 => NEXT_OUTS <= 949; -- fxch SANITY
            when 208 => NEXT_OUTS <= 667; -- fnop SANITY
            when 224 => NEXT_OUTS <= 1259; -- fchs SANITY
            when 225 => NEXT_OUTS <= 233; -- fabs SANITY
            when 228 => NEXT_OUTS <= 1616; -- ftst SANITY
            when 229 => NEXT_OUTS <= 182; -- fxam SANITY
            when 232 => NEXT_OUTS <= 1502; -- fld1 SANITY
            when 233 => NEXT_OUTS <= 289; -- fldl2t SANITY
            when 234 => NEXT_OUTS <= 39; -- fldl2e SANITY
            when 235 => NEXT_OUTS <= 1400; -- fldpi SANITY
            when 236 => NEXT_OUTS <= 979; -- fldlg2 SANITY
            when 237 => NEXT_OUTS <= 218; -- fldln2 SANITY
            when 238 => NEXT_OUTS <= 839; -- fldz SANITY
            when 240 => NEXT_OUTS <= 1602; -- f2xm1 SANITY
            when 241 => NEXT_OUTS <= 1161; -- fyl2x SANITY
            when 242 => NEXT_OUTS <= 415; -- fptan SANITY
            when 243 => NEXT_OUTS <= 520; -- fpatan SANITY
            when 244 => NEXT_OUTS <= 925; -- fxtract SANITY
            when 245 => NEXT_OUTS <= 75; -- fprem1 SANITY
            when 246 => NEXT_OUTS <= 1128; -- fdecstp SANITY
            when 247 => NEXT_OUTS <= 279; -- fincstp SANITY
            when 248 => NEXT_OUTS <= 1245; -- fprem SANITY
            when 249 => NEXT_OUTS <= 178; -- fyl2xp1 SANITY
            when 250 => NEXT_OUTS <= 815; -- fsqrt SANITY
            when 251 => NEXT_OUTS <= 234; -- fsincos SANITY
            when 252 => NEXT_OUTS <= 253; -- frndint SANITY
            when 253 => NEXT_OUTS <= 1026; -- fscale SANITY
            when 254 => NEXT_OUTS <= 255; -- fsin SANITY
            when 255 => NEXT_OUTS <= 775; -- fcos SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 218 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 84; -- fiaddl_Md SANITY
            when 8 => NEXT_OUTS <= 188; -- fimull_Md SANITY
            when 16 => NEXT_OUTS <= 756; -- ficoml_Md SANITY
            when 24 => NEXT_OUTS <= 464; -- ficompl_Md SANITY
            when 32 => NEXT_OUTS <= 290; -- fisubl_Md SANITY
            when 40 => NEXT_OUTS <= 1079; -- fisubrl_Md SANITY
            when 48 => NEXT_OUTS <= 423; -- fidivl_Md SANITY
            when 56 => NEXT_OUTS <= 357; -- fidivrl_Md SANITY
            when 192 => NEXT_OUTS <= 318; -- fcmovb_ST0_STi SANITY
            when 200 => NEXT_OUTS <= 1170; -- fcmove_ST0_STi SANITY
            when 208 => NEXT_OUTS <= 297; -- fcmovbe_ST0_STi SANITY
            when 216 => NEXT_OUTS <= 1576; -- fcmovu_ST0_STi SANITY
            when 233 => NEXT_OUTS <= 24; -- fucompp SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 219 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 968; -- fildl_Md SANITY
            when 8 => NEXT_OUTS <= 372; -- fisttpl_Md SANITY
            when 16 => NEXT_OUTS <= 1425; -- fistl_Md SANITY
            when 24 => NEXT_OUTS <= 1509; -- fistpl_Md SANITY
            when 40 => NEXT_OUTS <= 592; -- fldt_Mt SANITY
            when 56 => NEXT_OUTS <= 219; -- fstpt_Mt SANITY
            when 192 => NEXT_OUTS <= 1448; -- fcmovnb_ST0_STi SANITY
            when 200 => NEXT_OUTS <= 543; -- fcmovne_ST0_STi SANITY
            when 208 => NEXT_OUTS <= 1122; -- fcmovnbe_ST0_STi SANITY
            when 216 => NEXT_OUTS <= 89; -- fcmovnu_ST0_STi SANITY
            when 226 => NEXT_OUTS <= 1334; -- fnclex SANITY
            when 227 => NEXT_OUTS <= 304; -- fninit SANITY
            when 232 => NEXT_OUTS <= 998; -- fucomi_ST0_STi SANITY
            when 240 => NEXT_OUTS <= 793; -- fcomi_ST0_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 220 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 701; -- faddl_Mq SANITY
            when 8 => NEXT_OUTS <= 1253; -- fmull_Mq SANITY
            when 16 => NEXT_OUTS <= 1610; -- fcoml_Mq SANITY
            when 24 => NEXT_OUTS <= 871; -- fcompl_Mq SANITY
            when 32 => NEXT_OUTS <= 1492; -- fsubl_Mq SANITY
            when 40 => NEXT_OUTS <= 812; -- fsubrl_Mq SANITY
            when 48 => NEXT_OUTS <= 1220; -- fdivl_Mq SANITY
            when 56 => NEXT_OUTS <= 1052; -- fdivrl_Mq SANITY
            when 192 => NEXT_OUTS <= 852; -- fadd_STi_ST0 SANITY
            when 200 => NEXT_OUTS <= 320; -- fmul_STi_ST0 SANITY
            when 224 => NEXT_OUTS <= 1037; -- fsubr_STi_ST0 SANITY
            when 232 => NEXT_OUTS <= 227; -- fsub_STi_ST0 SANITY
            when 240 => NEXT_OUTS <= 368; -- fdivr_STi_ST0 SANITY
            when 248 => NEXT_OUTS <= 328; -- fdiv_STi_ST0 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 221 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 651; -- fldl_Mq SANITY
            when 8 => NEXT_OUTS <= 296; -- fisttpq_Mq SANITY
            when 16 => NEXT_OUTS <= 230; -- fstl_Mq SANITY
            when 24 => NEXT_OUTS <= 1583; -- fstpl_Mq SANITY
            when 32 => NEXT_OUTS <= 272; -- frstor SANITY
            when 48 => NEXT_OUTS <= 1636; -- fnsave SANITY
            when 56 => NEXT_OUTS <= 858; -- fnstsw SANITY
            when 192 => NEXT_OUTS <= 912; -- ffree_STi SANITY
            when 208 => NEXT_OUTS <= 1405; -- fst_STi SANITY
            when 216 => NEXT_OUTS <= 860; -- fstp_STi SANITY
            when 224 => NEXT_OUTS <= 833; -- fucom_STi SANITY
            when 232 => NEXT_OUTS <= 566; -- fucomp_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 222 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1288; -- fiadds_Mw SANITY
            when 8 => NEXT_OUTS <= 1662; -- fimuls_Mw SANITY
            when 16 => NEXT_OUTS <= 310; -- ficoms_Mw SANITY
            when 24 => NEXT_OUTS <= 363; -- ficomps_Mw SANITY
            when 32 => NEXT_OUTS <= 1229; -- fisubs_Mw SANITY
            when 40 => NEXT_OUTS <= 1645; -- fisubrs_Mw SANITY
            when 48 => NEXT_OUTS <= 487; -- fidivs_Mw SANITY
            when 56 => NEXT_OUTS <= 1357; -- fidivrs_Mw SANITY
            when 192 => NEXT_OUTS <= 569; -- faddp_STi_ST0 SANITY
            when 200 => NEXT_OUTS <= 725; -- fmulp_STi_ST0 SANITY
            when 217 => NEXT_OUTS <= 441; -- fcompp SANITY
            when 224 => NEXT_OUTS <= 14; -- fsubrp_STi_ST0 SANITY
            when 232 => NEXT_OUTS <= 549; -- fsubp_STi_ST0 SANITY
            when 240 => NEXT_OUTS <= 905; -- fdivrp_STi_ST0 SANITY
            when 248 => NEXT_OUTS <= 563; -- fdivp_STi_ST0 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 223 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 506; -- filds_Mw SANITY
            when 8 => NEXT_OUTS <= 259; -- fisttps_Mw SANITY
            when 16 => NEXT_OUTS <= 893; -- fists_Mw SANITY
            when 24 => NEXT_OUTS <= 936; -- fistps_Mw SANITY
            when 32 => NEXT_OUTS <= 1527; -- fbldt_Mt SANITY
            when 40 => NEXT_OUTS <= 293; -- fildq_Mq SANITY
            when 48 => NEXT_OUTS <= 986; -- fbstpt_Mt SANITY
            when 56 => NEXT_OUTS <= 1558; -- fistpq_Mq SANITY
            when 224 => NEXT_OUTS <= 1553; -- fnstsw_AX SANITY
            when 232 => NEXT_OUTS <= 1456; -- fucomip_ST0_STi SANITY
            when 240 => NEXT_OUTS <= 325; -- fcomip_ST0_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 224 => NEXT_OUTS <= 177; -- loopne_Jb SANITY
        when 225 => NEXT_OUTS <= 209; -- loope_Jb SANITY
        when 226 => NEXT_OUTS <= 616; -- loop_Jb SANITY
        when 227 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1077; -- jecxz_Jb SANITY
            when 1 => NEXT_OUTS <= 803; -- jrcxz_Jb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 228 => NEXT_OUTS <= 347; -- inb_AL_Ib SANITY
        when 229 => NEXT_OUTS <= 1510; -- inl_EAX_Ib SANITY
        when 230 => NEXT_OUTS <= 571; -- outb_Ib_AL SANITY
        when 231 => NEXT_OUTS <= 1611; -- outl_Ib_EAX SANITY
        when 232 => NEXT_OUTS <= 1542; -- call_Jd SANITY
        when 233 => NEXT_OUTS <= 1424; -- jmp_Jd SANITY
        when 234 => NEXT_OUTS <= 1631; -- ljmp_Apd SANITY
        when 235 => NEXT_OUTS <= 605; -- jmp_Jb SANITY
        when 236 => NEXT_OUTS <= 365; -- inb_AL_DX SANITY
        when 237 => NEXT_OUTS <= 184; -- inl_EAX_DX SANITY
        when 238 => NEXT_OUTS <= 718; -- outb_DX_AL SANITY
        when 239 => NEXT_OUTS <= 1547; -- outl_DX_EAX SANITY
        when 241 => NEXT_OUTS <= 1595; -- int1 SANITY
        when 242 => 
        case OP2 is
            when 15 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 18; -- movsd_Vsd_Wsd SANITY
                when 17 => NEXT_OUTS <= 437; -- movsd_Wsd_Vsd SANITY
                when 18 => NEXT_OUTS <= 1034; -- movddup_Vdq_Wq SANITY
                when 42 => NEXT_OUTS <= 1325; -- cvtsi2sd_Vsd_Ey SANITY
                when 44 => NEXT_OUTS <= 892; -- cvttsd2si_Gy_Wsd SANITY
                when 45 => NEXT_OUTS <= 590; -- cvtsd2si_Gy_Wsd SANITY
                when 56 => 
                case OP4 is
                    when 240 => NEXT_OUTS <= 1006; -- crc32_Gd_Eb SANITY
                    when 241 => 
                    case OP5 is
                        when 195 => NEXT_OUTS <= 1653; -- crc32_Gd_Ed SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 81 => NEXT_OUTS <= 1058; -- sqrtsd_Vsd_Wsd SANITY
                when 88 => NEXT_OUTS <= 1087; -- addsd_Vsd_Wsd SANITY
                when 89 => NEXT_OUTS <= 792; -- mulsd_Vsd_Wsd SANITY
                when 90 => NEXT_OUTS <= 1303; -- cvtsd2ss_Vss_Wsd SANITY
                when 92 => NEXT_OUTS <= 329; -- subsd_Vsd_Wsd SANITY
                when 93 => NEXT_OUTS <= 533; -- minsd_Vsd_Wsd SANITY
                when 94 => NEXT_OUTS <= 1054; -- divsd_Vsd_Wsd SANITY
                when 95 => NEXT_OUTS <= 214; -- maxsd_Vsd_Wsd SANITY
                when 112 => NEXT_OUTS <= 396; -- pshuflw_Vdq_Wdq_Ib SANITY
                when 124 => NEXT_OUTS <= 271; -- haddps_Vps_Wps SANITY
                when 125 => NEXT_OUTS <= 969; -- hsubps_Vps_Wps SANITY
                when 194 => 
                case OP4 is
                    when 0 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 165; -- cmpsd_Vsd_Wsd_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 208 => NEXT_OUTS <= 1319; -- addsubps_Vps_Wps SANITY
                when 214 => NEXT_OUTS <= 501; -- movdq2q_Pq_Udq SANITY
                when 230 => NEXT_OUTS <= 1145; -- cvtpd2dq_Vq_Wpd SANITY
                when 240 => NEXT_OUTS <= 46; -- lddqu_Vdq_Mdq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 72 => 
            case OP3 is
                when 15 => 
                case OP4 is
                    when 56 => 
                    case OP5 is
                        when 241 => 
                        case OP6 is
                            when 195 => NEXT_OUTS <= 904; -- crc32_Gd_Eq SANITY
                            when others => NEXT_OUTS <= 0; -- invalid
                        end case;
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 243 => 
        case OP2 is
            when 15 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 837; -- movss_Vss_Wss SANITY
                when 17 => NEXT_OUTS <= 726; -- movss_Wss_Vss SANITY
                when 18 => NEXT_OUTS <= 999; -- movsldup_Vdq_Wdq SANITY
                when 22 => NEXT_OUTS <= 1478; -- movshdup_Vdq_Wdq SANITY
                when 42 => NEXT_OUTS <= 620; -- cvtsi2ss_Vss_Ey SANITY
                when 44 => NEXT_OUTS <= 1276; -- cvttss2si_Gy_Wss SANITY
                when 45 => NEXT_OUTS <= 614; -- cvtss2si_Gy_Wss SANITY
                when 81 => NEXT_OUTS <= 1216; -- sqrtss_Vss_Wss SANITY
                when 82 => NEXT_OUTS <= 1153; -- rsqrtss_Vss_Wss SANITY
                when 83 => NEXT_OUTS <= 1559; -- rcpss_Vss_Wss SANITY
                when 88 => NEXT_OUTS <= 1208; -- addss_Vss_Wss SANITY
                when 89 => NEXT_OUTS <= 808; -- mulss_Vss_Wss SANITY
                when 90 => NEXT_OUTS <= 1009; -- cvtss2sd_Vsd_Wss SANITY
                when 91 => NEXT_OUTS <= 1321; -- cvttps2dq_Vdq_Wps SANITY
                when 92 => NEXT_OUTS <= 466; -- subss_Vss_Wss SANITY
                when 93 => NEXT_OUTS <= 494; -- minss_Vss_Wss SANITY
                when 94 => NEXT_OUTS <= 1383; -- divss_Vss_Wss SANITY
                when 95 => NEXT_OUTS <= 736; -- maxss_Vss_Wss SANITY
                when 111 => NEXT_OUTS <= 429; -- movdqu_Vdq_Wdq SANITY
                when 112 => NEXT_OUTS <= 1373; -- pshufhw_Vdq_Wdq_Ib SANITY
                when 126 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 449; -- movq_Vq_Wq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 127 => NEXT_OUTS <= 1013; -- movdqu_Wdq_Vdq SANITY
                when 174 => 
                case OP4 is
                    when 192 => NEXT_OUTS <= 1111; -- rdfsbase_Ry SANITY
                    when 200 => NEXT_OUTS <= 1159; -- rdgsbase_Ry SANITY
                    when 208 => NEXT_OUTS <= 126; -- wrfsbase_Ry SANITY
                    when 216 => NEXT_OUTS <= 525; -- wrgsbase_Ry SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 184 => NEXT_OUTS <= 911; -- popcnt_Gd_Ed SANITY
                when 188 => NEXT_OUTS <= 747; -- tzcntl_Gd_Ed SANITY
                when 189 => NEXT_OUTS <= 1078; -- lzcntl_Gd_Ed SANITY
                when 194 => 
                case OP4 is
                    when 0 => 
                    case OP5 is
                        when 0 => NEXT_OUTS <= 1508; -- cmpss_Vss_Wss_Ib SANITY
                        when others => NEXT_OUTS <= 0; -- invalid
                    end case;
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 199 => 
                case OP4 is
                    when 48 => NEXT_OUTS <= 1101; -- vmxon_Mq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 214 => NEXT_OUTS <= 1294; -- movq2dq_Vdq_Qq SANITY
                when 230 => NEXT_OUTS <= 767; -- cvtdq2pd_Vpd_Wq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 72 => 
            case OP3 is
                when 15 => 
                case OP4 is
                    when 184 => NEXT_OUTS <= 1017; -- popcnt_Gq_Eq SANITY
                    when 188 => NEXT_OUTS <= 1192; -- tzcntq_Gq_Eq SANITY
                    when 189 => NEXT_OUTS <= 708; -- lzcntq_Gq_Eq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 144 => NEXT_OUTS <= 933; -- pause SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 244 => NEXT_OUTS <= 1286; -- hlt SANITY
        when 245 => NEXT_OUTS <= 25; -- cmc SANITY
        when 246 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 378; -- testb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 1505; -- notb_Eb SANITY
            when 24 => NEXT_OUTS <= 664; -- negb_Eb SANITY
            when 32 => NEXT_OUTS <= 993; -- mulb_AL_Eb SANITY
            when 40 => NEXT_OUTS <= 1001; -- imulb_AL_Eb SANITY
            when 48 => NEXT_OUTS <= 629; -- divb_AL_Eb SANITY
            when 56 => NEXT_OUTS <= 267; -- idivb_AL_Eb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 247 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 530; -- testl_Ed_Id SANITY
            when 16 => NEXT_OUTS <= 978; -- notl_Ed SANITY
            when 24 => NEXT_OUTS <= 1617; -- negl_Ed SANITY
            when 32 => NEXT_OUTS <= 250; -- mull_EAX_Ed SANITY
            when 40 => NEXT_OUTS <= 1381; -- imull_EAX_Ed SANITY
            when 48 => NEXT_OUTS <= 1051; -- divl_EAX_Ed SANITY
            when 56 => NEXT_OUTS <= 1056; -- idivl_EAX_Ed SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 248 => NEXT_OUTS <= 1094; -- clc SANITY
        when 249 => NEXT_OUTS <= 1203; -- stc SANITY
        when 250 => NEXT_OUTS <= 1466; -- cli SANITY
        when 251 => NEXT_OUTS <= 1057; -- sti SANITY
        when 252 => NEXT_OUTS <= 883; -- cld SANITY
        when 253 => NEXT_OUTS <= 947; -- std SANITY
        when 254 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 958; -- incb_Eb SANITY
            when 8 => NEXT_OUTS <= 930; -- decb_Eb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 255 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 1240; -- incl_Ed SANITY
            when 8 => NEXT_OUTS <= 985; -- decl_Ed SANITY
            when 16 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 1099; -- call_Ed SANITY
                when 1 => NEXT_OUTS <= 746; -- call_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 24 => NEXT_OUTS <= 1533; -- lcall_Mp SANITY
            when 32 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 748; -- jmp_Ed SANITY
                when 1 => NEXT_OUTS <= 1434; -- jmp_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 40 => NEXT_OUTS <= 362; -- ljmp_Mp SANITY
            when 48 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 922; -- pushl_Ed SANITY
                when 1 => NEXT_OUTS <= 313; -- pushq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when others => NEXT_OUTS <= 0; -- invalid
    end case;

  end process;
end behv;
