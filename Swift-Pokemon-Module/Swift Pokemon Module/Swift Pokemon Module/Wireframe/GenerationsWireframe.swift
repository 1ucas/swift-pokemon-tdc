import UIKit

public protocol GenerationsWireframeProtocol: AnyObject {
    static func createGenerationsViperModule() -> UIViewController
}

public class GenerationsWireframe: GenerationsWireframeProtocol {

    public static func createGenerationsViperModule() -> UIViewController {
        let wireFrame = GenerationsWireframe()
        let interactor = GenerationsInteractor(apiService: PokemonApiService())
        let presenter = GenerationsPresenter(interactor: interactor, wireframe: wireFrame)

        let view = GenerationsViewController.instantiate()
        view.presenter = presenter
        
        return view
    }

}
