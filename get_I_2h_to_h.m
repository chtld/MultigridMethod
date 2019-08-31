 function I_2h_to_h = get_I_2h_to_h(n)
n1 = n - 1;
m1 = 2*n-1;
I_2h_to_h = zeros(m1*m1,n1*n1);
for p1 = 1:m1
    for p2 = 1:m1
        for q1 = 1:n1
            for q2 = 1:n1
                if p1/2 == q1 && p2/2 == q2
                    I_2h_to_h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1;
                end
                %%
                if (p1-1)/2 == q1 && p2/2 == q2
                    I_2h_to_h( (p1-1)*m1+p2, (q1-1  )*n1+q2 ) = 1/2;
                    if q1 ~= n1
                        I_2h_to_h( (p1-1)*m1+p2, (q1+1-1)*n1+q2 ) = 1/2;
                    end
                elseif (p1-1)/2 == 0 && p2/2 == q2
                    I_2h_to_h( (p1-1)*m1+p2, (0 +1-1)*n1+q2 ) = 1/2;
                end
                %%
                if p1/2 == q1 && (p2-1)/2 == q2
                    I_2h_to_h( (p1-1)*m1+p2, (q1-1)*n1+q2   ) = 1/2;
                    if q2 ~= n1
                        I_2h_to_h( (p1-1)*m1+p2, (q1-1)*n1+q2+1 ) = 1/2;
                    end
                elseif p1/2 == q1 && (p2-1)/2 == 0
                    I_2h_to_h( (p1-1)*m1+p2, (q1-1)*n1+0 +1 ) = 1/2;
                end
                %%
                if (p1-1)/2 == q1 && (p2-1)/2 == q2
                    I_2h_to_h( (p1-1)*m1+p2, (q1-1  )*n1+q2  ) = 1/4;
                    if q1 ~= n1 && q2 ~= n1
                        I_2h_to_h( (p1-1)*m1+p2, (q1-1  )*n1+q2+1) = 1/4;
                        I_2h_to_h( (p1-1)*m1+p2, (q1+1-1)*n1+q2  ) = 1/4;
                        I_2h_to_h( (p1-1)*m1+p2, (q1+1-1)*n1+q2+1) = 1/4;
                    elseif q2 ~= n1 && q2 == n1
                        I_2h_to_h( (p1-1)*m1+p2, (q1+1-1)*n1+q2  ) = 1/4;
                    elseif q1 == n1 && q2 ~= n1
                        I_2h_to_h( (p1-1)*m1+p2, (q1-1  )*n1+q2+1) = 1/4;                        
                    end
                elseif (p1-1)/2 == 0  && (p2-1)/2 == q2
                    I_2h_to_h( (p1-1)*m1+p2, (0 +1-1  )*n1+q2  ) = 1/4;
                    if q2 ~= n1
                        I_2h_to_h( (p1-1)*m1+p2, (0 +1-1  )*n1+q2+1) = 1/4;
                    end
                elseif (p1-1)/2 == q1  && (p2-1)/2 == 0
                    I_2h_to_h( (p1-1)*m1+p2, (q1  -1  )*n1+0 +1) = 1/4;
                    if q1 ~= n1
                        I_2h_to_h( (p1-1)*m1+p2, (q1+1-1  )*n1+0 +1) = 1/4;
                    end
                elseif (p1-1)/2 == 0  && (p2-1)/2 == 0
                    I_2h_to_h( (p1-1)*m1+p2, (0 +1-1  )*n1+0 +1) = 1/4;
                end
            end
        end
    end
end
I_2h_to_h = sparse(I_2h_to_h);