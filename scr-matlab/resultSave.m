function resultSave(results, fileName)

resultPath = '.\generated_data\';
if ~exist(resultPath,'dir')
    mkdir(resultPath)
end

saveFileName = [resultPath, fileName];
save(saveFileName,'results');