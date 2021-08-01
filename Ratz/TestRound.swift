//
//  TestRound.swift
//  Ratz
//
//  Created by André Schueda on 31/07/21.
//

import Foundation

struct TestRound {
    var answers: [Answer]
    let question: String
}

extension TestRound {
    static let rounds = [TestRound(answers: [Answer(text: "21 bilhões", correct: true),
                                             Answer(text: "10 bilhões", correct: false),
                                             Answer(text: "9 bilhões", correct: false),
                                             Answer(text: "15 bilhões", correct: false)].shuffled(), question: "Quantos ratos existem no mundo?"),
                         TestRound(answers: [Answer(text: "Leishmaniose", correct: true),
                                             Answer(text: "Lepstopirose", correct: false),
                                             Answer(text: "Hentavirose", correct: false),
                                             Answer(text: "Peste Bubônica", correct: false)].shuffled(), question: "Qual dessas doenças não é transmitida por ratos?"),
                         TestRound(answers: [Answer(text: "de 200 g a 400 g", correct: true),
                                             Answer(text: "de 400 g a 600 g", correct: false),
                                             Answer(text: "de 600 g a 800 g", correct: false),
                                             Answer(text: "de 800 g a 1 kg", correct: false)].shuffled(), question: "Quanto pesa uma ratazana?"),
                         TestRound(answers: [Answer(text: "cerca de 1700", correct: true),
                                             Answer(text: "cerca de 300", correct: false),
                                             Answer(text: "cerca de 700", correct: false),
                                             Answer(text: "cerca de 1400", correct: false)].shuffled(), question: "Quantas espécies de rato existem no mundo?"),
                         TestRound(answers: [Answer(text: "120 milhões", correct: true),
                                             Answer(text: "40 milhões", correct: false),
                                             Answer(text: "10 milhões", correct: false),
                                             Answer(text: "50 milhões", correct: false)].shuffled(), question: "Quantos ratos existem em São Paulo?"),
                         TestRound(answers: [Answer(text: "Mesocricetus auratus", correct: true),
                                             Answer(text: "Mus musculos", correct: false),
                                             Answer(text: "Rattus norvegicus", correct: false),
                                             Answer(text: "Rattus rattus", correct: false)].shuffled(), question: "Qual dessas espécies não representa risco à saúde?")].shuffled()
}
