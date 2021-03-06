import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet private var holderView: UIView!
    
    private let scrollView = UIScrollView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configure()
    }
   
    private func configure(){
        scrollView.frame = holderView.bounds
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3 , height: 0)
        scrollView.isPagingEnabled = true
        holderView.addSubview(scrollView)
        
        setup()
    }
    
    @objc private func didTapButton(_ button: UIButton) {
        guard button.tag < 3 else {
            CoreModel.shared.setisFirstLaunching()

            let firstLaunchView = storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
            firstLaunchView.modalPresentationStyle = .fullScreen
            firstLaunchView.modalTransitionStyle = .flipHorizontal
            
            present(firstLaunchView, animated: true, completion: nil)
            
            return
        }
        
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
    
    private func setup(){
        let titles = ["Weather","Notes","Welcome"]
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width - 20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10 + 120 + 10, width: pageView.frame.size.width - 20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height - 60, width: pageView.frame.size.width - 20, height: 50))
            
            pageView.addSubview(label)
            pageView.addSubview(imageView)
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            label.text = titles[x]
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x+1)")
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Next", for: .normal)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
            if x == 2 {
                button.setTitle("Let's Start", for: .normal)
            }
        }
    }
}
