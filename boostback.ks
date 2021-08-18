wait until AG8.

rcs on.
lock steering to ship:srfretrograde.

wait 18.
rcs off.

set throttle to 1.


wait until SQRT(verticalSpeed^2 + groundSpeed^2) <= 30.
set throttle to 0.
unlock steering.

lock steering to heading (270,0).
rcs on.
wait 10.
rcs on.

set throttle to 1.

wait until addons:tr:impactpos:lng <= -74.5576784194981 - 0.0060680103.
set throttle to 0.

unlock throttle.
lock steering to srfRetrograde.

wait 22.

if addons:tr:impactpos:lat > -0.0971980779244982 { set ship:control:starboard to 1. }. // remember to change this back to -1, and the next line to 1. REMEMBER!
wait until addons:tr:impactpos:lat <= -0.0971980779244982.
set ship:control:top to 0.

if addons:tr:impactpos:lat < -0.0971980779244982 { set ship:control:starboard to -1. }.
wait until addons:tr:impactpos:lat >= -0.0971980779244982.
set ship:control:starboard to 0.
rcs off.
unlock steering.
runpath("0:/landing.ks").





