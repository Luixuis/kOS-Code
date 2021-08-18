set radarOffset to 22.1187553405762 + 1.
lock trueRadar to alt:radar - radarOffset.
lock g to constant:g * body:mass / body:radius^2.
lock MaxDecel to (ship:availablethrust / ship:mass) - g.
lock stopDist to ship:verticalspeed^2 / (2 * MaxDecel).
lock idealthrottle to 1 * (stopDist / trueRadar).
lock impactTime to trueRadar / abs(ship:verticalspeed).

lock steering to ship:srfRetrograde.

until stopDist >= trueRadar {
    if (addons:tr:impactpos:lat > -0.0971980779244982) and (altitude < 4000) { 
        rcs on.
        set ship:control:starboard to 1. }.
    else if (addons:tr:impactpos:lat < -0.0971980779244982) and (altitude < 4000) { 
        rcs on.
        set ship:control:starboard to -1. }.
    if (addons:tr:impactpos:lng < -74.5576784194981 - 0.001) { set throttle to 0.2. }.
    else if (addons:tr:impactpos:lng > -74.557678419498 - 0.001) { set throttle to 0. }.

    print trueRadar.
    wait 0.01.
}
rcs off.
set x to 1.
until 0 {
    lock throttle to idealthrottle.
    print trueRadar.
    if ship:verticalSpeed >= 0 { break. }
    if impactTime <= 15 { set gear to True. }
}

// -74.5516104091545
// - 0.0060680103

