import UIKit
import PlaygroundSupport


class AnimatedView: UIView {
    
    private let drunkCat = UIImageView(image: UIImage(named: "rectangle4Copy"))
    private let pooCat = UIImageView(image: UIImage(named: "rectangle"))
    private let tiedCat = UIImageView(image: UIImage(named: "rectangle4"))
    private let walkCat = UIImageView(image: UIImage(named: "rectangle4Copy2"))
    
    private let cats: [UIImageView]
    
    override init(frame: CGRect) {
        cats = [drunkCat, pooCat, tiedCat, walkCat]
        super.init(frame: frame)
        backgroundColor = .white
        
        cats.forEach({
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .red
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 75).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 75).isActive = true
            addSubview($0)
        })
        
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(delay: CGFloat = 0) {
        drunkCat.transform = CGAffineTransform(translationX: -100, y: -100)
        pooCat.transform = CGAffineTransform(translationX: -100, y: 100)
        tiedCat.transform = CGAffineTransform(translationX: 100, y: -100)
        walkCat.transform = CGAffineTransform(translationX: 100, y: 100)
        
        let animator = UIViewPropertyAnimator(duration: 2, curve: .easeOut)
        animator.addAnimations({ [weak self] in
            self?.drunkCat.transform = .identity
            self?.pooCat.transform = .identity
            self?.tiedCat.transform = .identity
            self?.walkCat.transform = .identity
            }, delayFactor: delay)
        
        animator.startAnimation()
    }
    
    private func addConstraints() {
        drunkCat.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        drunkCat.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        pooCat.topAnchor.constraint(equalTo: drunkCat.bottomAnchor).isActive = true
        pooCat.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        tiedCat.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tiedCat.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        walkCat.topAnchor.constraint(equalTo: tiedCat.bottomAnchor).isActive = true
        walkCat.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}


let v = AnimatedView()
v.frame = CGRect(x: 0, y: 0, width: 250, height: 150)
PlaygroundPage.current.liveView = v

v.animate(delay: 0.2)
