function saveAllFigure(numFig)
fprintf("Which device are you saving on? \n")
fprintf("\t (1) Desktop.\n");
fprintf("\t (2) Laptop.\n");
fprintf("\t (3) Only in current working folder.\n");
choice = input('Choose 1 - 3: ');

while choice ~= 1 && choice ~= 2 && choice ~= 3
    choice = input('Choose 1-3: ');
end

if choice == 1
    fname = 'D:\Bin\GSchool\OneDrive - George Mason University - O365 Production\S6_Fall23\ECE535\project2\Report\img\Part4';
    saveWithPath(fname,numFig)
    saveHere(numFig)
elseif choice == 2
    fname = 'C:\Users\lhngm\OneDrive - George Mason University - O365 Production\S6_Fall23\ECE535\project2\Report\img\Part4';
    saveWithPath(fname,numFig)
    saveHere(numFig)
elseif choice == 3
    saveHere(numFig)
end
end

function saveWithPath(fname,numFig)
for k = numFig:-1:1
    h=figure(k);
    %set(h,'PaperPosition',[0 0 3.2 4])
    filename = strcat(['fig', num2str(k)]);
    %saveas(h,filename)
    saveas(h, fullfile(fname, filename), 'fig');
end
end

function saveHere(numFig)
for k = 1:numFig
    %set(h,'PaperPosition',[0 0 3.2 4])
    h=figure(k);
    filename = strcat(['fig', num2str(k)]);
    saveas(gca, filename, 'fig');
end
end