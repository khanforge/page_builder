#include<bits/stdc++.h>
using namespace std;

void solve(vector<int> v, int n){
   set<int> s;
   vector<int> sorted(v.begin(), v.end());
   sort(sorted.rbegin(), sorted.rend());
   int total_w = n, res=0;
   for(int i=0; i<n; i++){
    int maxi = sorted[i];
    int tempw = 0;
    for(int j=0;j<n;j++){
        if(maxi==v[j] && s.find(j) == s.end()){
            s.insert(j);
            break;
        }
        if(s.find(j) == s.end() && tempw != 1){
            tempw++;
            s.insert(j);
        }
    }
    if(tempw>=1){
        if (total_w >= 2){
            res += 2*maxi;
            total_w -= 2;
        }
        else{
            res = maxi;
            total_w -=1;
        }
      
    }
    else{
        res = maxi;
        total_w -=1;
    }
        if(total_w<=0){
            break;
        }
   }
   cout<<res;
}

int main(){
    int t;
    cin>>t;
    while(t--){
        int n;
        cin>>n;
        vector<int> v(n);
        for(auto &i:v){
            cin>>i;
        }
        solve(v, n);
        cout<<endl;
    }
}