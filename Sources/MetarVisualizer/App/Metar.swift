import Vapor
import Foundation
import FoundationNetworking


struct MetarRow : Content{
    let raw_text:String
    let station_id:String
    let observation_time:String
    let latitude:String
    let longitude:String
    let temp_c:String
    let dewpoint_c:String
    let wind_dir_degrees:String
    let wind_speed_kt:String
    let wind_gust_kt:String
    let visivility_statute_mi:String
    let altim_in_hg:String
    let sea_level_pressure_mb:String
    let corrected:String
    let auto:String
    let auto_station:String
    let maintenance_indicator_on:String
    let no_signal:String
    let lightning_sensor_off:String
    let freezing_rain_sensor_off:String
    let present_weather_sensor_off:String
    let wx_string:String
    let sky_cover:String
    let cloud_base_ft_agl:String
    let sky_cover1:String
    let cloud_base_ft_agl1:String
    let sky_cover2:String
    let cloud_base_ft_agl2:String
    let sky_cover3:String
    let cloud_base_ft_agl3:String
    let flight_category:String
    let three_hr_pressure_tendency_mb:String
    let maxT_c:String
    let minT_c:String
    let maxT24hr_c:String
    let minT24hr_c:String
    let precip_in:String
    let pcp3hr_in:String
    let pcp6hr_in:String
    let pcp24hr_in:String
    let snow_in:String
    let vert_vis_ft:String
    let metar_type:String
    let elevation_m:String
}

class Metar{
    var columnTitles:[String] = []
    var metar = [MetarRow]()

    //default constructor
    init() {
    }
/*
    //initializer that accepts a series of fields of the expected type
    init() {
    }

    //initializer that accepts a series of strings, one for each field
    init() {
    }

    //initializer that accepts a single string, in a format identical to that in the sample file
    init() {
    }
*/
    
    func readStringFromURL(stringURL:String)-> String!{
        var content : String = ""
        do {
            content = try String(contentsOf:URL(string: stringURL)!)
        }
        catch let error {
            print("Error: \(error)")
        }
        return content
    }
    
