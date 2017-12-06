close all;

%Parameters
titleFontSize = 18;

% Cell array to hold names of browsers
browsers = {'Chrome'; 'Firefox'; 'Safari'};

% Edges for average frame rate and number of frames
averageFrameRateEdges = 1.166666666667:1:41;
numberOfFramesEdges = 0.5:1:17;

%Prepare 2 matrices to store the data 
averageFrameRateStatsMatrix = nan(3,4);
numberOfFramesStatsMatrix = nan(3,4);


% For loop that goes through all the browsers
for i = 1:3
    % Load in the browser name
    browser = browsers{i};
    
    % Read in the data
    data = readtable([browser '_10000_Trials.csv']);

    % Extract the data from the table and turn the strings into doubles
    averageFrameRateArray = str2double(data{:,{'frame_rate'}});
    numberOfFramesArray = str2double(data{:,{'number_of_frames'}});
    
    % Print out the min and max values to make sure that we cover the whole range
    disp('-----------');
    disp([browser ' Max Avg Frame Rate:']);
    disp(max(averageFrameRateArray));
    disp([browser ' Min Avg Frame Rate:']);
    disp(min(averageFrameRateArray));
    
    disp([browser ' Max Number of Frames:']);
    disp(max(numberOfFramesArray));
    disp([browser ' Min Number of Frames:']);
    disp(min(numberOfFramesArray));
    
    % Average Frame Rate Histogram
    subplot(2,3,i);
    %theTitle = browser;
    histogram(averageFrameRateArray,averageFrameRateEdges);
    title({''},'FontSize', titleFontSize);
    xlabel('');
    xlim([10 51]);
    ylabel('');
    ylim([0, 10000]);
    
    %saveas(gcf, [theTitle '_AverageFrameRate.png']);
    
    % Number of Frames Histogram
    subplot(2,3,i+3);
    %theTitle = browser;
    histogram(numberOfFramesArray,numberOfFramesEdges);
    title({'' ''},'FontSize', titleFontSize);
    xlabel('');
    xlim([3.5 13.5]);
    ylabel('');
    ylim([0, 10000]);
    %saveas(gcf, [theTitle '_NumberOfFrames.png']);
    
    %----------------------------------------
    % Store the stats
    
    % Mean
    averageFrameRateStatsMatrix(i,1) = mean(averageFrameRateArray);
    numberOfFramesStatsMatrix(i,1) = mean(numberOfFramesArray);
    
    % Std Dev
    averageFrameRateStatsMatrix(i,2) = std(averageFrameRateArray);
    numberOfFramesStatsMatrix(i,2) = std(numberOfFramesArray);
    
    % min
    averageFrameRateStatsMatrix(i,3) = min(averageFrameRateArray);
    numberOfFramesStatsMatrix(i,3) = min(numberOfFramesArray);
    
    % max
    averageFrameRateStatsMatrix(i,4) = max(averageFrameRateArray);
    numberOfFramesStatsMatrix(i,4) = max(numberOfFramesArray);

end

