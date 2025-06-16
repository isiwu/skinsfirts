//
//  SampleData.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 12/06/2025.
//

import Foundation

struct SampleData {
  static var doctors = [
    Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", experienceLevel: 12, stars: 4, messages: 60, isFavorite: false, gender: .female),
    Doctor(name: "Dr. Alexander Bennett, Ph.D.", field: "Dermato-Genetics", image: "doctor2", experienceLevel: 8, stars: 5, messages: 40, isFavorite: true, gender: .male),
    Doctor(name: "Dr. Sophia Martinez, Ph.D.", field: "Cosmetic Bioengineering", image: "doctor3", experienceLevel: 15, stars: 4, messages: 40, isFavorite: false, gender: .female),
    Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", experienceLevel: 6, stars: 4, messages: 50, isFavorite: true, gender: .female),
    Doctor(name: "Dr. Michael Davidson, M.D.", field: "Nano-Dermatology", image: "doctor4", experienceLevel: 13, stars: 4, messages: 60, isFavorite: false, gender: .male),
    Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", experienceLevel: 7, stars: 4, messages: 40, isFavorite: false, gender: .female)
  ]
  static var faqs = [
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: true),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: true),
    Faq(topic: "Lorem ipsum dolor?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: false),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue and that was how it was of it lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: false),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: true),
    
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: false),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: false),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: true),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "See the word of Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: false),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna.", popular: false),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: false),
    Faq(topic: "Lorem ipsum dolor sit amet?", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", popular: true),
  ]
  static var services = [
    Service(name: "Dermato-Endocrinology", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam."),
    Service(name: "Cosmetic Bioengineering", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam."),
    Service(name: "Dermato-Genetics", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam."),
    Service(name: "Solar Dermatology", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam."),
    Service(name: "Dermato-Endocrinology", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam."),
    Service(name: "Dermato-Endocrinology", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam."),
  ]
}
