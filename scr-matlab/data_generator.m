clear
close all
clc

trainNewSet = true;
if trainNewSet == true
    for imageSize = 0:3
        for numberOfCenters = 1:3
            dataSet = [];
            dataSet.imageSize = [90, 160] * 2^imageSize; % 4:3 size, 1280 x 720
            dataSet.numberOfCenters = numberOfCenters;
            dataSet.centers = (1:dataSet.numberOfCenters)' * (dataSet.imageSize / ( dataSet.numberOfCenters + 1 ));
            dataSet.numberOfPoints = 100;
            dataSet.sigma = int16(sqrt(sum(dataSet.imageSize.^2)) / 30);
            
            dataName = ['RANDOM_',num2str(dataSet.imageSize(1)),'x',num2str(dataSet.imageSize(2)),...
                '_NPoints_',num2str(dataSet.numberOfPoints), ...
                '_Singma_', num2str(dataSet.sigma),...
                '_NCenters_', num2str(dataSet.numberOfCenters)];
            
            disp(dataName);
            
            [dataSet.fixations, dataSet.image] = generate_random_gaze_points(dataSet.imageSize, dataSet.centers, dataSet.numberOfPoints, dataSet.sigma);

            dataSet.shuffledMap = getShuffledMap(dataSet.imageSize);
            results = [];
            results.dataSet = dataSet;
            resultSave(results, 'random');
            close all
        end
    end
end

    

