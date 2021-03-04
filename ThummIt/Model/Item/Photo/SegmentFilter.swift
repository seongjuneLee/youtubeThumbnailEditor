//
//  SegmentFilter.swift
//  ThummIt
//
//  Created by 이성준 on 2021/02/23.
//

import Foundation
import CoreImage

class SegmentFilter : CIFilter {
    
    @objc var sourceImg: UIImage!

    @objc private let kernel: CIColorKernel
    @objc var inputImage: CIImage?
    @objc var maskImage: CIImage?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override init() {
        let kernelStr = """
            kernel vec4 gray(__sample source, __sample mask) {
                float maskValue = mask.r;
                float gray = dot(source.rgb, vec3(0.299, 0.587, 0.114));
                if(maskValue == 0.0){
                   return vec4(vec3(gray),0.0);
                }
                return vec4(mix(vec3(gray),source.rgb,maskValue),1.0);
            }
        """
        let kernels = CIColorKernel.makeKernels(source:kernelStr)!
        kernel = kernels[0] as! CIColorKernel
        super.init()
    }
    
    override var outputImage: CIImage? {
        guard let inputImage = inputImage,let maskImage = maskImage else {return nil}
 
        let scale = inputImage.extent.width / maskImage.extent.width
        let suitableMaskImg = maskImage.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
        return kernel.apply(extent: inputImage.extent, arguments:  [inputImage,suitableMaskImg])
    }
    
    @objc func bgRemovedImage () -> (UIImage){
        
        if let cgImg = sourceImg.segmentation(){
            let filter = SegmentFilter()
            filter.inputImage = CIImage.init(cgImage: sourceImg.cgImage!)
            filter.maskImage = CIImage.init(cgImage: cgImg)
            let output = filter.value(forKey:kCIOutputImageKey) as! CIImage
            
            let ciContext = CIContext(options: nil)
            let cgImage = ciContext.createCGImage(output, from: output.extent)!
            return UIImage(cgImage: cgImage)
        }
        return UIImage.init()
    }
}


