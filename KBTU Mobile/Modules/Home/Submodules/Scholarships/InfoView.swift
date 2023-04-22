//
//  InfoView.swift
//  kbtu-mob
//
//  Created by Altynay on 28.03.2023.
//

import SwiftUI

struct InfoView: View {
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    
    let items = ["гражданство РК", "обучение в учебном заведении", "GPA не менее 3,0(В) для кандидатов, завершивших 1 курс бакалавриата"]
    
    var body: some View {
        ZStack{
            Color("purpleColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                Text("Scholarships from KAZENERGY")
                    .font(.system(size:30, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 100, alignment: .center)
                HStack{
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                    Text("Заявки на участие в конкурсном отборе будут приниматься с 15 июля 2022 г. по 31 августа 2022 г.")
                        .font(.system(size: 20, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .frame(width: 340)
                }
                Button(action: {isExpanded1.toggle()},
                       label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Условия участия в конкурсе для лиц, поступивших и обучающихся в высших учебных заведениях")
                    }//hstack closed
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 410)
                })
                
                if isExpanded1 {
                    Text("1. гражданство Республики Казахстан;\n2. обучение в учебном заведении (при отсутствии у обучающегося финансовой задолженности);\n3. GPA не менее 3,0 (В) для кандидатов, завершивших 1 курс бакалавриата;\n4. GPA не менее 3,33 (В+)** для кандидатов, завершивших обучение на 2-3 курсах бакалавриата;")
                    .frame(width: 280, height: 270)
                }
                Spacer()
                
                Button(action: {isExpanded2.toggle()},
                       label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Перечень необходимых документов")
                    }//hstack closed
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                })
                
                if isExpanded2 {
                    Text("1. Копия удостоверения личности/свидетельства о рождении/паспорта с указанием индивидуального идентификационного номера (ИИН).\n2. Копия транскрипта с указанием GPA за предыдущий год обучения (в случае иной системы оценивания знаний, представление справки, заверенной учебной частью, об успеваемости, эквивалентной GPA не менее 3,0 (В) для завершивших 1 (первый) курс бакалавриата; не менее 3,33 (В+) для лиц, завершивших 2-3 (второй, третий) курсы бакалавриата, а также GPA не менее 3,33 (В+) для лиц, обучающихся на всех курсах послевузовского образования).")
                    .frame(width: 280, height: 490)
                }
                Spacer()
                Text("С подробностями о конкурсном отборе можно найти на сайте https://www.kazenergy.com")
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .frame(width: 340)
                    .padding()
            }//scroll closed
        }//zstack closed
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
