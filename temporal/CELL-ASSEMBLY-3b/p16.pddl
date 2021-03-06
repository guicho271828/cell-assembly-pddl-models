(DEFINE (PROBLEM CELL-ASSEMBLY-MODEL3B-16)
 (:DOMAIN CELL-ASSEMBLY)
 (:OBJECTS J8 - MACHINE-JOB
           J7 - JOB
           J6 - MACHINE-JOB
           J5 - JOB
           J4 - MACHINE-JOB
           J3 - JOB
           J2 - MACHINE-JOB
           J1 - JOB
           M4 - MACHINE
           M3 - MACHINE
           M2 - MACHINE
           M1 - MACHINE
           TB34 - TABLE
           TB23 - TABLE
           TB12 - TABLE
           T4 - TRAY
           T3 - TRAY
           T2 - TRAY
           T1 - TRAY
           P4 - COMPONENT
           P3 - COMPONENT
           P2 - COMPONENT
           P1 - COMPONENT
           A4 - ARM
           A3 - ARM
           A2 - ARM
           A1 - ARM
           BASE0-7454 - BASE
           BASE1-7453 - BASE
           BASE2-7452 - BASE
           BASE3-7451 - BASE
           BASE4-7450 - BASE
           BASE5-7449 - BASE
           BASE6-7448 - BASE
           BASE7-7447 - BASE
           BASE8-7446 - BASE
           BASE9-7445 - BASE
           BASE10-7444 - BASE
           BASE11-7443 - BASE
           BASE12-7442 - BASE
           BASE13-7441 - BASE
           BASE14-7440 - BASE
           BASE15-7439 - BASE)

 (:INIT
  (NOT-ARM-PRESENT m1)
  (NOT-ARM-PRESENT m2)
  (NOT-ARM-PRESENT m3)
  (NOT-ARM-PRESENT m4)
  ;; (NOT-ARM-PRESENT tb12)
  ;; (NOT-ARM-PRESENT tb23)
  ;; (NOT-ARM-PRESENT tb34)
  (NOT-ARM-PRESENT t1)
  (NOT-ARM-PRESENT t2)
  (NOT-ARM-PRESENT t3)
  (NOT-ARM-PRESENT t4)
  ;; (NOT-ARM-PRESENT TABLE-IN)
  (NOT-ARM-PRESENT TABLE-OUT)

  (NOT-BASE-PRESENT m1)
  (NOT-BASE-PRESENT m2)
  (NOT-BASE-PRESENT m3)
  (NOT-BASE-PRESENT m4)
  (NOT-BASE-PRESENT tb12)
  (NOT-BASE-PRESENT tb23)
  (NOT-BASE-PRESENT tb34)
  (NOT-BASE-PRESENT t1)
  (NOT-BASE-PRESENT t2)
  (NOT-BASE-PRESENT t3)
  (NOT-BASE-PRESENT t4)
  (NOT-BASE-PRESENT TABLE-IN)
  (NOT-BASE-PRESENT TABLE-OUT)
    
  ;; (ARM-PRESENT TB34)
  (AT A4 TB34)
  (FREE A4)
  ;; (ARM-PRESENT TB23)
  (AT A3 TB23)
  (FREE A3)
  ;; (ARM-PRESENT TB12)
  (AT A2 TB12)
  (FREE A2)
  ;; (ARM-PRESENT TABLE-IN)
  (AT A1 TABLE-IN)
  (FREE A1)
  (= (JOB-COST NOTHING-DONE) 0)
  (JOB-AVAILABLE-AT J1 TB12)
  (DEPENDS NOTHING-DONE J1)
  (= (JOB-COST J1) 3)
  (USES J1 P1)
  (AT P1 T1)
  (JOB-AVAILABLE-AT J2 M1)
  (DEPENDS J1 J2)
  (= (JOB-COST J2) 3)
  (JOB-AVAILABLE-AT J3 TB23)
  (DEPENDS J2 J3)
  (= (JOB-COST J3) 3)
  (USES J3 P2)
  (AT P2 T2)
  (JOB-AVAILABLE-AT J4 M2)
  (DEPENDS J3 J4)
  (= (JOB-COST J4) 2)
  (JOB-AVAILABLE-AT J5 TB34)
  (DEPENDS J4 J5)
  (= (JOB-COST J5) 3)
  (USES J5 P3)
  (AT P3 T3)
  (JOB-AVAILABLE-AT J6 M3)
  (DEPENDS J5 J6)
  (= (JOB-COST J6) 3)
  (JOB-AVAILABLE-AT J7 TB34)
  (DEPENDS J6 J7)
  (= (JOB-COST J7) 2)
  (USES J7 P4)
  (AT P4 T4)
  (JOB-AVAILABLE-AT J8 M4)
  (DEPENDS J7 J8)
  (= (JOB-COST J8) 3)
  (CONNECTED TABLE-OUT CARRY-OUT)
  (CONNECTED CARRY-IN TABLE-IN)
  (= (MOVE-COST TABLE-IN TABLE-IN) 1000)
  (= (MOVE-COST TABLE-IN TB12) 3)
  (= (MOVE-COST TABLE-IN TB23) 5)
  (= (MOVE-COST TABLE-IN TB34) 7)
  (= (MOVE-COST TABLE-IN T4) 8)
  (= (MOVE-COST TABLE-IN M4) 8)
  (= (MOVE-COST TABLE-IN TABLE-OUT) 6)
  (= (MOVE-COST TABLE-IN T3) 7)
  (= (MOVE-COST TABLE-IN M3) 6)
  (= (MOVE-COST TABLE-IN T2) 4)
  (= (MOVE-COST TABLE-IN M2) 4)
  (= (MOVE-COST TABLE-IN T1) 2)
  (= (MOVE-COST TABLE-IN M1) 2)
  (= (MOVE-COST TB12 TABLE-IN) 3)
  (= (MOVE-COST TB12 TB12) 1000)
  (= (MOVE-COST TB12 TB23) 3)
  (= (MOVE-COST TB12 TB34) 5)
  (= (MOVE-COST TB12 T4) 6)
  (= (MOVE-COST TB12 M4) 6)
  (= (MOVE-COST TB12 TABLE-OUT) 4)
  (= (MOVE-COST TB12 T3) 5)
  (= (MOVE-COST TB12 M3) 4)
  (= (MOVE-COST TB12 T2) 2)
  (= (MOVE-COST TB12 M2) 2)
  (= (MOVE-COST TB12 T1) 2)
  (= (MOVE-COST TB12 M1) 3)
  (= (MOVE-COST TB23 TABLE-IN) 5)
  (= (MOVE-COST TB23 TB12) 3)
  (= (MOVE-COST TB23 TB23) 1000)
  (= (MOVE-COST TB23 TB34) 3)
  (= (MOVE-COST TB23 T4) 4)
  (= (MOVE-COST TB23 M4) 4)
  (= (MOVE-COST TB23 TABLE-OUT) 2)
  (= (MOVE-COST TB23 T3) 3)
  (= (MOVE-COST TB23 M3) 2)
  (= (MOVE-COST TB23 T2) 2)
  (= (MOVE-COST TB23 M2) 3)
  (= (MOVE-COST TB23 T1) 4)
  (= (MOVE-COST TB23 M1) 5)
  (= (MOVE-COST TB34 TABLE-IN) 7)
  (= (MOVE-COST TB34 TB12) 5)
  (= (MOVE-COST TB34 TB23) 3)
  (= (MOVE-COST TB34 TB34) 1000)
  (= (MOVE-COST TB34 T4) 2)
  (= (MOVE-COST TB34 M4) 2)
  (= (MOVE-COST TB34 TABLE-OUT) 2)
  (= (MOVE-COST TB34 T3) 3)
  (= (MOVE-COST TB34 M3) 4)
  (= (MOVE-COST TB34 T2) 4)
  (= (MOVE-COST TB34 M2) 5)
  (= (MOVE-COST TB34 T1) 6)
  (= (MOVE-COST TB34 M1) 7)
  (= (MOVE-COST T4 TABLE-IN) 8)
  (= (MOVE-COST T4 TB12) 6)
  (= (MOVE-COST T4 TB23) 4)
  (= (MOVE-COST T4 TB34) 2)
  (= (MOVE-COST T4 T4) 1000)
  (= (MOVE-COST T4 M4) 2)
  (= (MOVE-COST T4 TABLE-OUT) 3)
  (= (MOVE-COST T4 T3) 4)
  (= (MOVE-COST T4 M3) 5)
  (= (MOVE-COST T4 T2) 5)
  (= (MOVE-COST T4 M2) 6)
  (= (MOVE-COST T4 T1) 7)
  (= (MOVE-COST T4 M1) 8)
  (= (MOVE-COST M4 TABLE-IN) 8)
  (= (MOVE-COST M4 TB12) 6)
  (= (MOVE-COST M4 TB23) 4)
  (= (MOVE-COST M4 TB34) 2)
  (= (MOVE-COST M4 T4) 2)
  (= (MOVE-COST M4 M4) 1000)
  (= (MOVE-COST M4 TABLE-OUT) 3)
  (= (MOVE-COST M4 T3) 4)
  (= (MOVE-COST M4 M3) 5)
  (= (MOVE-COST M4 T2) 5)
  (= (MOVE-COST M4 M2) 6)
  (= (MOVE-COST M4 T1) 7)
  (= (MOVE-COST M4 M1) 8)
  (= (MOVE-COST TABLE-OUT TABLE-IN) 6)
  (= (MOVE-COST TABLE-OUT TB12) 4)
  (= (MOVE-COST TABLE-OUT TB23) 2)
  (= (MOVE-COST TABLE-OUT TB34) 2)
  (= (MOVE-COST TABLE-OUT T4) 3)
  (= (MOVE-COST TABLE-OUT M4) 3)
  (= (MOVE-COST TABLE-OUT TABLE-OUT) 1000)
  (= (MOVE-COST TABLE-OUT T3) 2)
  (= (MOVE-COST TABLE-OUT M3) 3)
  (= (MOVE-COST TABLE-OUT T2) 3)
  (= (MOVE-COST TABLE-OUT M2) 4)
  (= (MOVE-COST TABLE-OUT T1) 5)
  (= (MOVE-COST TABLE-OUT M1) 6)
  (= (MOVE-COST T3 TABLE-IN) 7)
  (= (MOVE-COST T3 TB12) 5)
  (= (MOVE-COST T3 TB23) 3)
  (= (MOVE-COST T3 TB34) 3)
  (= (MOVE-COST T3 T4) 4)
  (= (MOVE-COST T3 M4) 4)
  (= (MOVE-COST T3 TABLE-OUT) 2)
  (= (MOVE-COST T3 T3) 1000)
  (= (MOVE-COST T3 M3) 2)
  (= (MOVE-COST T3 T2) 4)
  (= (MOVE-COST T3 M2) 5)
  (= (MOVE-COST T3 T1) 6)
  (= (MOVE-COST T3 M1) 7)
  (= (MOVE-COST M3 TABLE-IN) 6)
  (= (MOVE-COST M3 TB12) 4)
  (= (MOVE-COST M3 TB23) 2)
  (= (MOVE-COST M3 TB34) 4)
  (= (MOVE-COST M3 T4) 5)
  (= (MOVE-COST M3 M4) 5)
  (= (MOVE-COST M3 TABLE-OUT) 3)
  (= (MOVE-COST M3 T3) 2)
  (= (MOVE-COST M3 M3) 1000)
  (= (MOVE-COST M3 T2) 3)
  (= (MOVE-COST M3 M2) 4)
  (= (MOVE-COST M3 T1) 5)
  (= (MOVE-COST M3 M1) 6)
  (= (MOVE-COST T2 TABLE-IN) 4)
  (= (MOVE-COST T2 TB12) 2)
  (= (MOVE-COST T2 TB23) 2)
  (= (MOVE-COST T2 TB34) 4)
  (= (MOVE-COST T2 T4) 5)
  (= (MOVE-COST T2 M4) 5)
  (= (MOVE-COST T2 TABLE-OUT) 3)
  (= (MOVE-COST T2 T3) 4)
  (= (MOVE-COST T2 M3) 3)
  (= (MOVE-COST T2 T2) 1000)
  (= (MOVE-COST T2 M2) 2)
  (= (MOVE-COST T2 T1) 3)
  (= (MOVE-COST T2 M1) 4)
  (= (MOVE-COST M2 TABLE-IN) 4)
  (= (MOVE-COST M2 TB12) 2)
  (= (MOVE-COST M2 TB23) 3)
  (= (MOVE-COST M2 TB34) 5)
  (= (MOVE-COST M2 T4) 6)
  (= (MOVE-COST M2 M4) 6)
  (= (MOVE-COST M2 TABLE-OUT) 4)
  (= (MOVE-COST M2 T3) 5)
  (= (MOVE-COST M2 M3) 4)
  (= (MOVE-COST M2 T2) 2)
  (= (MOVE-COST M2 M2) 1000)
  (= (MOVE-COST M2 T1) 3)
  (= (MOVE-COST M2 M1) 4)
  (= (MOVE-COST T1 TABLE-IN) 2)
  (= (MOVE-COST T1 TB12) 2)
  (= (MOVE-COST T1 TB23) 4)
  (= (MOVE-COST T1 TB34) 6)
  (= (MOVE-COST T1 T4) 7)
  (= (MOVE-COST T1 M4) 7)
  (= (MOVE-COST T1 TABLE-OUT) 5)
  (= (MOVE-COST T1 T3) 6)
  (= (MOVE-COST T1 M3) 5)
  (= (MOVE-COST T1 T2) 3)
  (= (MOVE-COST T1 M2) 3)
  (= (MOVE-COST T1 T1) 1000)
  (= (MOVE-COST T1 M1) 2)
  (= (MOVE-COST M1 TABLE-IN) 2)
  (= (MOVE-COST M1 TB12) 3)
  (= (MOVE-COST M1 TB23) 5)
  (= (MOVE-COST M1 TB34) 7)
  (= (MOVE-COST M1 T4) 8)
  (= (MOVE-COST M1 M4) 8)
  (= (MOVE-COST M1 TABLE-OUT) 6)
  (= (MOVE-COST M1 T3) 7)
  (= (MOVE-COST M1 M3) 6)
  (= (MOVE-COST M1 T2) 4)
  (= (MOVE-COST M1 M2) 4)
  (= (MOVE-COST M1 T1) 2)
  (= (MOVE-COST M1 M1) 1000)
  (REACHABLE A4 M4)
  (REACHABLE A4 TB34)
  (REACHABLE A4 T4)
  (REACHABLE A3 M3)
  (REACHABLE A3 TB34)
  (REACHABLE A3 T3)
  (REACHABLE A3 TABLE-OUT)
  (REACHABLE A3 TB23)
  (REACHABLE A2 M2)
  (REACHABLE A2 TB23)
  (REACHABLE A2 T2)
  (REACHABLE A2 TB12)
  (REACHABLE A1 M1)
  (REACHABLE A1 TB12)
  (REACHABLE A1 T1)
  (REACHABLE A1 TABLE-IN)
  (= (LOADING-COST) 1)
  ;; (= (TOTAL-TIME) 0)
  (FINISHED NOTHING-DONE BASE0-7454)
  (FINISHED NOTHING-DONE BASE1-7453)
  (FINISHED NOTHING-DONE BASE2-7452)
  (FINISHED NOTHING-DONE BASE3-7451)
  (FINISHED NOTHING-DONE BASE4-7450)
  (FINISHED NOTHING-DONE BASE5-7449)
  (FINISHED NOTHING-DONE BASE6-7448)
  (FINISHED NOTHING-DONE BASE7-7447)
  (FINISHED NOTHING-DONE BASE8-7446)
  (FINISHED NOTHING-DONE BASE9-7445)
  (FINISHED NOTHING-DONE BASE10-7444)
  (FINISHED NOTHING-DONE BASE11-7443)
  (FINISHED NOTHING-DONE BASE12-7442)
  (FINISHED NOTHING-DONE BASE13-7441)
  (FINISHED NOTHING-DONE BASE14-7440)
  (FINISHED NOTHING-DONE BASE15-7439)
  (AT BASE0-7454 CARRY-IN)
  (AT BASE1-7453 CARRY-IN)
  (AT BASE2-7452 CARRY-IN)
  (AT BASE3-7451 CARRY-IN)
  (AT BASE4-7450 CARRY-IN)
  (AT BASE5-7449 CARRY-IN)
  (AT BASE6-7448 CARRY-IN)
  (AT BASE7-7447 CARRY-IN)
  (AT BASE8-7446 CARRY-IN)
  (AT BASE9-7445 CARRY-IN)
  (AT BASE10-7444 CARRY-IN)
  (AT BASE11-7443 CARRY-IN)
  (AT BASE12-7442 CARRY-IN)
  (AT BASE13-7441 CARRY-IN)
  (AT BASE14-7440 CARRY-IN)
  (AT BASE15-7439 CARRY-IN))
 (:GOAL
  (AND (FINISHED J8 BASE0-7454)
       (FINISHED J8 BASE1-7453)
       (FINISHED J8 BASE2-7452)
       (FINISHED J8 BASE3-7451)
       (FINISHED J8 BASE4-7450)
       (FINISHED J8 BASE5-7449)
       (FINISHED J8 BASE6-7448)
       (FINISHED J8 BASE7-7447)
       (FINISHED J8 BASE8-7446)
       (FINISHED J8 BASE9-7445)
       (FINISHED J8 BASE10-7444)
       (FINISHED J8 BASE11-7443)
       (FINISHED J8 BASE12-7442)
       (FINISHED J8 BASE13-7441)
       (FINISHED J8 BASE14-7440)
       (FINISHED J8 BASE15-7439)
       (AT BASE0-7454 CARRY-OUT)
       (AT BASE1-7453 CARRY-OUT)
       (AT BASE2-7452 CARRY-OUT)
       (AT BASE3-7451 CARRY-OUT)
       (AT BASE4-7450 CARRY-OUT)
       (AT BASE5-7449 CARRY-OUT)
       (AT BASE6-7448 CARRY-OUT)
       (AT BASE7-7447 CARRY-OUT)
       (AT BASE8-7446 CARRY-OUT)
       (AT BASE9-7445 CARRY-OUT)
       (AT BASE10-7444 CARRY-OUT)
       (AT BASE11-7443 CARRY-OUT)
       (AT BASE12-7442 CARRY-OUT)
       (AT BASE13-7441 CARRY-OUT)
       (AT BASE14-7440 CARRY-OUT)
       (AT BASE15-7439 CARRY-OUT)))
 (:METRIC MINIMIZE (TOTAL-TIME)))