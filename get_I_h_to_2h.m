function I_h_to_2h = get_I_h_to_2h(n)
m1 = n/2-1;
n1 = n -1;
I_h_to_2h = zeros(m1*m1,n1*n1);
for p1 = 1:m1
    for p2 = 1:m1
        for q1 = 1:n1
            for q2 = 1:n1
                %%
                if 2*p1-1 == q1 && 2*p2-1 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/16;
                end
                if 2*p1-1 == q1 && 2*p2+1 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/16;
                end
                if 2*p1+1 == q1 && 2*p2-1 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/16;
                end
                if 2*p1+1 == q1 && 2*p2+1 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/16;
                end
                %%
                if 2*p1 == q1 && 2*p2-1 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/8;
                end
                if 2*p1 == q1 && 2*p2+1 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/8;
                end
                if 2*p1-1 == q1 && 2*p2 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/8;
                end
                if 2*p1+1 == q1 && 2*p2 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/8;
                end
                %%
                if 2*p1 == q1 && 2*p2 == q2
                    I_h_to_2h( (p1-1)*m1+p2, (q1-1)*n1+q2 ) = 1/4;
                end
            end
        end
    end
end
I_h_to_2h = sparse(I_h_to_2h);