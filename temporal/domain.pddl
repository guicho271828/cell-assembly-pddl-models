(define (domain cell-assembly)
  (:requirements :strips :typing
                 :numeric-fluents
		 :durative-actions)
  (:types arm		       ;
	  position	       ; Where the arms are potentially able to go
	  holdable
	  job - object
	  
	  table - position     ; The place to attach components with arms.
	  container - position ; Has infinite capacity to store things.
	  
	  conveyor - container ; Slide things in/away. Infinite length.
	  tray - container     ; Part trays.
	  
	  machine - table      ; Tables with specific feature (e.g. painting). Run jobs by itself.
	  machine-job - job    ; Jobs which should be done on machines.
	  base - holdable      ;
	  component - holdable ; Things which should be attatched on tables.
	  )
  (:constants carry-in - conveyor  ; the start of the base
	      carry-out - conveyor ; the goal of the base
	      table-in - table	   ; always connected to the conveyor
	      table-out - table	   ; always connected to the conveyor
	      nothing-done - job)  ; general start state of any base
  (:predicates 
   (moving ?arm - arm)
   (assembling-on ?table - table)

   ;; arm attributes
   (reachable ?arm - arm ?to - position)
   ;; position attributes
   (connected ?from ?to - position) ;; by conveyor
   ;; job attributes
   (depends ?prev-job ?job - job)
   (job-available-at ?job - job ?pos - table)
   (uses ?job - job ?component - component)
   
   ;; state description
   (at ?obj - object ?pos - position)
   (not-arm-present ?pos - position)
   (not-base-present ?pos - position)
   
   (hold ?arm - arm ?holdable - holdable)
   (free ?arm - arm) ;; instead of (not (exists (?base) (hold ?arm ?base)))

   ;; (used ?component - component)
   
   (finished ?job - job ?base - base))

  (:functions
   (loading-cost)        ; the cost to set and eject base
   (job-cost ?job - job) ; the cost to do each job
   ;; NOTE: slidng a base is zero-cost
   (move-cost ?from ?to - position) - number)

  (:durative-action move-arm
                    ;; Moves the arm (?arm) from the source (?from) to the
                    ;; destination (?to). The not-arm-present
                    ;; propositions enforce a mutual exclusion constraint so that
                    ;; only one arm can occupy any given location at a time.
                    :parameters (?arm - arm ?from - position ?to - position)
                    :duration (= ?duration (move-cost ?from ?to))
                    :condition (and (at start (at ?arm ?from))
                                    (at start (not-arm-present ?to))
                                    (at start (free ?arm))
                                    (at start (reachable ?arm ?to)))
                    :effect (and (at end (at ?arm ?to))
                                 (at end (not (not-arm-present ?to)))
                                 (at start (not (at ?arm ?from)))
                                 (at start (not-arm-present ?from))))

  (:durative-action move-arm-holding
                    ;; Same as move-arm, but assumes the arm is holding something.
                    :parameters (?arm - arm
                                      ?from - position ?to - position
                                      ?thing - holdable)
                    :duration (= ?duration (move-cost ?from ?to))
                    :condition (and (at start (at ?arm ?from))
                                    (at start (not-arm-present ?to))
                                    (at start (hold ?arm ?thing))
                                    (at start (reachable ?arm ?to)))
                    :effect (and (at end (at ?arm ?to))
                                 (at end (not (not-arm-present ?to)))
                                 (at start (not (at ?arm ?from)))
                                 (at start (not-arm-present ?from))))
  
  (:durative-action eject-base
                    ;; Eject Base: Uses an arm (?arm) to grasp and pick up a base
                    ;; (?base) from a machine or a table (?pos). Resets the mutual
                    ;; exclusion constraint on the table (not-base-present ?pos).
                    :parameters (?base - base ?arm - arm ?pos - table)
                    :duration (= ?duration (loading-cost))
                    :condition (and (at start (at ?base ?pos))
                                    (at start (at ?arm ?pos))
                                    (at start (free ?arm)))
                    :effect (and (at end (hold ?arm ?base))
                                 (at end (not (free ?arm)))
                                 (at end (not-base-present ?pos))
                                 (at end (not (at ?base ?pos)))))
  
  (:durative-action set-base
                    ;; Set Base: Commands an arm (?arm) that is holding a
                    ;; particular base (?base) to set the base on a machine or
                    ;; table (?pos). Sets the mutual exclusion constraint
                    ;; (not-base-present ?pos).
                    :parameters (?base - base ?arm - arm ?pos - table)
                    :duration (= ?duration (loading-cost))
                    :condition (and (at start (hold ?arm ?base))
                                    (at start (at ?arm ?pos))
                                    (at start (not-base-present ?pos)))
                    :effect (and (at end (at ?base ?pos))
                                 (at end (free ?arm))
                                 (at end (not (hold ?arm ?base)))
                                 (at end (not (not-base-present ?pos)))))

  (:durative-action slide-base-in
                    ;; Slide Base: Uses a slide device to move a base.
                    ;; CARRY-IN device only.
                    ;; It cares if the destination is already used.
                    :parameters (?base - base ?from - conveyor ?to - table)
                    :duration (= ?duration (loading-cost))
                    :condition (and (at start (at ?base ?from))
                                    (at start (connected ?from ?to))
                                    (at start (not-base-present ?to)))
                    :effect (and (at end (at ?base ?to))
                                 (at start (not (at ?base ?from)))
                                 (at end (not (not-base-present ?to)))))

  (:durative-action slide-base-out
                    ;; Slide Base: Uses a slide device to move a base. 
                    ;; CARRY-OUT device only.
                    ;; It doesn't care if the destination is already used.
                    ;; After the action the base acts like it had disappeared.
                    :parameters (?base - base ?from - table ?to - conveyor)
                    :duration (= ?duration (loading-cost))
                    :condition (and (at start (at ?base ?from))
                                    (at start (connected ?from ?to)))
                    :effect (and (at end (at ?base ?to))
                                 (at start (not (at ?base ?from)))
                                 (at start (not-base-present ?from))))
  
  (:durative-action pickup-component
                    ;; Use an arm (?arm) to pick up a part (?part). The part will
                    ;; later be used by assemble-with-arm.
                    ;; 
                    ;; NOTE: We assume there are unlimited number of components in
                    ;; trays. That's why this action lacks the delete effect on the
                    ;; place of the component (i.e. (not (at ?component ?pos))).
                    :parameters (?component - component ?arm - arm ?pos - tray)
                    :duration (= ?duration (loading-cost))
                    :condition (and (at start (free ?arm))
                                    (at start (at ?arm ?pos))
                                    (at start (at ?component ?pos)))
                    :effect (and (at start (hold ?arm ?component))
                                 (at start (not (free ?arm)))))
  
  (:durative-action assemble-with-machine
                    ;; Use a machine (?pos) to perform an assembly operation (e.g.,
                    ;; tighten the screw, paint the base etc) on a base (?base).
                    ;; The target base should fulfill some ordering constraints, e.g.
                    ;; a base should be painted after a component X is attatched.

                    ;; The ordering constraints are given in the problem.
                    ;; This assumption is realistic because when a product is designed,
                    ;; the designer always considers how they are assembled.
                    :parameters (?base - base
                                       ?machine - machine
                                       ?job - machine-job
                                       ?prev-job - job)
                    :duration (= ?duration (job-cost ?job))
                    :condition (and ;; machine specification
                                (at start (job-available-at ?job ?machine))
                                ;; state specification
                                ;;(at start (not (finished ?job ?base)))
                                (at start (at ?base ?machine))
                                ;; job dependency specification (linear)
                                (at start (depends ?prev-job ?job))
                                (at start (finished ?prev-job ?base)))
                    :effect (and (at end (finished ?job ?base))))

  (:durative-action assemble-with-arm
                    ;; Uses an arm (?arm) to attach a part (?component) to a base.
                    ;; This operation should be done on a table.
                    :parameters (?component - component
                                            ?job ?prev-job - job
                                            ?base - base
                                            ?arm - arm
                                            ?pos - table)
                    :duration (= ?duration (job-cost ?job))
                    :condition (and
                                ;; job specification
                                (at start (job-available-at ?job ?pos))
                                (at start (uses ?job ?component))
                                ;; state specification
                                (at start (hold ?arm ?component))
                                (at start (at ?arm ?pos))
                                (at start (at ?base ?pos))
                                ;; job dependency specification (linear)
                                (at start (depends ?prev-job ?job))
                                (at start (finished ?prev-job ?base)))
                    :effect (and (at end (finished ?job ?base))
                                 (at end (free ?arm))
                                 (at end (not (hold ?arm ?component))))))

