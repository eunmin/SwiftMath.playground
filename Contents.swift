import Foundation

extension Array where Element: Numeric {
    var total: Element { return reduce(0, +) }
}

extension Array where Element: BinaryInteger {
    var average: Double {
        return isEmpty ? 0 : Double(Int(total)) / Double(count)
    }
}

extension Array where Element: FloatingPoint {
    var average: Element {
        return isEmpty ? 0 : total / Element(count)
    }
}

func numerator(_ xs : [Double], _ ys : [Double]) -> Double {
    var result : Double = 0.0;
    let xa = xs.average
    let ya = ys.average
    
    for i in 0..<xs.count {
        result += (xs[i] - xa) * (ys[i] - ya)
    }
    return result
}

func denominator(_ xs : [Double], _ ys : [Double]) -> Double {
    var xr : Double = 0.0;
    var yr : Double = 0.0;
    let xa = xs.average
    let ya = ys.average

    for i in 0..<xs.count {
        xr += pow(xs[i] - xa, 2)
        yr += pow(ys[i] - ya, 2)
    }
    return sqrt(xr * yr)
}

func correlation(_ xs : [Double], _ ys : [Double]) -> Double {
    return numerator(xs, ys) / denominator(xs, ys)
}

let xs : [Double] = [1.0, 2.0, 3.0, 4.0, 5.0]
let ys : [Double] = [8.0, 7.0, 6.0, 4.0, 5.0]

correlation(xs, ys)

