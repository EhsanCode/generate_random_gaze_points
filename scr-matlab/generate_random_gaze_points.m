function [fixationPoints, im] = generate_random_gaze_points(imageSize, centers, numberOfPoints, sigma)

numberOfCenters = length(centers(:, 1));
numberOfPointsPerCenter = numberOfPoints / numberOfCenters;
pointCounter = 1;
centerNumber = 1;
fixationPoints = [];
while pointCounter <= numberOfPoints
    if pointCounter > centerNumber * numberOfPointsPerCenter
        centerNumber = centerNumber + 1;
    end
    a = fix(randn(1) .* sigma + centers(centerNumber, 1));
    b = fix(randn(1) .* sigma + centers(centerNumber, 2));
    
    if (a > 1 && a < imageSize(1) && b > 1 && b < imageSize(2))
        pointCounter = pointCounter + 1;
        fixationPoints = [fixationPoints; [a ,b]];
    end
end

im = zeros(imageSize);
im(sub2ind(imageSize, fixationPoints(:,1),fixationPoints(:,2))) = 1; 