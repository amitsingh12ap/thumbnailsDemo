//
//  CurrencyListModel.swift
//  Movies
//
//  Created by 13216146 on 03/02/20.
//  Copyright © 2020 13216146. All rights reserved.
//

import Foundation

import Foundation

// MARK: - VerifyOTPResponseModel
struct CurrencyListModel: Codable {
    let currencies: Currencies
    let status: String
}

// MARK: - Currencies
struct Currencies: Codable {
    let aud, bgn, brl, cad: String
    let chf, cny, czk, dkk: String
    let eur, gbp, hkd, hrk: String
    let huf, idr, ils, inr: String
    let isk, jpy, krw, mxn: String
    let myr, nok, nzd, php: String
    let pln, ron, rub, sek: String
    let sgd, thb, currenciesTRY, usd: String
    let zar: String

    enum CodingKeys: String, CodingKey {
        case aud = "AUD"
        case bgn = "BGN"
        case brl = "BRL"
        case cad = "CAD"
        case chf = "CHF"
        case cny = "CNY"
        case czk = "CZK"
        case dkk = "DKK"
        case eur = "EUR"
        case gbp = "GBP"
        case hkd = "HKD"
        case hrk = "HRK"
        case huf = "HUF"
        case idr = "IDR"
        case ils = "ILS"
        case inr = "INR"
        case isk = "ISK"
        case jpy = "JPY"
        case krw = "KRW"
        case mxn = "MXN"
        case myr = "MYR"
        case nok = "NOK"
        case nzd = "NZD"
        case php = "PHP"
        case pln = "PLN"
        case ron = "RON"
        case rub = "RUB"
        case sek = "SEK"
        case sgd = "SGD"
        case thb = "THB"
        case currenciesTRY = "TRY"
        case usd = "USD"
        case zar = "ZAR"
    }
}
