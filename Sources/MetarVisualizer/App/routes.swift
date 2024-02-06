import Vapor
import Fluent
import FluentMySQLDriver
import Crypto


func routes(_ app: Application) throws {
    let metar : Metar = Metar()

    let stringURL = "https://codermerlin.academy/wiki/images/1/15/Example-metars.csv"
    let text = metar.readStringFromURL(stringURL: stringURL)
    
    let _ = metar.convertCSV(stringData: text!)

    app.get("") {req in
        req.redirect(to: "./index")
    }

    app.get("index") {req -> View in
        return try await req.view.render("index.html")
    }

    app.get("index","data") {req -> MetarData in
        let metarData = MetarData(metar: metar.metar)
        
        return metarData
    }
    
}

struct MetarData : Content{
    let metar : [MetarRow]
}

