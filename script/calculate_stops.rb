

$stations={}

#:n8th, :n23rd, :sx23rd, :AP, :l3rd,:l6th, :US, l8th
#caps for beginning letters unless line
#Northern Line
station_names =[:n8th,
 :US,
 :n23rd,
 :n28th,
 :n34th,
 :TS,
 :sv42nd,
 :sv5th,
 :GC,
 :VJ,
 :sx33rd,
 :sx28th,
 :sx23rd,
 :AP,
 :l8th,
 :l6th,
 :l3rd,
 :l1st]
$stations[:n8th]= [:US]
$stations[:US] = [:n8th, :n23rd, :sx23rd, :AP, :l3rd,:l6th]
$stations[:n23rd] = [:n28th, :US]
$stations[:n28th] = [:n34th, :n23rd]
$stations[:n34th] = [:TS, :n28th]

$stations[:TS] = [:sv42nd, :n34th]

$stations[:sv42nd] = [:sv5th, :TS]
$stations[:sv5th] = [:GC, :sv42nd]
$stations[:GC] = [ :VJ, :sv5th,:sx33rd]
$stations[:VJ] =[:GC]

$stations[:sx33rd] = [:GC, :sx28th]
$stations[:sx28th] = [:sx33rd, :sx23rd]
$stations[:sx23rd] = [:sx28th, :US]
$stations[:AP] = [:US]

$stations[:l8th] = [:l6th]
$stations[:l6th] = [:US, :l8th]
$stations[:l3rd] = [:US, :l1st]
$stations[:l1st] = [:l3rd]
def tube_calc (curr_st, end_st)
    routes=calc_stop([], curr_st, end_st, [])
    route=routes.min_by {|x| x.size}
    stops =route.length - 1
end
#its gonna be the amount -1, since ive included the array.
def calc_stop(checked_stations, curr_st, end_st, final_values)
    if (curr_st == end_st)
        checked_stations.push(curr_st)
        final_values.push(checked_stations)
    else
        arr_of_stops = $stations[curr_st]
        arr_of_stops.each do |station|
            if (checked_stations.include?(station))
                next
            else
                calc_stop(checked_stations + [curr_st], station, end_st, final_values)
            end
        end
    end
    return final_values
end
binding.pry