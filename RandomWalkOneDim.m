%% Random walk one dimension
% bulk catalase um/s
Dbulk = 41;
%radius of the cell in um
r  = 5/1000;
% Simulation time step (in s)
time_step = 1e-4;
% Total simulation time (in s)
total_time = 1; 
% Number of simulation steps
n_steps = round(total_time/time_step); 
%Numbers of catalase
Num = 10;
%initial postion
X0 = 0.01;
%aloocation postion cel
Pos = cell(Num,1);
%% walk walk

Con_Num = 0;
for j = 1:Num
    Pos{j} = zeros(n_steps,1);
    Pos{j}(1) = X0;
    i = 1;
    while i < n_steps
        DiffuCoeff = CollisionDiffu(Pos{j}(i),r,Dbulk);
        Step = sqrt(2 * DiffuCoeff  * time_step) * randn(1);
        if Pos{j}(i) + Step <= 0 + r
            %particle stay one time step
            Pos{j}(i + 1)  = r;
            DiffuCoeff = CollisionDiffu(r,r,Dbulk);
            Pos{j}(i + 2)  = Pos{j}(i + 1) + sqrt(2 * DiffuCoeff  * time_step) * abs(randn(1));
            fprintf(' %d th particle contact at %d step\n',j,i + 1);
            Con_Num = Con_Num + 1;
            i = i + 2;
        else
            Pos{j}(i + 1 )  = Pos{j}(i) + Step;
            i = i +1;
        end
    end
end
%% see how it looks like
TraceNum = 10;
figure;
plot([1:1:n_steps] * time_step, Pos{TraceNum},'square','MarkerSize',4,'Color','black','LineWidth',0.2)
xlabel('time[s]')
ylabel('Distance[um]')
set(gca,'FontName','Arial','FontSize',25,'FontWeight','bold')
%%
function Dcolli = CollisionDiffu(dis,r,Dbulk)
%Dcolli = CollisionDiffu(r,Dbulk)
%  distance-dependent diffusion coefficient Compton's paper
Dcolli = Dbulk * (6*dis.^2 + 2 * dis*r)./(6*dis.^2 + 9 * dis * r + 2 * r^2 );
end
