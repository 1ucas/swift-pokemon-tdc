# Swift-Pokemon-TCG

Motivos de Atualizar para o iOS 13

Principais vantagens da atualização:
1 - Habilitamos a documentação mais eficiente diretamente no Xcode (DocC)
Escrever: https://developer.apple.com/documentation/docc
Hospedar: https://developer.apple.com/documentation/Xcode/distributing-documentation-to-external-developers

2 - Interfaces muito mais rápidas de serem construídas (SwiftUI), média de 3 vezes menos código escrito na camada de UI.
https://developer.apple.com/xcode/swiftui/

3 - Redução na complexidade do código durante execução de chamadas assíncronas ✅
https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html

4 - Estruturas para reduzir o riscos de acesso a componentes de UI fora da MainThread e consequentes crashes ✅
https://developer.apple.com/documentation/swift/mainactor

5 - Programação Reativa oferecida de forma nativa pela Apple (Combine) reduz a quantidade de dependências necessárias no projeto
https://developer.apple.com/documentation/combine

6 - Deixamos de suportar caminhos alternativos no código e em dependências, onde são feitas verificações do iOS 12 e iOS 13: No caso de nosso projeto foram encontras 78 validações!
"#available(macOS 10.15, iOS 13.0, tvOS 13.0, *)""

7 - Melhoria nas telas que precisam de scroll usando as novas APIs de UICollectionView
https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource

8 - Melhoria na criptografia com o CryptoKit
https://developer.apple.com/documentation/cryptokit

9 - Uso de Imagens de símbolos nativos do iOS usando "systemName"
https://developer.apple.com/documentation/uikit/uiimage/3294233-init

10 - Melhorias na detecção de Dark Mode e "forçar a interface a seguir um padrão"
https://developer.apple.com/documentation/uikit/uiview/3238086-overrideuserinterfacestyle

11 - O uso de tecnologias mais modernas / atuais ajuda a reduzir a evasão de pessoas
:)