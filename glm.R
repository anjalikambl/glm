y=rpois(15,3)
x1=runif(15,0,1)
x0=rep(1,15)
data=as.matrix(data.frame(y,x1,x0))
y1=data[,1]
x=data[,2:3]
v=diag(y)
b0=solve(t(x)%*%solve(v)%*%x)%*%t(x)%*%solve(v)%*%log(y1)
c=length(b0)
while(c>0.001){
  mu=exp(x%*%b0)
  v=diag(as.vector(1/mu))
  eta0=x%*%b0
  z1=t(eta0)+t(y1-mu)%*%diag(as.vector(1/mu))
  b1=solve(t(x)%*%solve(v)%*%x)%*%t(x)%*%solve(v)%*%t(z1)
  c=sum(abs(b1-b0))
  b0=b1
  
}
b1

summary(glm(y1~x1,family='poisson'))
