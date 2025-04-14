


import UIKit

class ViewController: UIViewController {
    
    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.layer.cornerRadius = 75
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        moveCircle()

    }

    private func setupUI() {
        view.addSubview(circleView)
        

        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 150),
            circleView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
                circleView.addGestureRecognizer(tapGesture)
    }
    
    
    private func moveCircle() {
        let screenWeight = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let circleRandomX = CGFloat.random(in: (0...screenWeight - 150))
        let circleRandomY = CGFloat.random(in: (0...screenHeight - 150))
        circleView.frame = CGRect(x: circleRandomX, y: circleRandomY, width: 150, height: 150)
    }
    

    @objc func circleTapped() {
        circleView.isHidden = true
        self.moveCircle()
        circleView.isHidden = false
    }
}

#Preview(traits: .portrait) {
    ViewController()
}