    func cleanRows(stringData:String)->[String]{
        var cleanFile = stringData
        cleanFile = cleanFile.replacingOccurrences(of:"\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile.components(separatedBy: "\n")
    }
    
    func cleanFields(oldString:String) -> [String]{
        let delimiter = ","
        let newString = oldString.replacingOccurrences(of: ",", with: ",")
        return newString.components(separatedBy: delimiter)
    }
    
    func convertCSV(stringData:String) -> [MetarRow] {
        let rows = cleanRows(stringData: stringData)
        let columnLine = 5
        if rows.count > 0 {
            columnTitles = cleanFields(oldString: rows[columnLine])
            var i = 0
            for row in rows{
                let fields = cleanFields(oldString: row)

                if(fields.count == columnTitles.count && i > 5){
                    let raw_text = fields[0]
                    let station_id = fields[1]
                    let observation_time = fields[2]
                    let latitude = fields[3]
                    let longitude = fields[4]
                    let temp_c = fields[5]
                    let dewpoint_c = fields[6]
                    let wind_dir_degrees = fields[7]
                    let wind_speed_kt = fields[8]
                    let wind_gust_kt = fields[9]
                    let visivility_statute_mi = fields[10]
                    let altim_in_hg = fields[11]
                    let sea_level_pressure_mb = fields[12]
                    let corrected = fields[13]
                    let auto = fields[14]
                    let auto_station = fields[15]
                    let maintenance_indicator_on = fields[16]
                    let no_signal = fields[17]
                    let lightning_sensor_off = fields[18]
                    let freezing_rain_sensor_off = fields[19]
                    let present_weather_sensor_off = fields[20]
                    let wx_string = fields[21]
                    let sky_cover = fields[22]
                    let cloud_base_ft_agl = fields[23]
                    let sky_cover1 = fields[24]
                    let cloud_base_ft_agl1 = fields[25]
                    let sky_cover2 = fields[26]
                    let cloud_base_ft_agl2 = fields[27]
                    let sky_cover3 = fields[28]
                    let cloud_base_ft_agl3 = fields[29]
                    let flight_category = fields[30]
                    let three_hr_pressure_tendency_mb = fields[31]
                    let maxT_c = fields[32]
                    let minT_c = fields[33]
                    let maxT24hr_c = fields[34]
                    let minT24hr_c = fields[35]
                    let precip_in = fields[36]
                    let pcp3hr_in = fields[37]
                    let pcp6hr_in = fields[38]
                    let pcp24hr_in = fields[39]
                    let snow_in = fields[40]
                    let vert_vis_ft = fields[41]
                    let metar_type = fields[42]
                    let elevation_m = fields[43]

                    let newRow = MetarRow(raw_text: raw_text, station_id: station_id, observation_time: observation_time, latitude: latitude, longitude: longitude, temp_c: temp_c, dewpoint_c: dewpoint_c, wind_dir_degrees: wind_dir_degrees, wind_speed_kt: wind_speed_kt, wind_gust_kt: wind_gust_kt, visivility_statute_mi: visivility_statute_mi, altim_in_hg: altim_in_hg, sea_level_pressure_mb: sea_level_pressure_mb, corrected: corrected, auto: auto, auto_station: auto_station, maintenance_indicator_on: maintenance_indicator_on, no_signal: no_signal, lightning_sensor_off: lightning_sensor_off, freezing_rain_sensor_off: freezing_rain_sensor_off,present_weather_sensor_off: present_weather_sensor_off, wx_string: wx_string, sky_cover: sky_cover, cloud_base_ft_agl: cloud_base_ft_agl, sky_cover1: sky_cover1, cloud_base_ft_agl1: cloud_base_ft_agl1, sky_cover2: sky_cover2,cloud_base_ft_agl2: cloud_base_ft_agl2, sky_cover3: sky_cover3, cloud_base_ft_agl3: cloud_base_ft_agl3, flight_category: flight_category,three_hr_pressure_tendency_mb: three_hr_pressure_tendency_mb,maxT_c: maxT_c,minT_c: minT_c,maxT24hr_c: maxT24hr_c,minT24hr_c: minT24hr_c,precip_in: precip_in,pcp3hr_in: pcp3hr_in,pcp6hr_in: pcp6hr_in,pcp24hr_in: pcp24hr_in,snow_in: snow_in,vert_vis_ft: vert_vis_ft,metar_type: metar_type,elevation_m: elevation_m)

                    
                    metar.append(newRow)
                }
                i += 1
            }
                              
        } else {
            print("No data in file")
        }
        return metar
    }
    
    func getStationIDs()->[String]{        
        var stationIDs = [String]()    

        for metarRow in metar {
            stationIDs.append(metarRow.station_id)
        }

        return stationIDs
    }

    func getAllLocations()->String{
        var locations = ""
        var i = 0
        for metarRow in metar {
            var colorCode : String
            if i < 100 && (metarRow.station_id.first == "K") {
                switch metarRow.flight_category{
                case "VFR":
                    colorCode = "00FF00"
                    break
                case "MVFR":
                    colorCode = "0000FF"
                    break
                case "IFR":
                    colorCode = "ff0000"
                    break
                case "LIFR":
                    colorCode = "FC0FC0"
                    break
                default:
                    colorCode = "800080"
                    break
                }
                locations += "\(metarRow.latitude),\(metarRow.longitude)|flag-\(colorCode)-\(metarRow.station_id)||\(metarRow.latitude),\(metarRow.longitude)|circle-\(Int(ceil(Double(metarRow.temp_c)!)))||"//\(metarRow.latitude),\(metarRow.longitude)|http://pamsite.rutgers.edu/Images/wind%20barb%20example.png"
            }
            i += 1
        }
        return locations
     
    }
    
}
                
