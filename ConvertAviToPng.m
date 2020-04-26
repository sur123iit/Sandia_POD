movieFullFileName = 'C:\Users\surabhi123iit\Dropbox (UFL)\Cavity Project\BlowingAnimations\2019June29_Run47_5.avi'; 
videoObject = VideoReader(movieFullFileName);
	% Determine how many frames there are.
	numberOfFrames = videoObject.NumberOfFrames;
	vidHeight = videoObject.Height;
	vidWidth = videoObject.Width;
	numberOfFramesWritten = 0;
	% Prepare a figure to show the images in the upper half of the screen.
	figure;
	% 	screenSize = get(0, 'ScreenSize');
	% Enlarge figure to full screen.
	set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
	firstFrame = read(videoObject, 1);
	% Ask user if they want to write the individual frames out to disk.
	promptMessage = sprintf('Do you want to save the individual frames out to individual disk files?');
	button = questdlg(promptMessage, 'Save individual frames?', 'Yes', 'No', 'Yes');
    firstVid1 = 'C:\Users\surabhi123iit\Desktop\WindTunnelRuns\Trigg11_0004_0336.avi';
    firstObject1 = VideoReader(firstVid1);
    backFrame = read(firstObject1, 1);
    %firstVid2 = 'C:\Users\surabhi123iit\Dropbox (UFL)\Cavity Project\Trigg11_0004_0091.avi';
    %firstObject2 = VideoReader(firstVid2);
    %firstFrame2 = read(firstObject2, 1);
     firstFrame = read(videoObject, 1);
	if strcmp(button, 'Yes')
		writeToDisk = true;
		
		% Extract out the various parts of the filename.
		[folder, baseFileName, extentions] = fileparts(movieFullFileName);
		% Make up a special new output subfolder for all the separate
		% movie frames that we're going to extract and save to disk.
		% (Don't worry - windows can handle forward slashes in the folder name.)
		% Make it a subfolder of the folder where this m-file lives.
		outputFolder = sprintf('%s/Movie Frames from %s', folder, baseFileName);
		% Create the folder if it doesn't exist already.
		if ~exist(outputFolder, 'dir')
			mkdir(outputFolder);
		end
	else
		writeToDisk = false;
    end
    % Loop through the movie, writing all frames out.
	% Each frame will be in a separate file with unique name.
	meanGrayLevels = zeros(numberOfFrames, 1);
	meanRedLevels = zeros(numberOfFrames, 1);
	meanGreenLevels = zeros(numberOfFrames, 1);
	meanBlueLevels = zeros(numberOfFrames, 1);
	for frame = 1 : numberOfFrames
		% Extract the frame from the movie structure.
		thisFrame = read(videoObject, frame);
        
        %if frame == 1
         %   firstFrame = thisFrame;
        %end
       
		% Display it
		 % CHANGE THIS!!
		image(thisFrame);
        colormap(gray(256));
		caption = sprintf('Frame %4d of %d.', frame, numberOfFrames);
		title(caption, 'FontSize', 11);
		drawnow; % Force it to refresh the window.
		
		% Write the image array to the output file, if requested.
		if writeToDisk
			% Construct an output image file name.
			outputBaseFileName = sprintf('Frame %4.4d.png', frame);
			outputFullFileName = fullfile(outputFolder, outputBaseFileName);
			
			% Stamp the name and frame number onto the image.
			% At this point it's just going into the overlay,
			% not actually getting written into the pixel values.
			text(5, 15, outputBaseFileName, 'FontSize', 20);
			
			% Extract the image with the text "burned into" it.
			frameWithText = getframe(gca);
			% frameWithText.cdata is the image with the text
			% actually written into the pixel values.
			% Write it out to disk.
			imwrite(frameWithText.cdata, outputFullFileName, 'png');
		end
		
	end
close all;	
	
	